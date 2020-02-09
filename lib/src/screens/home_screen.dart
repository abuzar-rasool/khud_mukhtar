import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: PreferredSize(
      preferredSize: Size.fromHeight(130.0),
      child: AppBar(
        bottom: AppBar(
          backgroundColor: Color.fromRGBO(240, 98, 146, 1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          hintText: "What are you looking for",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 15.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )),
          ),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Karachi, Pakistan",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.location_on,
                color: Colors.white,
              )
            ],
          )
        ],
        backgroundColor: Color.fromRGBO(240, 98, 146, 1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.amber,
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Text('Browse Categories', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                        Spacer(),
                        FlatButton(
                          child: Text('See all'),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),

      ),

    ),);
  }
}
