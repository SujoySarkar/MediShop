import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medishop/ResponsiveDesign/sizeconfig.dart';

Widget FetchCategoryName(BuildContext context, String documentid) {

  return new StreamBuilder(
      stream: Firestore.instance
          .collection('Categories')
          .document(documentid)
          .snapshots(),
      builder: (context, snapshot) {
        var userDocument = snapshot.data;
        return userDocument == null
            ? Text("")
            : Text(
                userDocument["name"],
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: SizeConfig.screenwidth * 0.042,
                    color: Colors.black),
              );
      });
}
