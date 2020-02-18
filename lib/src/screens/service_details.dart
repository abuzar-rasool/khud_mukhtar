import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khud_mukhtar/constants/colors.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';

class ServiceDetailsPage extends StatelessWidget {
  final Product product;
  ServiceDetailsPage({this.product});
  static final String path = "lib/src/pages/food/recipe_details.dart";
  FocusNode myFocusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(FontAwesomeIcons.solidHeart, color: pink300),
            label: Text("${product.likes} Likes"),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                Text(
                  "${product.title}".toUpperCase(),
                  style: TextStyle(
                      color: pink500,
                      fontSize: 38.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Rs ${product.price}",
                  style: TextStyle(
                      color: pink300,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w600),
                ),

                SizedBox(
                  height: 16.0,
                ),
                Text(product.description),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 30,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.servicestack),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text("${product.serviceType}")
                          ],
                        ),
                      ),
                      VerticalDivider(),
                      VerticalDivider(),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.location_city),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text('${product.user.city}')
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ExpansionTile(
                  leading: Icon(
                    Icons.rate_review,
                    color: pink500,
                  ),
                  trailing: Icon(
                    Icons.add,
                    color: pink500,
                  ),
                  title: Text(
                    'WRITE A REVIEW',
                    style: TextStyle(color: pink500),
                  ),
                  children: <Widget>[
                    TextFormField(
                      maxLines: 3,
                      decoration: new InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        hintText: "Write A Review",
                      ),
                    ),
                    OutlineButton(

                      child: Row(
                        children: <Widget>[
                          Center(
                            child: Text(
                              'CLICK HERE TO RATE',
                              style: TextStyle(
                                  color: pink300, fontWeight: FontWeight.bold),
                            ),
                          ),

                        ],
                      ),

                      highlightedBorderColor: pink500,
                      onPressed: () {
                        Navigator.pushNamed(context, '/rating');
                      }, //callback when button is clicked
                      borderSide: BorderSide(
                        color: pink300, //Color of the border
                        style: BorderStyle.solid, //Style of the border
                        width: 2.5, //width of the border
                      ),
                    ),
                    Container(
                      child: RaisedButton(

                        onPressed: () {},
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10),),
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color(0xFFF06292),
                                Color(0xFFF06292),
                                Color(0xFFF06292),
                              ],
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child:  Center(
                            child: Text(
                                'Submit Review',
                                style: TextStyle(fontSize: 15)

                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                //ALL REVIEWS
              ],
            ),
          ),
          Material(
            elevation: 10.0,
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.all(10.0),
              height: 80,
              child: ListView.builder(

                scrollDirection: Axis.horizontal,
                itemCount: product.galleryImages!=null ? product.galleryImages.length : 0,
                itemBuilder: (BuildContext ctxt, int index) {
                  return _buildBottomImage(product.galleryImages[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomImage(String image) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      ),
    );
  }

  Widget _buildStep({String leadingTitle, String title, String content}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Material(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          color: Colors.red,
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Text(leadingTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0)),
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
              SizedBox(
                height: 10.0,
              ),
              Text(content),
            ],
          ),
        )
      ],
    );
  }
}
