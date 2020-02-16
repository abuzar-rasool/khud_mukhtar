import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/screens/home_screen.dart';
import 'package:khud_mukhtar/src/screens/home_screen_chat.dart';
import 'package:khud_mukhtar/src/screens/onboarding_1.dart';
import 'package:khud_mukhtar/src/screens/profile_screen.dart';
import 'package:khud_mukhtar/src/screens/profile_seller.dart';
import 'package:khud_mukhtar/src/screens/rating.dart';
import 'package:khud_mukhtar/src/screens/service_details.dart';
import 'package:khud_mukhtar/src/screens/service_single.dart';
import 'package:khud_mukhtar/src/screens/service_single2.dart';
import 'package:khud_mukhtar/src/screens/signup_screen.dart';
import './src/screens/login_screen.dart';
import './src/screens/onboarding_1.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Splash',
      debugShowCheckedModeBanner: false,
      home: OnboardingPage(),

      // HomeScreenChat() chat screen
      //ServiceSinglePage2() teaching page
      //ServiceSinglePage() logodesign
    ),
  );

}