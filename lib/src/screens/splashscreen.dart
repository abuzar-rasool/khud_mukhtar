import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:khud_mukhtar/src/screens/rating.dart';
import 'package:khud_mukhtar/src/screens/service_details.dart';
import 'package:khud_mukhtar/src/screens/verification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainPage.dart';
import 'login_screen.dart';
import 'onboarding_1.dart';


class SplashScreenOne extends StatefulWidget {

  _SplashScreenOneState createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  final db = Firestore.instance;
  FirebaseUser user;
  AssetImage splash = AssetImage('assets/splash.png');


  Future<String> _future;

  Future<String> splashNavigation() async {
    user = await FirebaseAuth.instance.currentUser();

    if (user != null) {
      //check if user is verified
      //get data from 'Users' --> user.id -->

      String name;

      DocumentReference docRef =
      db.collection("Users").document(user.uid);
      DocumentSnapshot snapshot = await docRef.get().catchError((e) {
        print(e.toString());
      });
      name = snapshot.data['name'];
      print(name);
      if (name != null) {
        return 'main';
      } else {
        return 'verification';
      }
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool CheckValue = prefs.containsKey('showonboarding');
      if (CheckValue) {
        return 'login';
      }
      else {
        return 'onboard';
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = splashNavigation();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/services_details': (BuildContext context) => new ServiceDetailsPage(),
        '/rating': (BuildContext context) => new Rating(),
      },
      title: 'Khud Mukhtar',
      theme: ThemeData(fontFamily: 'Poppins',
          accentColor: Color.fromRGBO(240, 98, 146, 1),
          accentIconTheme: IconThemeData(
              color: Color.fromRGBO(240, 98, 146, 1)),
          primaryColor: Color.fromRGBO(240, 98, 146, 1)),

      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData) {
            String data = snapshot.data;
            print('Loading.....................$data');
            if (data == 'main') {
              return MainPage();
            } else if (data == 'verification') {
              return Verification(currentUser: user,);
            } else if (data == 'login') {
              return Login();
            } else if (data == 'onboard') {
              return OnboardingPage();
            }
          }
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Image(image: splash,),
              ),
            ),
          );


          // noop, this builder is called again when the future completes
        },
      ),
    );;
  }
}

