import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/screens/home_screen.dart';
import 'package:khud_mukhtar/src/screens/signup_screen.dart';

import 'MainPage.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    AssetImage logo = AssetImage('assets/logo.png');
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(

                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(image: logo),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 24, color: Color.fromRGBO(240, 98, 146, 1)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Theme(
                      data: new ThemeData(
                          primaryColor:
                              Color.fromRGBO(240, 98, 146, 1), //Pink dark shade
                          hintColor: Color.fromRGBO(240, 98, 146, 1)),
                      child: TextField(
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Colors.pink,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          hintText: "Email",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Theme(
                        data: new ThemeData(
                            primaryColor: Color.fromRGBO(240, 98, 146, 1),
                            hintColor: Color.fromRGBO(240, 98, 146, 1)),
                        child: TextField(
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.pink,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            hintText: "Password",
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 50.0,
                              child: RaisedButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (BuildContext context) {
                                        return MainPage();
                                      }));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(
                                          240, 98, 146, 1),
                                      borderRadius: BorderRadius.circular(30.0)),
                                  child: Container(
                                    constraints: BoxConstraints(
                                        maxWidth: 300.0, minHeight: 50.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Login",
                                      textAlign: TextAlign.center,
                                      style:
                                      TextStyle(fontSize: 24, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: FlatButton(
                                child: Text(
                                  'Forget Password?',
                                  style: TextStyle(
                                      color: Color.fromRGBO(240, 98, 146, 1),
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SignUp();
                        }));
                      },
                      child: Text('Dont have an account? Sign Up')),
                ],
              ),
            ),
          )),
    );
  }
}
