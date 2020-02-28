import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  bool searchEnabled;
  SearchScreen({this.searchEnabled = true});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double preferredSize = 64;
  static int none = 2;
  List<Widget> bottomSearchBar = <Widget>[
    SizedBox(
      height: 9,
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: TextField(
        autofocus: true,
        enabled: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          hintText: "What are you looking for",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
        ),
      ),
    ),
  ];
  List<Widget> _createActionWidget(searchEnabled) {
    if (!searchEnabled) {
      return <Widget>[
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
      ];
    } else {
      return <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              if (preferredSize > 64) {
                preferredSize -= 160;
                print('Filter closed');
                bottomSearchBar.removeLast();
              } else {
                preferredSize += 160;
                print('Filter opened');
                bottomSearchBar.add(Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Categories',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              showFancyCustomDialog(context);
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Chip(
                            label: Text(
                              'Home Based',
                              style: TextStyle(color: Colors.pink[300]),
                            ),
                            avatar: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.cancel,
                                color: Colors.pink[300],
                              ),
                            ),
                            deleteIconColor: Colors.white,
                            backgroundColor: Colors.white,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Service Type',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              showFancyCustomDialog(context);
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Chip(
                            label: Text(
                              'All',
                              style: TextStyle(color: Colors.pink[300]),
                            ),
                            avatar: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.cancel,
                                color: Colors.pink[300],
                              ),
                            ),
                            deleteIconColor: Colors.white,
                            backgroundColor: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                ));
              }
            });
          },
          icon: Icon(
            Icons.filter_list,
            color: Colors.white,
          ),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        leading: widget.searchEnabled
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : Icon(
                Icons.menu,
                color: Colors.white,
              ),
        actions: _createActionWidget(widget.searchEnabled),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(preferredSize),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 25, right: 16, left: 16),
            child: Container(
              alignment: Alignment.center,
              height: preferredSize,
              child: Column(
                children: bottomSearchBar,
              ),
            ),
          ),
        ),
      ),
    );
  }

  final category = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5',
    'Category 6'
  ];

  void showFancyCustomDialog(BuildContext context) {
    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 600.0,
        width: 300.0,
        child: Stack(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child:  ListView.builder(
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {Navigator.pop(context);},
                          child: ListTile(title: Text(category[index])));
                    })
            ),
//            Container(
//              width: double.infinity,
//              height: 50,
//              alignment: Alignment.bottomCenter,
//              decoration: BoxDecoration(
//                color: Colors.pink[300],
//                borderRadius: BorderRadius.only(
//                  topLeft: Radius.circular(12),
//                  topRight: Radius.circular(12),
//                ),
//              ),
//              child: Align(
//                alignment: Alignment.center,
//                child: Text(
//                  "Choose a category",
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 20,
//                      fontWeight: FontWeight.w600),
//                ),
//              ),
//            ),
//            Align(
//              alignment: Alignment.bottomCenter,
//              child: InkWell(
//                onTap: () {
//                  Navigator.pop(context);
//                },
//                child: Container(
//                  width: double.infinity,
//                  height: 50,
//                  decoration: BoxDecoration(
//                    color: Colors.blue[300],
//                    borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(12),
//                      bottomRight: Radius.circular(12),
//                    ),
//                  ),
//                  child: Align(
//                    alignment: Alignment.center,
//                    child: Text(
//                      "Okay let's go!",
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 20,
//                          fontWeight: FontWeight.w600),
//                    ),
//                  ),
//                ),
//              ),
//            ),
            Align(
              // These values are based on trial & error method
              alignment: Alignment(1.05, -1.05),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
  }
}
