import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medishop/Logic/phoneauthlogic.dart';
import 'package:medishop/UI/SplashScreen/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ChangeNotifierProvider(
      create: (context)=>LoginwithPhone(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MediShop BD',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Splash(),
      ),
    );
  }
}
