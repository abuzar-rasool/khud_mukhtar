import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  bool searchEnabled;
  SearchScreen({this.searchEnabled=true});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double preferredSize=60;
  static int none=2;
  List<Widget> bottomSearchBar= <Widget>[
    SizedBox(
      height: 10,
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
          hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
        ),
      ),

    ),
  ];
  List<Widget> _createActionWidget(searchEnabled){

    if(!searchEnabled){
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
    }else{
      return <Widget>[
        IconButton(
          onPressed: (){
            setState(() {
              if(preferredSize>60){
                preferredSize-=160;
                print('Filter closed');
                bottomSearchBar.removeLast();
              }else{
                preferredSize+=160;
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
                          Text('Categories',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),

                        ],

                      ),
                      Row(
                        children: <Widget>[
                          Chip(
                            label: Text('Home Based',style: TextStyle(color: Colors.pink[300]),),
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
                          Text('Service Type',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),

                        ],

                      ),
                      Row(
                        children: <Widget>[
                          Chip(
                            label: Text('All',style: TextStyle(color: Colors.pink[300]),),
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
        leading: widget.searchEnabled ? Icon(
          Icons.arrow_back,
          color: Colors.white,
        ) : Icon(
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
            padding: const EdgeInsets.only(top:0,bottom:25,right: 16,left: 16),
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
}
