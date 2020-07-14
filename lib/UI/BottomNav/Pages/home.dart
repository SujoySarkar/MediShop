import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:medishop/ResponsiveDesign/sizeconfig.dart';
import 'package:medishop/UI/CustomWidgets/customItem.dart';

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
                                        SizeConfig.screenwidth * 0.08),
                                    bottomRight: Radius.circular(
                                        SizeConfig.screenwidth * 0.08)),
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
                padding: EdgeInsets.all(SizeConfig.screenwidth*0.03),
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
                                Icons.add,
                                "Uplooad Prescription",
                                () {},),
                            CustomItem(
                                SizeConfig.screenwidth * 0.2,
                                SizeConfig.screenwidth * 0.35,
                                Icons.call,
                                "Order By Call",
                                () {},),
                            CustomItem(
                                SizeConfig.screenwidth * 0.2,
                                SizeConfig.screenwidth * 0.35,
                                Icons.add_comment,
                                "Request Medicine",
                                () {},),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenwidth*0.03,),
                    Text("Categories",style: TextStyle(fontWeight: FontWeight.bold,fontSize: SizeConfig.screenwidth*0.04),),
                    SizedBox(height: SizeConfig.screenwidth*0.03,),

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
