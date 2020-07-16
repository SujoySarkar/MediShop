import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:medishop/ResponsiveDesign/sizeconfig.dart';
import 'package:medishop/UI/CustomWidgets/customItem.dart';
import 'package:medishop/UI/CustomWidgets/fetchcategory.dart';
import 'package:medishop/UI/CustomWidgets/textwidget.dart';
import 'package:medishop/UI/SeeAll/categoryone.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future getimgforCarousel() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn =
        await firestore.collection("Carousel-Images").getDocuments();
    return qn.documents;
  }

  @override
  void initState() {
    getimgforCarousel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                height: SizeConfig.screenheight / 5,
                width: SizeConfig.screenwidth,
                child: FutureBuilder(
                  future: getimgforCarousel(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CarouselSlider.builder(
                        enableAutoSlider: true,
                        unlimitedMode: true,
                        slideBuilder: (index) {
                          DocumentSnapshot sliderimages = snapshot.data[index];
                          return GestureDetector(
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                        SizeConfig.screenwidth * 0.06),
                                    bottomRight: Radius.circular(
                                        SizeConfig.screenwidth * 0.06)),
                                child: Image.network(
                                  sliderimages['img'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                        slideTransform: CubeTransform(
                          rotationAngle: 0,
                        ),
                        slideIndicator: CircularSlideIndicator(
                            indicatorBackgroundColor: Colors.white,
                            currentIndicatorColor: Colors.indigo,
                            padding: EdgeInsets.only(bottom: 10),
                            indicatorRadius: 4),
                        itemCount: snapshot.data.length,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.orange,
                      ));
                    }
                    return Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.orange,
                    ));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(SizeConfig.screenwidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FittedBox(
                      child: SingleChildScrollView(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomItem(
                              SizeConfig.screenwidth * 0.2,
                              SizeConfig.screenwidth * 0.35,
                              Icons.add_circle,
                              "Uplooad Prescription",
                              () {},
                            ),
                            SizedBox(
                              width: SizeConfig.screenwidth * 0.015,
                            ),
                            CustomItem(
                              SizeConfig.screenwidth * 0.2,
                              SizeConfig.screenwidth * 0.35,
                              Icons.phone_in_talk,
                              "Order By Call",
                              () {},
                            ),
                            SizedBox(
                              width: SizeConfig.screenwidth * 0.015,
                            ),
                            CustomItem(
                              SizeConfig.screenwidth * 0.2,
                              SizeConfig.screenwidth * 0.35,
                              Icons.add_comment,
                              "HealthCare Products",
                              () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.screenwidth * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FetchCategoryName(context, "0"),
                        SeeAllTextWidget(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryOne()));
                        }),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.screenwidth * 0.03,
                    ),
                    Container(
                      height: SizeConfig.screenheight / 5,
                      width: SizeConfig.screenwidth,
                      child: StreamBuilder(
                        stream: Firestore.instance
                            .collection("Category-one")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.documents.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot data =
                                    snapshot.data.documents[index];
                                return Card(
                                  elevation: 2,
                                  child: Container(
                                    width: SizeConfig.screenwidth / 3,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.green, width: 0.5),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          SizeConfig.screenwidth * 0.009),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Center(
                                            child: Container(
                                                height:
                                                    SizeConfig.screenwidth / 5,
                                                width:
                                                    SizeConfig.screenwidth / 4,
                                                child: Image.network(
                                                  data["Product-image"],
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          Text(
                                            data["Product-name"],
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: SizeConfig.screenwidth *
                                                  0.038,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "\৳${data["previous-price"]}",
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize:
                                                        SizeConfig.screenwidth *
                                                            0.03),
                                              ),
                                              Text(
                                                data["offer"],
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize:
                                                        SizeConfig.screenwidth *
                                                            0.03),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "\৳${data["after-offer-price"]}",
                                            style: TextStyle(
                                                fontSize:
                                                    SizeConfig.screenwidth *
                                                        0.04),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                          else if (snapshot.hasError) {
                            return Center(
                                child: CircularProgressIndicator(
                              backgroundColor: Colors.orange,
                            ));
                          }
                          return Center(
                              child: CircularProgressIndicator(
                            backgroundColor: Colors.orange,
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
