import 'package:flutter/material.dart';
import 'package:medishop/ResponsiveDesign/sizeconfig.dart';
import 'package:medishop/UI/CustomWidget/custombutton.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(SizeConfig.screenwidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: SizeConfig.screenwidth/8,),
              Center(
                child: Container(
                  height: SizeConfig.screenheight / 10,
                  width: SizeConfig.screenwidth / 2,
                  child: Image.asset(
                    "images/splashlogo.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: SizeConfig.screenwidth/5,),
              Container(
                height: SizeConfig.screenheight / 13,
                width: SizeConfig.screenwidth,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF01BAFF))
                ),
                child: Padding(
                  padding:  EdgeInsets.only(left: SizeConfig.screenwidth*0.03,right: SizeConfig.screenwidth*0.03),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: SizeConfig.screenwidth*0.1,
                        child: Image.asset("images/bdflag.jpg"),
                      ),
                      SizedBox(width: SizeConfig.screenwidth*0.018,),
                      new Text(
                        "+880",
                        style: TextStyle(
                          fontFamily: "Segoe UI",fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.screenwidth*0.045,
                          color:Color(0xff000000),
                        ),
                      ),
                      SizedBox(width: SizeConfig.screenwidth*0.018,),
                      Expanded(
                        child: Container(
                          child: TextField(
                            keyboardType: TextInputType.number,

                            style: TextStyle(
                              fontFamily: "Segoe UI",fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.screenwidth*0.045,
                              color:Color(0xff000000),
                            ),

                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(
                                fontFamily: "Segoe UI",fontWeight: FontWeight.w600,
                                fontSize: SizeConfig.screenwidth*0.045,
                                color:Colors.black38,
                              ),
                            ),

                          ),
                        ),
                      ),



                    ],
                  ),
                ),

              ),
              SizedBox(height: SizeConfig.screenwidth*0.04,),
              CustomButton("Next"),



            ],
          ),
        )),
      ),
    );
  }
}
