import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/screens/login_screen.dart';
import 'package:khud_mukhtar/src/screens/verification.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
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
                  child: Container(
                    child: Center(child: Image(image: logo)),
                  ),
                ),
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 24, color: Color.fromRGBO(240, 98, 146, 1)),
                  ),
                ),

                Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20.0, left: 20.0, right: 20.0, top: 10.0),                child: Theme(
                      data: new ThemeData(
                          primaryColor: Color.fromRGBO(240, 98, 146, 1),
                          hintColor: Color.fromRGBO(248, 187, 208, 1)),
                      child: TextField(
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_outline,
                            color: Color.fromRGBO(248, 187, 208, 1),                      ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0)),
                          hintText: "Email",
                        ),
                      ),
                    )),

                Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20.0, left: 20.0, right: 20.0, top: 10.0),                 child: Theme(
                  data: new ThemeData(
                      primaryColor: Color.fromRGBO(240, 98, 146, 1),
                      hintColor: Color.fromRGBO(248, 187, 208, 1)),
                  child: TextField(
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color.fromRGBO(248, 187, 208, 1),                  ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      hintText: "Password",
                    ),
                  ),
                )),
                Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20.0, left: 20.0, right: 20.0, top: 10.0),                 child: Theme(
                  data: new ThemeData(
                      primaryColor: Color.fromRGBO(240, 98, 146, 1),
                      hintColor: Color.fromRGBO(248, 187, 208, 1)),
                  child: TextField(
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color.fromRGBO(248, 187, 208, 1),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      hintText: "Confirm Password",
                    ),
                  ),
                )),
                Container(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return Verification();
                                  }
                              ));
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
                                  "Sign Up",
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
                        alignment: Alignment.center,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return Login();
                                }
                            ));
                          },
                          child: Text(
                            'Already have an accout? Login',
                            style: TextStyle(
                                color: Color.fromRGBO(240, 98, 146, 1),
                                fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
