import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';
import 'package:khud_mukhtar/src/screens/Add_Service.dart';

class Profile extends StatefulWidget {
  final User user;
  Profile({this.user});

  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  AssetImage profileimage = AssetImage('assets/fatima.jpeg'),
      sampleimage = AssetImage('assets/quranforkidssample.jpg');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color.fromRGBO(240, 98, 146, 1),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddService()));
        },
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(40.0),
                          bottomLeft: Radius.circular(40.0)),
                      child: Container(
                          height: 250.0,
                          color: Color.fromRGBO(240, 98, 146, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    InkWell(

                                      onTap: (){
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
//                                  '${widget.user.city}, Pakistan',
                                      'Karachi, Pakistan',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Services',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text('10',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white))
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Followers',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
//                                      Text('${widget.user.followers}',
                                          Text('233',

                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white))
                                        ],
                                      ),
                                      Spacer(),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            'Following',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
//                                      Text('${widget.user.following}',
                                          Text('400',

                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 80),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
//                                    '${widget.user.name}',
                                        'Fatima Moin',

                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.star,
                                            color: Colors.white,
                                          ),
//                                      Text('${widget.user.rating}',
                                          Text('5.0',

                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                        ],
                                      ),
                                      OutlineButton(
                                          borderSide:
                                          BorderSide(color: Colors.white),
                                          child: Text(
                                            'EDIT PROFILE',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {},
                                          color: Colors.white,
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                              new BorderRadius.circular(30.0)))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Positioned(
                      bottom: -20,
                      left: 30,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(240, 98, 146, 1),
                        radius: 60,

//                      backgroundImage: AssetImage(widget.user.imageUrl)
                        backgroundImage: profileimage,
                      ),
                    )
                  ],
                  alignment: AlignmentDirectional.bottomStart,
                  overflow: Overflow.visible,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.count(
                              crossAxisCount: 2,
                              children: List.generate(20, (index) {
                                return Center(
                                  child: Card(

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Container(width: MediaQuery.of(context).size.width,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: sampleimage,
                                                  ),
                                                ),),
                                            ),
                                            Container(

                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: <Widget>[
                                                  Text('Quran classes for kids'),


                                                  Row(
                                                    children: <Widget>[
                                                      Text('RS 10,000', style: TextStyle(fontWeight: FontWeight.bold),),
                                                      Spacer(),
                                                      Icon(Icons.favorite,color: Colors.red,),
                                                      Text('716',style: TextStyle(color:Color.fromRGBO(240, 98, 146, 1) ),)
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0)),
                                    elevation: 5.0,
                                  ),
                                );
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}