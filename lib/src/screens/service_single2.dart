import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'service_details.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khud_mukhtar/constants/colors.dart';

class bottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Padding(
        padding: EdgeInsets.only(left:25.0,right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage(('assets/momina.jpg'),),
                    ),
                    Positioned(
                      top: 30,
                      bottom: -2,
                      right: -1,
                      left: 30,
                      child: ClipOval(
                        child: Container(
                          width: 0.5,
                          height: 0.5,
                          color: Colors.green,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Fatima Moin',
                      style: TextStyle(
                        fontSize: 19.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text(
                          '4.9',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ],
            ),
            OutlineButton(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right:8.0),
                    child: Icon(Icons.mail_outline,color: pink300,size: 20,),
                  ),
                  Text('MESSAGE',style: TextStyle(color: pink300,fontWeight: FontWeight.bold),),
                ],
              ),
              highlightedBorderColor: pink500,
              onPressed: () {}, //callback when button is clicked
              borderSide: BorderSide(
                color: pink300, //Color of the border
                style: BorderStyle.solid, //Style of the border
                width: 2.5, //width of the border
              ),
            ),

          ],

        ),
      ),
    );

  }
}


class ServiceSinglePage2 extends StatelessWidget {
  static final String path = "lib/src/pages/food/recipe_single.dart";
  final Color icon = pink300;
  final Color color1 = pink500;
  final Color color2 = pink300;
  final Color color3 = pink300;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: bottomAppBar(),
        ),
        body: Container(
          height: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 350,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [color2, color3],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  )),
              Positioned(
                  top: 150,
                  left: 0,
                  right: 150,
                  bottom: 80,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50.0))),
                  )),
              Positioned(
                top: 350,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.location_on, color: Colors.white),
                          Text(
                            'Karachi , Pakistan',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.0),
                      Text(
                        "O/A Levels Tution\nFor Women".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25.0),
                      ),

                      SizedBox(height: 5.0),
                      RatingBar(
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Text('Rs. 5000',style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 80.0),
                      Wrap(

                        children: <Widget>[

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Service Type',style: TextStyle(color: Colors.white,fontSize: 10),),
                              Text('Home Based',style: TextStyle(color: Colors.white,fontSize: 13),)
                            ],
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Container(
                            height: 30,
                            width: 0.5,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Category',style: TextStyle(color: Colors.white,fontSize: 10),),
                              Text('Quran Classes',style: TextStyle(color: Colors.white,fontSize: 13),),
                            ],
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Container(
                            height: 30,
                            width: 0.5,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Area',style: TextStyle(color: Colors.white,fontSize: 10),),
                              Text('North Karachi',style: TextStyle(color: Colors.white,fontSize: 13),)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 380,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(color: Colors.black38, blurRadius: 30.0)
                ]),
                child: SizedBox(
                  height: 350,
                  child: Image.asset(('assets/teaching.jpeg'), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 325,
                left: 20,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: IconButton(
                      color: icon,
                      onPressed: (){

                      },
                      icon: Icon(FontAwesomeIcons.heart,)),
                ),
              ),
              Positioned(
                top: 325,
                right: 20,
                child: RaisedButton(
                  child: Text("Read More".toUpperCase()),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  onPressed: (){
                    Navigator.pushNamed(context, '/services_details');
                  },
                ),
              ),
            ],


          ),
        ),

      ),
    );
  }
}
