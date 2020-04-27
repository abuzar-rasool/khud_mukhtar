import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/card/all_services_card.dart';
import 'package:khud_mukhtar/src/models/message_model.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';
import 'package:khud_mukhtar/src/screens/Add_Service.dart';
import 'package:khud_mukhtar/src/screens/service_single.dart';
import 'package:khud_mukhtar/src/widgets/loading.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

class Profile extends StatefulWidget {
  var currentUserId;
  var userID;

  Profile({this.userID, this.currentUserId});

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var userID = widget.userID;
    var currentUserId = widget.currentUserId;
    // TODO: implement build
    return Scaffold(
      appBar: MyCustomAppBar(
        userID: userID,
        currentUserId: currentUserId,
      ),
      floatingActionButton: userID == currentUserId
          ? FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(240, 98, 146, 1),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddService()));
        },
      )
          : null,
      body: SafeArea(
          child: SingleChildScrollView(
            //scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomListView(
                              userID: userID,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class MyCustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String userID;
  final String currentUserId;

  MyCustomAppBar({this.userID, this.currentUserId});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(250);

  @override
  _MyCustomAppBarState createState() => _MyCustomAppBarState();
}

class _MyCustomAppBarState extends State<MyCustomAppBar> {
  Future getID() async {
    print("Getting uid");
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  Future getUserData() async {
    var userID = widget.userID ?? await getID();
    Firestore db = Firestore.instance;
    DocumentSnapshot documentSnapshot =
    await db.collection("Users").document(userID).get();
    //print("HELLO");
    print(documentSnapshot.data);
    return documentSnapshot.data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUserData(),
        builder: (_, snapshot) {
          print(snapshot.data);
          if (snapshot.data == null) {
            return LoadingView();
          }
          var user = User.fromMap(snapshot.data);
          Image myDP = Image.network(user.imageUrl);
          var rating = user.rating ?? 0;

          if (snapshot.connectionState == ConnectionState.active) {
            return LoadingView();
          }

          return Container(
            color: Color.fromRGBO(240, 98, 146, 1),
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0)),
                    child: Container(
                        height: 250.0,
                        color: Color.fromRGBO(240, 98, 146, 1),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    user.city,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'Services',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(user.productList.length.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white))
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'Followers',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
//                                      Text('${widget.user.followers}',
                                        Text(user.followers.length.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white))
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          'Following',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
//                                      Text('${widget.user.following}',
                                        Text(user.following.length.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 80),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      user.name.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Colors.white,
                                        ),
//                                      Text('${widget.user.rating}',
                                        Text(rating.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                    widget.userID == widget.currentUserId
                                        ? OutlineButton(
                                        borderSide:
                                        BorderSide(color: Colors.white),
                                        child: Text(
                                          'EDIT PROFILE',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {},
                                        color: Colors.white,
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                            new BorderRadius.circular(
                                                30.0)))
                                        : FollowButton(
                                      currentLoggedInUser: currentUser.id,
                                      currentlyViewedUser: user.id,
                                      currentlyViewedUsersFollowers: user
                                          .followers,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: -20,
                    left: 30,
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(240, 98, 146, 1),
                      radius: 60,

//                      backgroundImage: AssetImage(widget.user.imageUrl)
                      backgroundImage: myDP.image,
                    ),
                  )
                ],
                alignment: AlignmentDirectional.bottomStart,
                overflow: Overflow.visible,
              ),
            ),
          );
        });
  }
}

//CustomListView -> Fetches data from Firestore

class CustomListView extends StatefulWidget {
  final String userID;

  CustomListView({this.userID});

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  Future getID() async {
    print("Getting uid");
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  Future getItems() async {
    var userID = widget.userID ?? await getID();
    var firestore = Firestore.instance;
    DocumentSnapshot userDoc =
    await firestore.collection("Users").document(userID).get();
    //print(userDoc.data);
    //print(widget.userID);
    if (userDoc.data.containsKey("productList")) {
      var myProductIDs = (userDoc.data["productList"]);
      var myProducts = [];
      for (String id in myProductIDs) {
        DocumentSnapshot product =
        await firestore.collection("Products").document(id).get();
        myProducts.add(product);
      }
      return myProducts;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
            future: getItems(),
            builder: (_, snapshot) {
              if (snapshot.data == null) {
                return LoadingView();
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingView();
              } else {
                return GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(snapshot.data.length, (index) {
                      DocumentSnapshot doc = snapshot.data[index];
                      var product = Product.fromMap(doc.data);
                      //Map product = doc.data;
                      Image thumnail = Image.network(product.mainImage);
                      print("Rs " + product.price.toString());
                      return AllServicesCard(
                        product: product,
                        myImage: thumnail,
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ServiceSinglePage(
                                      product: product,
                                    )),
                          );
                        },
                      );
                    }));
              }
            }));
  }
}

class FollowButton extends StatefulWidget {
  String currentlyViewedUser;
  String currentLoggedInUser;
  List<dynamic> currentlyViewedUsersFollowers;

  FollowButton(
      {this.currentlyViewedUser, this.currentLoggedInUser, this.currentlyViewedUsersFollowers});

  String buttonText;

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  String buttonText;

  @override
  Widget build(BuildContext context) {
    if (widget.currentlyViewedUsersFollowers == null) {
      widget.currentlyViewedUsersFollowers = [];
    }
    if (widget.currentlyViewedUsersFollowers.contains(
        widget.currentLoggedInUser)) {
      //Already followed
      buttonText = 'UNFOLLOW';
    } else {
      //not followed
      buttonText = 'FOLLOW';
    }
    return ProgressButton(
        width: MediaQuery
            .of(context)
            .size
            .width / 3.5,
        borderRadius: 20,
        defaultWidget: Text(buttonText,
            textAlign: TextAlign.center, style:
            TextStyle(fontSize: 14, color: Theme
                .of(context)
                .accentColor)),
        progressWidget: const CircularProgressIndicator(),
        onPressed: () async {
          CollectionReference userCollection = Firestore.instance.collection(
              'Users');
          if (buttonText == 'FOLLOW') {
            await userCollection.document(widget.currentlyViewedUser)
                .updateData({
              'followers': FieldValue.arrayUnion([widget.currentLoggedInUser])
            });
            await userCollection.document(widget.currentLoggedInUser)
                .updateData({
              'following': FieldValue.arrayUnion([widget.currentlyViewedUser])
            });
            buttonText = 'UNFOLLOW';
          } else {
            await userCollection.document(widget.currentlyViewedUser)
                .updateData({
              'followers': FieldValue.arrayRemove([widget.currentLoggedInUser])
            });
            await userCollection.document(widget.currentLoggedInUser)
                .updateData({
              'following': FieldValue.arrayRemove([widget.currentlyViewedUser])
            });
            buttonText = 'FOLLOW';
          }
          setState(() {

          });
        }


    );

//    return OutlineButton(
//        borderSide:
//        BorderSide(color: Colors.white),
//        child: Text(
//          buttonText,
//          style: TextStyle(
//            color: Colors.white,
//          ),
//        ),
//        onPressed: () async {
//          if(buttonText=='FOLLOW'){
//            buttonText='UNFOLLOW';
//          }else{
//            buttonText='FOLLOW';
//          }
//
//        },
//        color: Colors.white,
//        shape: new RoundedRectangleBorder(
//            borderRadius:
//            new BorderRadius.circular(30.0)));
  }
}
