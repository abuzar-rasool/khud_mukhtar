import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
      Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(padding: EdgeInsets.all(8),
          child: Text("Please wait..",style: TextStyle(color: Colors.black,fontSize: 15),),)

        ],

      )
    ),);
  }
}
