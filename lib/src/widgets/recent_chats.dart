import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:khud_mukhtar/src/screens/chat_screen.dart';

class RecentChats extends StatelessWidget {
  FirebaseUser currentUser;
  RecentChats({this.currentUser});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: StreamBuilder(
            stream: Firestore.instance.collection('Users').where('chattingWith',arrayContains: currentUser.uid).snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme
                            .of(context)
                            .primaryColor),
                  ),
                );
              } else {
                if (snapshot.data.documents.length == 0) {
                  return Center(child: Text('No messages found'));
                }
                return ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot document = snapshot.data.documents[index];
                    if (document['id'] == currentUser.uid) {
                      return Container();
                    } else {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Chat(
                                        peerId: document.documentID,
                                        peerAvatar: document['imageUrl'],
                                        id: currentUser.uid,
                                        peerName: document['name'],
                                      )));
                        },
                        child: Container(
                          margin:
                          EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Material(
                                    child: document['imageUrl'] != null
                                        ? CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          Container(
                                            child: CircularProgressIndicator(
                                              strokeWidth: 1.0,
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Theme
                                                      .of(context)
                                                      .primaryColor),
                                            ),
                                            width: 50.0,
                                            height: 50.0,
                                            padding: EdgeInsets.all(15.0),
                                          ),
                                      imageUrl: document['imageUrl'],
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    )
                                        : Icon(
                                      Icons.account_circle,
                                      size: 50.0,
                                      color: Theme
                                          .of(context)
                                          .primaryColor,
                                    ),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(25.0)),
                                    clipBehavior: Clip.hardEdge,
                                  ),
                                  SizedBox(width: 10.0),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>[
                                      Text(
                                        document['name'] == null
                                            ? 'noname'
                                            : document['name'],
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5.0),
                                      Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width *
                                            0.45,
                                        child: GetLastMessage(id: currentUser.uid,peerId: document.documentID,),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  GetLastMessageTime(id: currentUser.uid,peerId: document.documentID,),
                                  SizedBox(height: 5.0),
//                                chat.unread
//                                    ? Container(
//                                  width: 40.0,
//                                  height: 20.0,
//                                  decoration: BoxDecoration(
//                                    color: Colors.pink[300],
//                                    borderRadius: BorderRadius.circular(30.0),
//                                  ),
//                                  alignment: Alignment.center,
//                                  child: Text(
//                                    'NEW',
//                                    style: TextStyle(
//                                      color: Colors.white,
//                                      fontSize: 12.0,
//                                      fontWeight: FontWeight.bold,
//                                    ),
//                                  ),
//                                )
//                                    : Text(''),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
class GetLastMessage extends StatelessWidget {
  GetLastMessage({this.id,this.peerId});
  String id;
  String peerId;

  Future<String> lastMessage() async {
    String groupChatId;
    if (id.hashCode <= peerId.hashCode) {
      groupChatId = '$id-$peerId';
    } else {
      groupChatId = '$peerId-$id';
    }
    String lastMessage;
    var lastMessageDocumentQuery = await  Firestore.instance
        .collection('messages')
        .document(groupChatId)
        .collection(groupChatId)
        .orderBy('timestamp', descending: true)
        .limit(1).getDocuments();
    lastMessage=lastMessageDocumentQuery.documents[0]['content'];
    return lastMessage;
    }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:lastMessage() ,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Text(
              '${snapshot.data}',
              style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
          ),);
        }
        return Text('');
      },
    );
  }
}

class GetLastMessageTime extends StatelessWidget {
  GetLastMessageTime({this.id,this.peerId});
  String id;
  String peerId;
  Future<String> lastMessageTime() async {
    String groupChatId;
    if (id.hashCode <= peerId.hashCode) {
      groupChatId = '$id-$peerId';
    } else {
      groupChatId = '$peerId-$id';
    }
    String lastMessageTime;
    var lastMessageDocumentQuery = await  Firestore.instance
        .collection('messages')
        .document(groupChatId)
        .collection(groupChatId)
        .orderBy('timestamp', descending: true)
        .limit(1).getDocuments();
    lastMessageTime=lastMessageDocumentQuery.documents[0]['timestamp'];
    DateTime lastMessageTimeStamp = DateTime.fromMillisecondsSinceEpoch(int.parse(lastMessageTime));
    return DateFormat.jm().format(lastMessageTimeStamp);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:lastMessageTime() ,
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Text(
            snapshot.data.toString(),
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          );
        }
        return Text('10:08');
      },
    );
  }
}

