import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/screens/Add_Service.dart';
import 'package:khud_mukhtar/src/screens/MainPage.dart';
import 'package:khud_mukhtar/src/screens/ProductDetails.dart';
import 'package:khud_mukhtar/src/screens/onboarding_1.dart';
import 'package:khud_mukhtar/src/screens/search_screen.dart';
import 'package:khud_mukhtar/src/screens/home_screen.dart';
import 'package:khud_mukhtar/src/screens/home_screen_chat.dart';
import 'package:khud_mukhtar/src/screens/profile_screen.dart';
import 'package:khud_mukhtar/src/screens/profile_seller.dart';
import 'package:khud_mukhtar/src/screens/rating.dart';
import 'package:khud_mukhtar/src/screens/service_details.dart';
import 'package:khud_mukhtar/src/screens/service_single.dart';
import 'package:khud_mukhtar/src/screens/service_single2.dart';
import 'package:khud_mukhtar/src/screens/signup_screen.dart';
import 'package:khud_mukhtar/src/screens/splashscreen.dart';
import 'package:khud_mukhtar/src/screens/verification.dart';
import './src/screens/login_screen.dart';

void main() {
  runApp(

    MaterialApp(
      routes: <String, WidgetBuilder>{
        '/services_details': (BuildContext context) => new ServiceDetailsPage(),
        '/rating':(BuildContext context)=> new Rating(),
      },
      title: 'Khud Mukhtar',
      theme: ThemeData(fontFamily: 'Poppins',
      accentColor: Color.fromRGBO(240, 98, 146, 1),
      accentIconTheme: IconThemeData(color: Color.fromRGBO(240, 98, 146, 1)),
      primaryColor: Color.fromRGBO(240, 98, 146, 1)),

      debugShowCheckedModeBanner: false,
      home:SplashScreenOne(),


      // HomeScreenChat() chat screen
      //ServiceSinglePage2() teaching page
      //ServiceSinglePage() logodesign
    )
  );

}