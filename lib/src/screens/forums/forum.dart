import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/screens/NotificationScreen/data.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/drawer/oval-right-clipper.dart';
import 'package:khud_mukhtar/src/screens/forums/forumpost.dart';


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
          child: ListView(
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context) {
                        return ForumDetailPage();
                      }));
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('How to prepare your kids for O-Levels'),
                    subtitle: Text('A forum on preparing kids for O-levels'),
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('Best recipes by Shireen Anwer'),
                    subtitle: Text('See how Shireen Anwer cooks delicious meals'),

                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.message),
                    title: Text('How to prepare your kids for O-Levels'),
                    subtitle: Text('A forum on preparing kids for O-levels'),
                  ),
                ),
              ),

            ],
          ),
        ),
      )
    );
  }
}

