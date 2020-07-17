import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:medishop/ResponsiveDesign/sizeconfig.dart';
import 'package:medishop/UI/CustomWidgets/customItem.dart';
import 'package:medishop/UI/CustomWidgets/fetchcategory.dart';
import 'package:medishop/UI/CustomWidgets/productlisthorizontal.dart';
import 'package:medishop/UI/CustomWidgets/textwidget.dart';
import 'package:medishop/UI/SeeAll/categoryeight.dart';
import 'package:medishop/UI/SeeAll/categoryfive.dart';
import 'package:medishop/UI/SeeAll/categoryfour.dart';
import 'package:medishop/UI/SeeAll/categorynine.dart';
import 'package:medishop/UI/SeeAll/categoryone.dart';
import 'package:medishop/UI/SeeAll/categoryseven.dart';
import 'package:medishop/UI/SeeAll/categorysix.dart';
import 'package:medishop/UI/SeeAll/categoryten.dart';
import 'package:medishop/UI/SeeAll/categorythree.dart';
import 'package:medishop/UI/SeeAll/categorytwo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double sizeboxheight = SizeConfig.screenwidth * 0.04;

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
                      height: sizeboxheight,
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
                    HorizontalProductsList("Category-one"),
                    SizedBox(
                      height: sizeboxheight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FetchCategoryName(context, "1"),
                        SeeAllTextWidget(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryTwo()));
                        }),
                      ],
                    ),
                    HorizontalProductsList("Category-two"),
                    SizedBox(
                      height: sizeboxheight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FetchCategoryName(context, "2"),
                        SeeAllTextWidget(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryThree()));
                        }),
                      ],
                    ),
                    HorizontalProductsList("Category-three"),
                    SizedBox(
                      height: sizeboxheight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FetchCategoryName(context, "3"),
                        SeeAllTextWidget(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryFour()));
                        }),
                      ],
                    ),
                    HorizontalProductsList("Category-four"),
                    SizedBox(
                      height: sizeboxheight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FetchCategoryName(context, "4"),
                        SeeAllTextWidget(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryFive()));
                        }),
                      ],
                    ),
                    HorizontalProductsList("Category-five"),
                    SizedBox(
                      height: sizeboxheight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FetchCategoryName(context, "5"),
                        SeeAllTextWidget(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategorySix()));
                        }),
                      ],
                    ),
                    HorizontalProductsList("Category-six"),
                    SizedBox(
                      height: sizeboxheight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FetchCategoryName(context, "6"),
                        SeeAllTextWidget(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategorySeven()));
                        }),
                      ],
                    ),
                    HorizontalProductsList("Category-seven"),
                    SizedBox(
                      height: sizeboxheight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FetchCategoryName(context, "7"),
                        SeeAllTextWidget(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryEight()));
                        }),
                      ],
                    ),
                    HorizontalProductsList("Category-eight"),
                    SizedBox(
                      height: sizeboxheight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FetchCategoryName(context, "8"),
                        SeeAllTextWidget(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryNine()));
                        }),
                      ],
                    ),
                    HorizontalProductsList("Category-nine"),
                    SizedBox(
                      height: sizeboxheight,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FetchCategoryName(context, "9"),
                        SeeAllTextWidget(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryTen()));
                        }),
                      ],
                    ),
                    HorizontalProductsList("Category-ten"),

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
