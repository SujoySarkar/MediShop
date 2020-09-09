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

  double total = 0.0;
  void queryValues(String uid) {
    Firestore.instance
        .collection("Checkout")
        .document(uid)
        .collection("cartlist")
        .snapshots()
        .listen((snapshot) {
      double tempTotal = snapshot.documents.fold(0, (tot, doc) => tot + doc.data['after-offer-price']);
      setState(() {total = tempTotal;});
      debugPrint(total.toString());
    });
  }



  @override
  Widget build(BuildContext context) {
    final providerdata = Provider.of<UserLogin>(context);
    queryValues(providerdata.userid);



    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text("Selected Items"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 10,
                child: Container(
                  child: StreamBuilder(
                    stream: Firestore.instance
                        .collection("Checkout")
                        .document(providerdata.userid)
                        .collection("cartlist")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot dataa =
                                snapshot.data.documents[index];

                            return Card(
                              elevation: 2,
                              child: ListTile(
                                leading: Container(
                                  height: SizeConfig.screenheight * 0.2,
                                  width: SizeConfig.screenwidth * 0.2,
                                  child: Image.network(
                                    dataa["Product-image"],
                                  ),
                                ),
                                title: Text(
                                  dataa["product-name"],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: SizeConfig.screenwidth * 0.038,
                                  ),
                                ),
                                subtitle: Text(
                                  "\৳${dataa["after-offer-price"]}",
                                  style: TextStyle(
                                      fontSize: SizeConfig.screenwidth * 0.042,
                                      color: Colors.blue),
                                ),
                                trailing: IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.grey,
                                      size: SizeConfig.screenheight * 0.03,
                                    ),
                                    onPressed: () async {
                                      setState(() {
                                        Firestore.instance
                                            .collection("Checkout")
                                            .document(providerdata.userid)
                                            .collection("cartlist")
                                            .document(snapshot.data
                                                .documents[index].documentID)
                                            .delete();
                                      });
                                    }),
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
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
                  ),
                )),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: SizeConfig.screenwidth / 2.2,
                    color: Colors.green,
                    child: Column(
                      children: <Widget>[
                        Center(child: Text("Total: $total")),
                        //Text("Delivery Charge : ${}"),

                      ],
                    ),
                  ),
                  Container(
                    width: SizeConfig.screenwidth / 2.2,
                    color: Colors.cyan,
                    child: Column(
                      children: <Widget>[],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
