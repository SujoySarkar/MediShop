import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medishop/ProductDetails/checkout.dart';
import 'package:medishop/ResponsiveDesign/sizeconfig.dart';

class Details extends StatefulWidget {
  DocumentSnapshot data;
  Details(this.data);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Details"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => Checkout()));
            },
            icon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            widget.data['Product-image'] == null
                ? Text("Image Loading")
                : Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Container(
                        height: 250,
                        width: 400,
                        child: Image.network(
                          widget.data['Product-image'],
                          fit: BoxFit.cover,
                        )),
                  ),
            Center(
              child: widget.data["Product-name"] == null
                  ? Center(
                      child: Text("Loading"),
                    )
                  : Text(
                      widget.data["Product-name"],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: SizeConfig.screenwidth * 0.038,
                      ),
                    ),
            ),
            Center(
              child: widget.data["Product-description"] == null
                  ? Center(
                      child: Text("Loading"),
                    )
                  : Text(
                      widget.data["Product-description"],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: SizeConfig.screenwidth * 0.038,
                      ),
                    ),
            ),
            Center(
              child: widget.data["after-offer-price"] == null
                  ? Center(
                      child: Text("Loading"),
                    )
                  : Text(
                      widget.data["after-offer-price"],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: SizeConfig.screenwidth * 0.038,
                      ),
                    ),
            ),
            Text("Quantity"),
            Text(quantity.toString()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                  child: Text("+"),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(
                      () {
                        quantity--;
                      },
                    );
                  },
                  child: Text("-"),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text("add"),
            ),
          ],
        ),
      ),
    );
  }
}
