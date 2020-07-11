import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:medishop/ResponsiveDesign/sizeconfig.dart';
import 'package:medishop/UI/LoginScreen/loginpage.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.green
    ));
    super.initState();
  }
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset(assetName, width: SizeConfig.screenwidth/1.5),
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: IntroductionScreen(
            globalBackgroundColor: Colors.transparent,

            key: introKey,
            pages: [
              PageViewModel(
                title: "আপলোড প্রেসক্রিপশন",
                body:
                "Instead of having to buy an entire share, invest any amount you want.",
                image: _buildImage("images/uploadprescription.jpg"),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "হোম ডেলিভারী",
                body:
                "Download the Stockpile app and master the market with our mini-lesson.",
                image: _buildImage('images/homedelivery.jpg'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "অফার",
                body:
                "Kids and teens can track their stocks 24/7 and place trades that you approve.",
                image: _buildImage('images/offer.jpg'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "মেডিসিন কালেকশন",
                body: "Another beautiful body text for this example onboarding",
                image: _buildImage('images/medicines.png'),
                decoration: pageDecoration,
              ),
              PageViewModel(
                title: "ক্যাশ অন ডেলিভারি",
                bodyWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Click on ", style: bodyStyle),
                    Icon(Icons.edit),
                    Text(" to edit a post", style: bodyStyle),
                  ],
                ),
                image: _buildImage('images/cashondelivery.png'),
                decoration: pageDecoration,
              ),
            ],
            onDone: () => _onIntroEnd(context),
            //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
            showSkipButton: true,
            skipFlex: 0,
            nextFlex: 0,
            skip: const Text('Skip'),
            next: const Icon(Icons.arrow_forward),
            done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: const DotsDecorator(
              size: Size(10.0, 10.0),
              color: Color(0xFFBDBDBD),
              activeSize: Size(22.0, 10.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
