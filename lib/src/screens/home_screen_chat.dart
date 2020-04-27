import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/widgets/loading.dart';
import 'package:khud_mukhtar/src/widgets/recent_chats.dart';

class HomeScreenChat extends StatefulWidget {
  @override
  _HomeScreenChatState createState() => _HomeScreenChatState();
}

class _HomeScreenChatState extends State<HomeScreenChat> {
  FirebaseUser currentUser;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: Colors.pink[300],
              appBar: AppBar(
                backgroundColor: Colors.pink[300],
                title: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Chats',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                elevation: 0.0,

              ),
              body: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.pink[300],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          RecentChats(currentUser: snapshot.data,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return LoadingView();
        }
    );
  }
}
