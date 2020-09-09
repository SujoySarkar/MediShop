import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:medishop/ResponsiveDesign/sizeconfig.dart';
import 'package:medishop/UI/BottomNav/Pages/help.dart';
import 'package:medishop/UI/BottomNav/Pages/home.dart';
import 'package:medishop/UI/BottomNav/Pages/orderbycall.dart';
import 'package:medishop/UI/BottomNav/Pages/shoppingcart.dart';
import 'package:medishop/UI/BottomNav/Pages/uploadprescription.dart';
import 'package:medishop/logic/login.dart';
import 'package:provider/provider.dart';

class BottomNavController extends StatefulWidget {
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  
  
  int index = 0;
  final _pages = [
    HomePage(),
    OrderByCallPage(),
    UploadPrescription(),
    ShoppingCart(),
    HelpPage(),
  ];
  

  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<UserLogin>(context);


    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: MediaQuery.of(context).size.height / 13,
          index: 0,
          color: Colors.pink,
          buttonBackgroundColor: Colors.pink,
          backgroundColor: Colors.white24,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          items: [
            Icon(
              Icons.home,
              color: Colors.white,
            ),
            Icon(
              Icons.phone_in_talk,
              color: Colors.white,
            ),
            Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Icon(Icons.shopping_cart,color: Colors.white,),

                Positioned(

                    child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Checkout")
                      .document(providerdata.userid)
                      .collection("cartlist")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {

                      return CircleAvatar(backgroundColor: Colors.black87,radius: SizeConfig.screenheight*0.009,child: Text("${snapshot.data.documents.length}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: SizeConfig.screenheight*0.015),));
                    }
                    return Center(
                    );
                  },
                )),
              ],
            ),
            Icon(
              Icons.help,
              color: Colors.white,
            ),
          ],
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
        ),
        body: _pages[index],
      ),
    );
  }
}
