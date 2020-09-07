import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medishop/ResponsiveDesign/sizeconfig.dart';
import 'package:medishop/logic/login.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<UserLogin>(context);
    return Scaffold(
      body: SafeArea(child: StreamBuilder(
        stream: Firestore.instance.collection("Checkout").document(providerdata.userid).collection("cartlist").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot dataa = snapshot.data.documents[index];
                return Card(
                  elevation: 2,
                  child: Container(
                    height: SizeConfig.screenheight/5,
                    width: SizeConfig.screenwidth,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 0.5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(SizeConfig.screenwidth * 0.015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[

                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Center(
                                child: Container(
                                    height: SizeConfig.screenwidth / 5,
                                    width: SizeConfig.screenwidth / 4,
                                    child: dataa["Product-image"] == null
                                        ? Center(
                                      child: Text("Loading"),
                                    )
                                        : Image.network(
                                      dataa["Product-image"],
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(icon: Icon(Icons.delete,color: Colors.grey,
                                  size: SizeConfig.screenheight*0.03,), onPressed: ()async{

                                        setState(() {
                                          Firestore.instance.collection("Checkout").document(providerdata.userid).collection("cartlist").document().delete();

                                        });

                                }),
                              ),
                            ],
                          ),
                          dataa["product-name"] == null
                              ? Center(
                            child: Text("Loading"),
                          )
                              : Text(
                            dataa["product-name"],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: SizeConfig.screenwidth * 0.038,
                            ),
                          ),

                          Text(
                            "\৳${dataa["after-offer-price"]}",
                            style: TextStyle(
                                fontSize: SizeConfig.screenwidth * 0.042,
                                color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else if (snapshot.hasError) {
            return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.orange,
                ));
          }
          return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
              ));
        },
      ),),
    );
  }
}
