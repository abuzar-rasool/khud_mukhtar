import 'package:flutter/material.dart';
import 'package:khud_mukhtar/constants/colors.dart';

import 'package:khud_mukhtar/src/widgets/recent_chats.dart';

class HomeScreenChat extends StatefulWidget {
  @override
  _HomeScreenChatState createState() => _HomeScreenChatState();
}

class _HomeScreenChatState extends State<HomeScreenChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[300],
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.pink[300],

        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
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
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
