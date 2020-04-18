import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khud_mukhtar/src/screens/login_screen.dart';

import '../uplod.dart';

var selectedType;
List<String> _category = <String>[
  "Karachi",
  'Faisalabad',
  'Rawalpindi',
  'Multan',
  'Gujranwala',
  'Hyderabad',
  'Peshawar',
  'Quetta'
];

class Verification extends StatefulWidget {
  FirebaseUser currentUser;

  Verification({Key key, @required this.currentUser}) : super(key: key);

  @override
  _Verificaton createState() => _Verificaton();
}

class _Verificaton extends State<Verification> {
  File image;
  File image_cnic;
  String imagePath;
  String image_cnic_path;
  final int _totalPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  bool val = false;
  bool verify = false;
  final databaseReference = Firestore.instance;

  String id;
  String name;
  String imageUrl;
  String cnicPicture;
  String contactNumber;
  String city;
  String email;
  int followers = 0;
  int following = 0;
  String area;


  Widget _buildPageIndicator(bool isCurrentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage
            ? Color.fromRGBO(240, 98, 146, 1)
            : Color.fromRGBO(247, 166, 194, 1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Future _getImage() async {
    File picture = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 300.0, maxHeight: 500.0);

    setState(() {
      image = picture;
    });
  }

  Future _getCNIC() async {
    File picturex = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 300.0, maxHeight: 500.0);

    setState(() {
      image_cnic = picturex;
    });
    verify = await cnicnVerify(picturex);
    if (verify) {
      setState(() {
        verify = true;
      });
    } else if (!verify) {
      Fluttertoast.showToast(
          msg: "Unable to verify your CNIC. Please upload a clear image and try again.",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    }
  }


  Future<bool> cnicnVerify(File picture) async {
    final image = FirebaseVisionImage.fromFile(picture);
    final dedector = FirebaseVision.instance.textRecognizer();
    VisionText readText = await dedector.processImage(image);
    for (TextBlock block in readText.blocks) {
      for (TextLine line in block.lines) {
        for (TextElement word in line.elements) {
          print('img txt');
          print(word.text);
          if (word.text == 'F') {
            return true;
          }
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              _currentPage = page;
              setState(() {});
            },
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Column(
                      children: <Widget>[
                        Container(
                          padding:
                          EdgeInsets.only(left: 20, right: 20, bottom: 12),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Hey, what is your full name?',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(240, 98, 146, 1)),
                                ),
                              ),
                              SizedBox(height: 12),
                              SizedBox(
                                  height: 50,
                                  child: TextField(
                                    onChanged: (value) {
                                      name = value;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                        borderSide: new BorderSide(
                                          color:
                                          Color.fromRGBO(240, 96, 146, 1),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Color.fromRGBO(
                                                  240, 96, 146, 1))),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Color.fromRGBO(240, 98, 146, 1),
                                      ),
                                      hintText: "eg. Fatima Moin",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  )),
                            ],
                          ),
                        ), //Name
                        Container(
                          padding:
                          EdgeInsets.only(left: 20, right: 20, bottom: 12),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'And your mobile number?',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(240, 98, 146, 1)),
                                ),
                              ),
                              SizedBox(height: 12),
                              SizedBox(
                                  height: 50,
                                  child: TextField(
                                    onChanged: (value) {
                                      contactNumber = value;
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                        borderSide: new BorderSide(
                                            color: Color.fromRGBO(
                                                240, 96, 146, 1)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Color.fromRGBO(
                                                  240, 96, 146, 1))),
                                      prefixIcon: Icon(
                                        Icons.phone_android,
                                        color: Color.fromRGBO(240, 98, 146, 1),
                                      ),
                                      hintText: "eg. 03332367890",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                      labelStyle: TextStyle(color: Colors.grey),
                                    ),
                                  )),
                            ],
                          ),
                        ), //Contact
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, bottom: 12),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Which city are you located in?',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(240, 98, 146, 1)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 5),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: DropdownButton(
                                    items: _category
                                        .map((value) => DropdownMenuItem(
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                            color: Colors.black),
                                      ),
                                      value: value,
                                    ))
                                        .toList(),
                                    onChanged: (selectedCategoryType) {
                                      city = '$selectedCategoryType';
                                      setState(() {
                                        selectedType = selectedCategoryType;
                                      });
                                    },
                                    value: selectedType,
                                    isExpanded: false,
                                    hint: Text(
                                      'Choose City         ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ), //City
                        Container(
                          padding:
                          EdgeInsets.only(left: 20, right: 20, bottom: 12),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'And, area?',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(240, 98, 146, 1)),
                                ),
                              ),
                              SizedBox(height: 12),
                              SizedBox(
                                height: 50,
                                child: TextField(
                                  onChanged: (value) {
                                    area = value;
                                    print(area);
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                        borderSide: new BorderSide(
                                            color: Color.fromRGBO(
                                                240, 96, 146, 1)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Color.fromRGBO(
                                                  240, 96, 146, 1))),
                                      hintText: "eg. North Nazimabad",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                      labelStyle: TextStyle(color: Colors.grey),
                                      prefixIcon: Icon(
                                        Icons.location_city,
                                        color: Color.fromRGBO(240, 98, 146, 1),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 20, bottom: 12),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: val,
                            checkColor: Colors.white,
                            activeColor: Color.fromRGBO(240, 98, 146, 1),
                            onChanged: (bool value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                          Expanded(
                              child: Text(
                                'I confirm I am a woman above 18 years of age.',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(240, 98, 146, 1)),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ), //first page
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Now, add a photo',
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(240, 98, 146, 1)),
                          ),
                          Divider(),
                          Text(
                            'This way, people will know who you are.',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(240, 98, 146, 1)),
                          ),
                        ],
                      ),
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 1,
                      children: <Widget>[
                        GestureDetector(
                            onTap: _getImage,
                            child: Container(
                              color: Colors.black12,
                              child: image == null
                                  ? Icon(FontAwesomeIcons.plus,
                                  color: Color.fromRGBO(240, 98, 146, 1))
                                  : Image.file(image),
                            ))
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Almost done!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(240, 98, 146, 1)),
                          ),
                          Divider(),
                          Text(
                            "Let's verify so we can make sure your safety is our top priority",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(240, 98, 146, 1)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 340,
                      child: GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.all(15),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 1,
                        children: <Widget>[
                          GestureDetector(
                              onTap: !verify ? _getCNIC : () {
                                print('already verified');
                              },
                              child: Container(
                                color: Colors.black12,
                                child: image_cnic == null
                                    ? Icon(FontAwesomeIcons.plus,
                                    color: Color.fromRGBO(240, 98, 146, 1))
                                    : Image.file(image_cnic),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Take a clear picture of your National Identity eg. CNIC, Passport, B-Form).',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(240, 98, 146, 1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.check, size: 16,
                              color: verify
                                  ? Color.fromRGBO(240, 98, 146, 1)
                                  : Colors.grey),
                          Text('CNIC Verfied', style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: verify
                                  ? Color.fromRGBO(240, 98, 146, 1)
                                  : Colors.grey),)
                        ],
                      ),
                    ),
                  ],

                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage != 2
          ? Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                _pageController.animateToPage(_currentPage - 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
                setState(() {});
              },
              splashColor: Color.fromRGBO(240, 96, 146, 1),
              child: Text(
                'BACK',
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(240, 96, 146, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: Row(children: [
                for (int i = 0; i < _totalPages; i++)
                  i == _currentPage
                      ? _buildPageIndicator(true)
                      : _buildPageIndicator(false)
              ]),
            ),
            FlatButton(
              onPressed: () {
                _pageController.animateToPage(_currentPage + 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
                setState(() {});
              },
              splashColor: Colors.blue[50],
              child: Text(
                'NEXT',
                style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(240, 96, 146, 1),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      )
          : RaisedButton(
        onPressed: () async {
          var uploadProfile = FileUpload(
              fileType: 'profileimage',
              file: image,
              fireBaseUserid: widget.currentUser.uid);
          var uploadCnic = FileUpload(
              fileType: 'cnicimage',
              file: image_cnic,
              fireBaseUserid: widget.currentUser.uid);
          imagePath = await uploadProfile.uploadFile();
          image_cnic_path = await uploadCnic.uploadFile();

          databaseReference
              .collection("Users")
              .document(widget.currentUser.uid)
              .updateData({
            'name': name,
            'imageUrl': imagePath,
            'cnicPicture': image_cnic_path,
            'contactNumber': contactNumber,
            'city': city,
            'email': email,
            'followers': followers,
            'following': following,
            'area': area,
            'email': widget.currentUser.email
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Login()));
        },
        child: Container(
          height: Platform.isIOS ? 70 : 60,
          color: Color.fromRGBO(240, 96, 146, 1),
          alignment: Alignment.center,
          child: Text(
            'CONFIRM AND CONTINUE',
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
