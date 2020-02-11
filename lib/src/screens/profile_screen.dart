
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(40.0), bottomLeft:Radius.circular(40.0) ),
              child: Container(
                  height: 200.0,
                  width: double.infinity,
                  color: Color.fromRGBO(240, 98, 146, 1),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(Icons.arrow_back, color: Colors.white,),
                            Spacer(),
                            Text('Karachi, Pakistan', style: TextStyle(color:Colors.white, fontSize: 15),),
                            Icon(Icons.location_on, color: Colors.white,),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text('Services', style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),
                                  Text('05',style: TextStyle(fontSize: 20, color: Colors.white))
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: <Widget>[
                                  Text('Services', style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),
                                  Text('05',style: TextStyle(fontSize: 20, color: Colors.white))
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: <Widget>[
                                  Text('Services', style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),),
                                  Text('05',style: TextStyle(fontSize: 20, color: Colors.white))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ),
          ],
        )
      ),
    );
  }
}
