import 'package:flutter/material.dart';
import 'package:medishop/ResponsiveDesign/sizeconfig.dart';

Widget SeeAllTextWidget(Function onPressed) {
  return GestureDetector(
    child: Text(
      "See All",
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: SizeConfig.screenwidth * 0.045,
          color: Colors.red),
    ),
    onTap: onPressed,
  );
}
