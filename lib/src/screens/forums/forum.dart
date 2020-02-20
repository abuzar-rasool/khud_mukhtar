import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/screens/NotificationScreen/data.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/drawer/oval-right-clipper.dart';


import '../home_screen.dart';
import '../profile_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

class Forums extends StatefulWidget {
  @override
  _Forums createState() => _Forums();
}

class _Forums extends State<Forums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(

        title: Text(
          "Forums",
        ),
        centerTitle: true,

      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child:Container(alignment:Alignment.center
                ,child: Text('COMING SOON!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50,color: Colors.pink[300]),))
            ,
          ),
        ),
      )
    );
  }
}

