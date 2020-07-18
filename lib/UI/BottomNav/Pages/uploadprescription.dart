import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medishop/ResponsiveDesign/sizeconfig.dart';

class UploadPrescription extends StatefulWidget {
  @override
  _UploadPrescriptionState createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {



   File imageone;
   File imagetwo;
   Future ChooseFromCameraOne() async {
     final pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);
     setState(() {
       imageone=pickedFile;
     });

   }
   Future ChooseFromGalleryOne() async {
     final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
     setState(() {
       imageone=pickedFile;
     });

   }

   Future ChooseFromCameraTwo() async {
     final pickedFile = await ImagePicker.pickImage(source: ImageSource.camera);
     setState(() {
       imagetwo=pickedFile;
     });

   }
   Future ChooseFromGalleryTwo() async {
     final pickedFile = await ImagePicker.pickImage(source: ImageSource.gallery);
     setState(() {
       imagetwo=pickedFile;
     });

   }

   LocationData myLocation;


   getUserLocation() async {//call this async method from whereever you need

    String error;
    Location location = new Location();
    try {
      myLocation = await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'please grant permission';
        print(error);
      }
      if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'permission denied- please enable it from app settings';
        print(error);
      }
      myLocation = null;
    }
    // currentLocation = myLocation;
    final coordinates = new Coordinates(
        myLocation.latitude, myLocation.longitude);
    print(coordinates);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    var first = addresses.first;
    print(' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    return first;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        getUserLocation();
      }),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(SizeConfig.screenwidth * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                "Upload Prescription",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: SizeConfig.screenwidth * 0.07),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenwidth * 0.01,
            ),
            Text(
              "দয়া করে সতর্কতার সাথে আপনার তথ্য গুলো পূরণ করুন। আমরা আপনার তথ্য গুলা অন্য কারো সাথে শেয়ার করবো না।",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: SizeConfig.screenwidth * 0.032),
            ),
            SizedBox(
              height: SizeConfig.screenwidth * 0.07,
            ),
            Text(
              "Choose Prescription Images",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: SizeConfig.screenwidth * 0.04,
                  color: Colors.blueGrey),
            ),
            SizedBox(
              height: SizeConfig.screenwidth * 0.015,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: SizeConfig.screenheight / 4,
                  width: SizeConfig.screenwidth / 2.4,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2),
                      ),
                  child:imageone==null?
                   Center(
                    child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                          size: SizeConfig.screenwidth * 0.1,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  color: Colors.black45,
                                  height: SizeConfig.screenheight / 4,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Card(
                                            child: ListTile(
                                              title: Text("Camera"),
                                              leading: Icon(Icons.camera),
                                              onTap: (){
                                                ChooseFromCameraOne();
                                              },
                                            ),
                                            elevation: 6,
                                          ),
                                          Card(
                                            child: ListTile(
                                              title: Text("Gallery"),
                                              leading: Icon(Icons.photo_library),
                                              onTap: (){
                                                ChooseFromGalleryOne();

                                              },
                                            ),
                                            elevation: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }),
                  ):Image.file(imageone,fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: SizeConfig.screenheight / 4,
                  width: SizeConfig.screenwidth / 2.4,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2),
                      ),
                  child:imagetwo==null?
                   Center(
                    child: IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                          size: SizeConfig.screenwidth * 0.1,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  color: Colors.black45,
                                  height: SizeConfig.screenheight / 4,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 10),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Card(
                                            child: ListTile(
                                              title: Text("Camera"),
                                              leading: Icon(Icons.camera),
                                              onTap: (){
                                                ChooseFromCameraTwo();
                                              },
                                            ),
                                            elevation: 6,
                                          ),
                                          Card(
                                            child: ListTile(
                                              title: Text("Gallery"),
                                              leading: Icon(Icons.photo_library),
                                              onTap: (){
                                                ChooseFromGalleryTwo();

                                              },
                                            ),
                                            elevation: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        }),
                  ):Image.file(imagetwo,fit: BoxFit.cover,
                  ),
                ),


              ],
            ),
          ],
        ),
      )),
    );
  }
//
//  var location = new Location();
//  Map<String, double> userLocation;
//  Future<Map<String, double>> _getLocation() async {
//    var currentLocation = <String, double>{};
//    try {
//      currentLocation = await location.getLocation();
//      print(currentLocation);
//    } catch (e) {
//      currentLocation = null;
//    }
//    return currentLocation;
//  }
}



