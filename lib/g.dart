import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RequestUttara extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Two(),
    );
  }
}

class Two extends StatefulWidget {
  @override
  _TwoState createState() => _TwoState();
}

class _TwoState extends State<Two> {

  //variables for camera and gallery 1
  File imagefile;
  var url;
  var urlcamera;

  Widget decideimage() {
    if (imagefile == null) {
      return Text("সিলেক্ট করুন");
    } else {
      return Image.file(
        imagefile,
        height: MediaQuery.of(context).size.height/4,
        width: MediaQuery.of(context).size.width/1.5,
        fit: BoxFit.cover,
      );
    }
  }
  Future<void> showdialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose any of them?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      onTap: () => showgallery(context),
                      child: Text("gallery")),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                      onTap: () => showcamera(context), child: Text("camera")),
                ],
              ),
            ),
          );
        });
  }
  showcamera(BuildContext context) async {
    var picturecamera = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imagefile = picturecamera;
    });
    Navigator.of(context).pop();
    _uploadImageToFirebaseforcamera(picturecamera);
  }
  Future<void> _uploadImageToFirebaseforcamera(File image) async {
    try {

      // Upload image to firebase.
      final StorageReference postimageref = FirebaseStorage.instance.ref().child("requestuttara");
      var timekey= DateTime.now();
      final StorageUploadTask uploadTask = postimageref.child(timekey.toString()+".jpg").putFile(image);
      var imageurl =await(await uploadTask.onComplete).ref.getDownloadURL();
      urlcamera=imageurl.toString();
      print(urlcamera);

    } catch (e) {
      print(e.message);
    }
  }
  showgallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imagefile = picture;
    });
    Navigator.of(context).pop();
    _uploadImageToFirebase(picture);

  }
  Future<void> _uploadImageToFirebase(File image) async {
    try {

      // Upload image to firebase.
      final StorageReference postimageref = FirebaseStorage.instance.ref().child("requestuttara");
      var timekey= DateTime.now();
      final StorageUploadTask uploadTask = postimageref.child(timekey.toString()+".jpg").putFile(image);
      var imageurl =await(await uploadTask.onComplete).ref.getDownloadURL();
      url=imageurl.toString();
      print(url);

    } catch (e) {
      print(e.message);
    }
  }


  //variables for camera and gallery 2
  File imagefiletwo;
  var urltwo;
  var urlcameratwo;
  Widget decideimagetwo() {
    if (imagefiletwo == null) {
      return Text("সিলেক্ট করুন");
    } else {
      return Image.file(
        imagefiletwo,
        height: MediaQuery.of(context).size.height/4,
        width: MediaQuery.of(context).size.width/1.5,
        fit: BoxFit.cover,
      );
    }
  }
  Future<void> showdialogtwo(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose any of them?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      onTap: () => showgallerytwo(context),
                      child: Text("gallery")),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                      onTap: () => showcameratwo(context), child: Text("camera")),
                ],
              ),
            ),
          );
        });
  }
  showcameratwo(BuildContext context) async {
    var picturecameratwo = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imagefiletwo = picturecameratwo;
    });
    Navigator.of(context).pop();
    _uploadImageToFirebaseforcameratwo(picturecameratwo);
  }
  showgallerytwo(BuildContext context) async {
    var picturetwo = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imagefiletwo = picturetwo;
    });
    Navigator.of(context).pop();
    _uploadImageToFirebasetwo(picturetwo);

  }
  Future<void> _uploadImageToFirebaseforcameratwo(File image) async {
    try {

      // Upload image to firebase.
      final StorageReference postimageref = FirebaseStorage.instance.ref().child("requestuttara");
      var timekey= DateTime.now();
      final StorageUploadTask uploadTask = postimageref.child(timekey.toString()+".jpg").putFile(image);
      var imageurl =await(await uploadTask.onComplete).ref.getDownloadURL();
      urlcameratwo=imageurl.toString();
      print(urlcameratwo);

    } catch (e) {
      print(e.message);
    }
  }
  Future<void> _uploadImageToFirebasetwo(File image) async {
    try {

      // Upload image to firebase.
      final StorageReference postimageref = FirebaseStorage.instance.ref().child("requestuttara");
      var timekey= DateTime.now();
      final StorageUploadTask uploadTask = postimageref.child(timekey.toString()+".jpg").putFile(image);
      var imageurl =await(await uploadTask.onComplete).ref.getDownloadURL();
      urltwo=imageurl.toString();
      print(urltwo);

    } catch (e) {
      print(e.message);
    }
  }

  //variables for camera and gallery 3
  File imagefilethree;
  var urlthree;
  var urlcamerathree;
  Widget decideimagethree() {
    if (imagefilethree == null) {
      return Text("সিলেক্ট করুন");
    } else {
      return Image.file(
        imagefilethree,
        height: MediaQuery.of(context).size.height/4,
        width: MediaQuery.of(context).size.width/1.5,
        fit: BoxFit.cover,
      );
    }
  }
  Future<void> showdialogthree(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose any of them?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      onTap: () => showgallerythree(context),
                      child: Text("gallery")),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                      onTap: () => showcamerathree(context), child: Text("camera")),
                ],
              ),
            ),
          );
        });
  }
  showcamerathree(BuildContext context) async {
    var picturecamerathree = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imagefilethree = picturecamerathree;
    });
    Navigator.of(context).pop();
    _uploadImageToFirebaseforcamerathree(picturecamerathree);
  }
  showgallerythree(BuildContext context) async {
    var picturethree = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imagefilethree = picturethree;
    });
    Navigator.of(context).pop();
    _uploadImageToFirebasethree(picturethree);

  }
  Future<void> _uploadImageToFirebaseforcamerathree(File image) async {
    try {

      // Upload image to firebase.
      final StorageReference postimageref = FirebaseStorage.instance.ref().child("requestuttara");
      var timekey= DateTime.now();
      final StorageUploadTask uploadTask = postimageref.child(timekey.toString()+".jpg").putFile(image);
      var imageurl =await(await uploadTask.onComplete).ref.getDownloadURL();
      urlcamerathree=imageurl.toString();
      print(urlcamerathree);

    } catch (e) {
      print(e.message);
    }
  }
  Future<void> _uploadImageToFirebasethree(File image) async {
    try {

      // Upload image to firebase.
      final StorageReference postimageref = FirebaseStorage.instance.ref().child("requestuttara");
      var timekey= DateTime.now();
      final StorageUploadTask uploadTask = postimageref.child(timekey.toString()+".jpg").putFile(image);
      var imageurl =await(await uploadTask.onComplete).ref.getDownloadURL();
      urlthree=imageurl.toString();
      print(urlthree);

    } catch (e) {
      print(e.message);
    }
  }


//variables for camera and gallery 4
  File imagefilefour;
  var urlfour;
  var urlcamerafour;
  Widget decideimagefour() {
    if (imagefilefour == null) {
      return Text("সিলেক্ট করুন");
    } else {
      return Image.file(
        imagefilefour,
        height: MediaQuery.of(context).size.height/4,
        width: MediaQuery.of(context).size.width/1.5,
        fit: BoxFit.cover,
      );
    }
  }
  Future<void> showdialogfour(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose any of them?"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                      onTap: () => showgalleryfour(context),
                      child: Text("gallery")),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                      onTap: () => showcamerafour(context), child: Text("camera")),
                ],
              ),
            ),
          );
        });
  }
  showcamerafour(BuildContext context) async {
    var picturecamerafour = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imagefilefour = picturecamerafour;
    });
    Navigator.of(context).pop();
    _uploadImageToFirebaseforcamerafour(picturecamerafour);
  }
  showgalleryfour(BuildContext context) async {
    var picturefour = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imagefilefour = picturefour;
    });
    Navigator.of(context).pop();
    _uploadImageToFirebasefour(picturefour);

  }
  Future<void> _uploadImageToFirebaseforcamerafour(File image) async {
    try {

      // Upload image to firebase.
      final StorageReference postimageref = FirebaseStorage.instance.ref().child("requestuttara");
      var timekey= DateTime.now();
      final StorageUploadTask uploadTask = postimageref.child(timekey.toString()+".jpg").putFile(image);
      var imageurl =await(await uploadTask.onComplete).ref.getDownloadURL();
      urlcamerafour=imageurl.toString();
      print(urlcamerafour);

    } catch (e) {
      print(e.message);
    }
  }
  Future<void> _uploadImageToFirebasefour(File image) async {
    try {

      // Upload image to firebase.
      final StorageReference postimageref = FirebaseStorage.instance.ref().child("requestuttara");
      var timekey= DateTime.now();
      final StorageUploadTask uploadTask = postimageref.child(timekey.toString()+".jpg").putFile(image);
      var imageurl =await(await uploadTask.onComplete).ref.getDownloadURL();
      urlfour=imageurl.toString();
      print(urlfour);

    } catch (e) {
      print(e.message);
    }
  }


  // save everything in cloud firestore
  void savetodatabase(){
    var dbTimekey=new DateTime.now();
    var formatDate=new DateFormat('MMM d,yyyy');
    var formatTime=new DateFormat('EEEE hh:mm,aaa');

    String date=formatDate.format(dbTimekey);
    String time=formatTime.format(dbTimekey);

    Firestore.instance.collection("UttaraRequest").document().setData({
      "galleryimage1":url,
      "galleryimage2":urltwo,
      "galleryimage3":urlthree,
      "galleryimage4":urlfour,
      "cameraimage1":urlcamera,
      "cameraimage2":urlcameratwo,
      "cameraimage3":urlcamerathree,
      "cameraimage4":urlcamerafour,
      "name":_apnarnameController.text,
      "address":_addressController.text,
      "details":_bistaritoController.text,
      "facilities":_suvidaController.text,
      "price":_varatakaController.text,
      "WhichMonth":_monthController.text,
      "Phonenumber":_numberController.text,
      "email":_emailController.text,
      "date":date,
      "Time":time
    });


  }

  final TextEditingController _apnarnameController = new TextEditingController();
  final TextEditingController _addressController = new TextEditingController();
  final TextEditingController _bistaritoController = new TextEditingController();
  final TextEditingController _suvidaController = new TextEditingController();
  final TextEditingController _varatakaController = new TextEditingController();
  final TextEditingController _monthController = new TextEditingController();
  final TextEditingController _numberController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();

  final _key1 = GlobalKey<FormState>();
  final _key2 = GlobalKey<FormState>();
  final _key3 = GlobalKey<FormState>();
  final _key4 = GlobalKey<FormState>();
  final _key5 = GlobalKey<FormState>();
  final _key6 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          label: Text("আপলোড করুন"),
          icon: Icon(Icons.cloud_upload),
          onPressed: (){

            savetodatabase();



          }),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: ListView(

            children: <Widget>[
              Text(
                "আপনার বাসার ছবি সিলেক্ট করুন",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    // image upload
                    GestureDetector(
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              decideimage()
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        showdialog(context);
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              decideimagetwo()
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        showdialogtwo(context);
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              decideimagethree()
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        showdialogthree(context);
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        elevation: 5,
                        child: Container(
                          height: MediaQuery.of(context).size.height/4,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              decideimagefour()
                            ],
                          ),
                        ),
                      ),
                      onTap: (){
                        showdialogfour(context);
                      },
                    ),

                    // form fill up



                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width/15,),
              Text(
                "আপনার নাম",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.height/20),
                height: MediaQuery.of(context).size.height/11,
                width: MediaQuery.of(context).size.width/3,
                child: Form(
                  key: _key1,
                  child: TextFormField(

                      validator: (value){
                        if(value.isEmpty){
                          return "আপনার নাম লিখুন";
                        }
                        else if (value.length<5){
                          return "পুরো নাম লিখুন";
                        }
                        else return null;
                      },

                      controller: _apnarnameController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.red,
                      cursorRadius: Radius.circular(10.0),
                      cursorWidth: 5.0,


                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromRGBO(
                                    222, 218, 218, 1))),
                        fillColor:
                        Color.fromRGBO(222, 218, 218, 1),
                        filled: true,
                      ),
                      autocorrect: false,
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)


                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width/20,),
              Text(
                "আপনার বাসার ঠিকানা দিন",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.height/20),
                height: MediaQuery.of(context).size.height/11,
                width: MediaQuery.of(context).size.width/3,
                child: Form(
                  key: _key2,
                  child: TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return "বাসার ঠিকানা দিন";
                        }
                        else if (value.length<5){
                          return "বাসার ঠিকানা দিন";
                        }
                        else return null;
                      },
                      controller: _addressController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.red,
                      cursorRadius: Radius.circular(10.0),
                      cursorWidth: 5.0,


                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromRGBO(
                                    222, 218, 218, 1))),
                        fillColor:
                        Color.fromRGBO(222, 218, 218, 1),
                        filled: true,
                      ),
                      autocorrect: false,
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)

                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width/20,),
              Text(
                "বিস্তারিত বর্ণনা দিন",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.height/20),
                height: MediaQuery.of(context).size.height/3,

                child: Form(
                  key: _key3,
                  child: TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return "বর্ণনা দিন";
                        }
                        else if (value.length<10){
                          return "পবর্ণনা দিন";
                        }
                        else return null;
                      },
                      maxLines: 5,
                      controller: _bistaritoController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.red,
                      cursorRadius: Radius.circular(10.0),
                      cursorWidth: 5.0,


                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromRGBO(
                                    222, 218, 218, 1))),
                        fillColor:
                        Color.fromRGBO(222, 218, 218, 1),
                        filled: true,
                      ),
                      autocorrect: false,
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)

                  ),
                ),
              ),
              Text(
                "সুবিধাগুলো লিখুন",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.height/20),
                height: MediaQuery.of(context).size.height/11,
                width: MediaQuery.of(context).size.width/3,
                child: TextFormField(

                    controller: _suvidaController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.red,
                    cursorRadius: Radius.circular(10.0),
                    cursorWidth: 5.0,


                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color.fromRGBO(
                                  222, 218, 218, 1))),
                      fillColor:
                      Color.fromRGBO(222, 218, 218, 1),
                      filled: true,
                    ),
                    autocorrect: false,
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)

                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width/20,),
              Text(
                "ভাড়ার পরিমান উল্লেখ করুন",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.height/20),
                height: MediaQuery.of(context).size.height/11,
                width: MediaQuery.of(context).size.width/3,
                child: TextFormField(

                    controller: _varatakaController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.red,
                    cursorRadius: Radius.circular(10.0),
                    cursorWidth: 5.0,


                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(
                              color: Color.fromRGBO(
                                  222, 218, 218, 1))),
                      fillColor:
                      Color.fromRGBO(222, 218, 218, 1),
                      filled: true,
                    ),
                    autocorrect: false,
                    style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)

                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width/20,),
              Text(
                "কোন মাসে ভাড়াটিয়া চাচ্ছেন",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.height/20),
                height: MediaQuery.of(context).size.height/11,
                width: MediaQuery.of(context).size.width/3,
                child: Form(
                  key: _key4,
                  child: TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return "মাসের নাম লিখুন";
                        }

                        else return null;
                      },
                      controller: _monthController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.red,
                      cursorRadius: Radius.circular(10.0),
                      cursorWidth: 5.0,


                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromRGBO(
                                    222, 218, 218, 1))),
                        fillColor:
                        Color.fromRGBO(222, 218, 218, 1),
                        filled: true,
                      ),
                      autocorrect: false,
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)

                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width/20,),
              Text(
                "আপনার ফোন নাম্বার দিন",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(

                margin: EdgeInsets.only(right: MediaQuery.of(context).size.height/20),
                height: MediaQuery.of(context).size.height/11,
                width: MediaQuery.of(context).size.width/3,
                child: Form(
                  key: _key5,
                  child: TextFormField(
                      validator: (value){
                        if(value.isEmpty){
                          return "ফোন নাম্বার দিন";
                        }
                        else if (value.length<5){
                          return "সঠিক নাম্বার দিন";
                        }
                        else return null;
                      },
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.red,
                      cursorRadius: Radius.circular(10.0),
                      cursorWidth: 5.0,


                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromRGBO(
                                    222, 218, 218, 1))),
                        fillColor:
                        Color.fromRGBO(222, 218, 218, 1),
                        filled: true,
                      ),
                      autocorrect: false,
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)

                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width/20,),
              Text(
                "আপনার ইমেইল দিন",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                margin: EdgeInsets.only(right: MediaQuery.of(context).size.height/20),
                height: MediaQuery.of(context).size.height/11,
                width: MediaQuery.of(context).size.width/3,
                child: Form(
                  key: _key6,
                  child: TextFormField(

                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.red,
                      cursorRadius: Radius.circular(10.0),
                      cursorWidth: 5.0,


                      decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(
                                color: Color.fromRGBO(
                                    222, 218, 218, 1))),
                        fillColor:
                        Color.fromRGBO(222, 218, 218, 1),
                        filled: true,
                      ),
                      autocorrect: false,
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)

                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width/3,),

            ],
          ),
        ),
      ),
    );
  }
}