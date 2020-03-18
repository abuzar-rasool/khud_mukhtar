import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'onboarding_1.dart';
import 'package:khud_mukhtar/src/authenticiation.dart';


class SplashScreenOne extends StatefulWidget {

  _SplashScreenOneState createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  AssetImage splash = AssetImage('assets/splash.png');

  @override

  void initState() {
    // TODO: implement initState

    super.initState();

    Future.delayed(
      Duration(seconds: 3),()
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OnboardingPage()));
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(image: splash,),
        ),
      ),
    );
  }
}
