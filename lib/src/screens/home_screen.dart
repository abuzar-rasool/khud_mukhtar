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
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          bottom: AppBar(
            backgroundColor: Color.fromRGBO(240, 98, 146, 1),
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
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
                        height: 50,
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
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Browse Categories',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          FlatButton(
                            child: Text('See all'),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: <Widget>[
                            Card(
                              child: Container(
                                height: 100,
                                width: 100,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                            Card(
                              child: Container(
                                height: 100,
                                width: 100,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                            Card(
                              child: Container(
                                height: 100,
                                width: 100,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                            Card(
                              child: Container(
                                height: 100,
                                width: 100,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                            Card(
                              child: Container(
                                height: 100,
                                width: 100,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                            Card(
                              child: Container(
                                height: 100,
                                width: 100,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Featured Services',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          FlatButton(
                            child: Text('See all'),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: <Widget>[
                            Card(
                              child: Container(
                                height: 300,
                                width: 200,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                            Card(
                              child: Container(
                                height: 300,
                                width: 200,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                            Card(
                              child: Container(
                                height: 300,
                                width: 200,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                            Card(
                              child: Container(
                                height: 300,
                                width: 200,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Best Picks',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          FlatButton(
                            child: Text('See all'),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: <Widget>[
                            Card(
                              child: Container(
                                height: 300,
                                width: 200,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                            Card(
                              child: Container(
                                height: 300,
                                width: 200,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                            Card(
                              child: Container(
                                height: 300,
                                width: 200,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),
                            Card(
                              child: Container(
                                height: 300,
                                width: 200,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              elevation: 5.0,
                            ),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'All Services',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GridView.count(crossAxisCount: 2,
                          children: List.generate(20, (index) {
                            return Center (
                              child: Card(
                                child: Container(
                                  height: 300,
                                  width: 200,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
