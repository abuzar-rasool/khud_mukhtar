import 'dart:collection';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/user_model.dart';
import 'screens/verification.dart';
 class UserFunctions{

 }

class Auth  {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final databaseReference = Firestore.instance;

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

   void signUp(String email, String password,BuildContext context) async {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password).catchError((error){
            print(error.toString());
      });
    FirebaseUser user = result.user;
    User newUser = User(id: user.uid,email: user.email);
    databaseReference.collection('Users').document(user.uid).setData(newUser.toMap());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (BuildContext context) => Verification(currentUser: user,)));

  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }
}
