import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/screens/signup_screen.dart';
import './src/screens/login_screen.dart';
import './src/screens/ProductDetails.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Splash',
      debugShowCheckedModeBanner: false,
     home: ProductDetails(),
    )
  );

}