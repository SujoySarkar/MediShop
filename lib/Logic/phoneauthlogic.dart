import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medishop/UI/BottomNav/bottomnavcontroller.dart';


class LoginwithPhone extends ChangeNotifier {
  final countrycode = "+880";
  final _codeController = TextEditingController();

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
        phoneNumber: countrycode + phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          AuthResult result = await _auth.signInWithCredential(credential);
          FirebaseUser user = result.user;

          if (user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BottomNavController()));
          } else {
            print("Error");
          }
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: CupertinoAlertDialog(
                      title: Text("Give the code?"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TextField(
                            controller: _codeController,
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        RaisedButton(
                          child: Text("Confirm"),
                          textColor: Colors.white,
                          color: Colors.blue,
                          onPressed: () async {
                            final code = _codeController.text.trim();
                            AuthCredential credential =
                                PhoneAuthProvider.getCredential(
                                    verificationId: verificationId,
                                    smsCode: code);

                            AuthResult result =
                                await _auth.signInWithCredential(credential);
                            FirebaseUser user = result.user;

                            if (user != null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavController()));
                            }
                          },
                        ),
                        RaisedButton(
                          child: Text("Back"),
                          textColor: Colors.white,
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        verificationFailed: (AuthException exception) {
          showDialog(
              context: context,
              builder: (context) {
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: CupertinoAlertDialog(
                      title: Text("Failed"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text("You are not Verified"),
                        ],
                      ),
                      actions: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavController()));
                          },
                          child: Text("Skip for now"),
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }
}
