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
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
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

class Validator{
  static bool validate(String pass, String confirm_pass){
    if (pass == confirm_pass)
    {
      return true;
    }
    return false;
  }
}
class Verification extends StatefulWidget {
  FirebaseUser currentUser;

  Verification({Key key, @required this.currentUser}) : super(key: key);

  @override
  _Verificaton createState() => _Verificaton();
}

class _Verificaton extends State<Verification> {
  File image;
  File image_cnic;
  bool load = false;
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
  List<dynamic> followers = [];
  List<dynamic> following = [];
  String area;
  final formkey = new GlobalKey<FormState>();

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
          backgroundColor: Color.fromRGBO(240, 98, 146, 1),
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
  bool termsChecked = true;
  bool verifyChecked = true;
  bool validate()
  {
    final form = formkey.currentState;
    if (form.validate()) {
      if (val) {
        // The checkbox wasn't checked
        form.save();

        return true; }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:   Container(
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (int page) {
                _currentPage = page;
                setState(() {});
              },
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Form(
                        key: formkey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 60),
                            SizedBox(height: 10),
                            Column(
                              children: <Widget>[
                                new ListTile(
                                  title: new Text('Hey, what is your full name?',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(240, 98, 146, 1)),
                                  ),
                                  subtitle: new TextFormField(
                                    onChanged: (value) {
                                      name = value;
                                    },
                                    decoration: InputDecoration(

                                      hintText: "eg. Fatima Moin",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                      labelStyle: TextStyle(color: Colors.grey),
                                      errorStyle: TextStyle(color: Colors.pink),
                                      prefixIcon: Icon(Icons.person,
                                          color: Color.fromRGBO(
                                              240, 98, 146, 1), size: 30
                                      ),
                                    ),
                                    validator: (value) => value.isEmpty ? "Please enter your name" : null,


                                  ),
                                  isThreeLine: true,
                                ) ,//Name
                                new ListTile(

                                  title: new Text('And your mobile number?',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(240, 98, 146, 1)),
                                  ),
                                  subtitle: new TextFormField(
                                    keyboardType: TextInputType.phone,
                                    onChanged: (value) {
                                      contactNumber = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.phone_android,
                                          color: Color.fromRGBO(
                                              240, 98, 146, 1), size: 30),
                                      hintText: "eg. 03333 1935084",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                      labelStyle: TextStyle(color: Colors.grey),
                                      errorStyle: TextStyle(color: Colors.pink),
                                    ),
                                    validator: (value) => value.isEmpty ? "Please enter your contact number" : null,),),
                                new ListTile(
                                  title: new Text('Which city are you located in?',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(240, 98, 146, 1)),
                                  ),
                                  subtitle: DropdownButtonFormField(
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
                                      isDense: true,
                                      value: selectedType,
                                      isExpanded: false,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.location_on,
                                            color: Color.fromRGBO(
                                                240, 98, 146, 1), size: 30),
                                        errorStyle: TextStyle(
                                            color: Colors.pink),
                                      ),
                                      hint:  Text(
                                        'Choose City',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      validator: (value) {
                                        if (value == null) {
                                          return "Please select your city";
                                        };
                                      }
                                  ),
                                ),
                                new ListTile(

                                  title: new Text('And, area?',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(240, 98, 146, 1)),
                                  ),
                                  subtitle: new TextFormField(
                                    onChanged: (value) {
                                      contactNumber = value;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.location_city,
                                          color: Color.fromRGBO(
                                              240, 98, 146, 1), size: 30
                                      ),
                                      hintText: "eg. North Nazimabad",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                      labelStyle: TextStyle(color: Colors.grey),
                                      errorStyle: TextStyle(color: Colors.pink),
                                    ),
                                    validator: (value) => value.isEmpty ? "Please enter your area" : null,),),
                                new  CheckboxListTile(
                                  value: val,
                                  title: new Text('I confirm I am a woman above 18 years of age.',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(240, 98, 146, 1)),
                                  ),
                                  checkColor: Colors.white,
                                  activeColor: Color.fromRGBO(240, 98, 146, 1),
                                  onChanged: (bool value) {
                                    setState(() {
                                      val = value;
                                      //    termsChecked = value;
                                    });
                                  },
                                ),
                                //add other containers
                              ],
                            ),

                          ],
                        ),
                      ), ),
                    showAlert(),
                  ],
                ),//first page
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
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60),

                          SizedBox(height: 10),
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
                    showAlert_cnic(),
                  ],
                )
              ],
            ),
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
              onPressed: () async { if (validate()){
                _pageController.animateToPage(_currentPage + 1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.linear);
                setState(() {});
              };
              if (val != true)
              {
                setState(() {
                  termsChecked = false;
                });}
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
          :  Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: Platform.isIOS ? 70 : 60,
        width : MediaQuery.of(context).size.width,
        child: ProgressButton(
          defaultWidget: Container(

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
          progressWidget: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
          width: 196,
          height: 40,
          animate: false,
          color: Color.fromRGBO(240, 98, 146, 1),
          type: ProgressButtonType.Raised,
          onPressed: () async {
            if (verify != true)
            {
              setState(() {
                verifyChecked = false;
                load = false;
              });}

            var uploadProfile = FileUpload(
                fileType: 'profileimage',
                file: image,
                id: widget.currentUser.uid);
            var uploadCnic = FileUpload(
                fileType: 'cnicimage',
                file: image_cnic,
                id: widget.currentUser.uid);
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
              'email': widget.currentUser.email,

            });

            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
        ),
      ),

      backgroundColor: Colors.white,
    );
  }
  Widget showAlert() {
    if (termsChecked == false) {
      return Container(
        color: Color.fromRGBO(240, 98, 146, 1),
        width: double.infinity,
        height : MediaQuery.of(context).size.height/11,
        padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
        child: Center(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(Icons.error_outline, color: Colors.white),
              ),
              Expanded(
                child: AutoSizeText(
                  "You have not agreed to the terms and conditions.",
                  style: TextStyle(
                      color: Colors.white
                  ),

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: IconButton(
                  icon: Icon(Icons.close,
                    color: Colors.white,),
                  onPressed: () {
                    setState(() {
                      termsChecked = null;
                    });
                  },
                ),
              )
            ],
          ),
        ),

      );
    }
    return SizedBox(
      height: 0,
    );
  }

  Widget showAlert_cnic() {
    if (verifyChecked == false) {
      return Container(
        color: Color.fromRGBO(240, 98, 146, 1),
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline, color: Colors.white),
            ),
            Expanded(
              child: Text(
                "Please verify your CNIC.",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                icon: Icon(Icons.close,
                  color: Colors.white,),
                onPressed: () {
                  setState(() {
                    verifyChecked = null;
                  });
                },
              ),
            )
          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
    );
  }
}
