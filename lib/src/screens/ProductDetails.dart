import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key key}) : super(key: key);

  @override
  _ProductDetails createState() => _ProductDetails();

}

class _ProductDetails extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
  //  AssetImage logo = AssetImage('assets/logo.png');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(240, 98, 146, 1), leading: Icon(Icons.arrow_back), actions: Icon(),),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            width:MediaQuery
          )
        ],)
      )
      backgroundColor: Colors.white,
     );
  }
}
