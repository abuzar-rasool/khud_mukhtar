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
      appBar: AppBar(backgroundColor: Color.fromRGBO(240, 98, 146, 1), leading: Icon(Icons.arrow_back), actions: <Widget>[ Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.save),
      ),],),
      backgroundColor: Colors.white,
     );
  }
}
