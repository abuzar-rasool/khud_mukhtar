import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  bool searchEnabled=false;
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  double preferredSize=60;
  static int none=2;
  Future navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
  }

  @override
  Widget build(BuildContext context) {
    AssetImage profileimage = AssetImage('assets/momina.jpg') , sampleimage = AssetImage('assets/quranforkidssample.jpg');

    // TODO: implement build
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
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: TextField(

                      onTap: (){
                        navigateToSubPage(context);
                      },
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
                ],
              ),
            ),
          ),
        ),
      ),

      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
                [
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Icon(Icons.code, color:Color.fromRGBO(240, 98, 146, 1) , size: 80,),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                  elevation: 5.0,
                                ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Icon(Icons.book, color:Color.fromRGBO(240, 98, 146, 1) , size: 80,),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                  elevation: 5.0,
                                ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Icon(Icons.fastfood, color:Color.fromRGBO(240, 98, 146, 1) , size: 80,),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                  elevation: 5.0,
                                ),

                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Icon(Icons.attach_money, color:Color.fromRGBO(240, 98, 146, 1) , size: 80,),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                  elevation: 5.0,
                                ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Icon(Icons.work, color:Color.fromRGBO(240, 98, 146, 1) , size: 80,),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                  elevation: 5.0,
                                ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 100,
                                      width: 100,
                                      child: Icon(Icons.videocam, color:Color.fromRGBO(240, 98, 146, 1) , size: 80,),
                                    ),
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height,
                                      width: 200,
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            child: Container(width: MediaQuery.of(context).size.width,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: sampleimage,
                                                ),
                                              ),),
                                            flex: 4,
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text('Quran classes for kids'),
                                                      Spacer(),
                                                      Row(
                                                        children: <Widget>[
                                                          Text('RS 10,000', style: TextStyle(fontWeight: FontWeight.bold),),
                                                          Spacer(),
                                                          Icon(Icons.favorite, color: Colors.red),
                                                          Text('716',style: TextStyle(color:Color.fromRGBO(240, 98, 146, 1) ),)

                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            flex: 2,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                  elevation: 5.0,
                                ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height,
                                      width: 200,
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            child: Container(width: MediaQuery.of(context).size.width,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: sampleimage,
                                                ),
                                              ),),
                                            flex: 4,
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text('Quran classes for kids'),
                                                      Spacer(),
                                                      Row(
                                                        children: <Widget>[
                                                          Text('RS 10,000', style: TextStyle(fontWeight: FontWeight.bold),),
                                                          Spacer(),
                                                          Icon(Icons.favorite, color: Colors.red),
                                                          Text('716',style: TextStyle(color:Color.fromRGBO(240, 98, 146, 1) ),)

                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            flex: 2,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                  elevation: 5.0,
                                ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height,
                                      width: 200,
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            child: Container(width: MediaQuery.of(context).size.width,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: sampleimage,
                                                ),
                                              ),),
                                            flex: 4,
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text('Quran classes for kids'),
                                                      Spacer(),
                                                      Row(
                                                        children: <Widget>[
                                                          Text('RS 10,000', style: TextStyle(fontWeight: FontWeight.bold),),
                                                          Spacer(),
                                                          Icon(Icons.favorite, color: Colors.red),
                                                          Text('716',style: TextStyle(color:Color.fromRGBO(240, 98, 146, 1) ),)

                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            flex: 2,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                  elevation: 5.0,
                                ),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height,
                                      width: 200,
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            child: Container(width: MediaQuery.of(context).size.width,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: sampleimage,
                                                ),
                                              ),),
                                            flex: 4,
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Text('Quran classes for kids'),
                                                      Spacer(),
                                                      Row(
                                                        children: <Widget>[
                                                          Text('RS 10,000', style: TextStyle(fontWeight: FontWeight.bold),),
                                                          Spacer(),
                                                          Icon(Icons.favorite, color: Colors.red),
                                                          Text('716',style: TextStyle(color:Color.fromRGBO(240, 98, 146, 1) ),)

                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            flex: 2,
                                          )
                                        ],
                                      ),
                                    ),
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
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'All Services',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ]
            ),
          ),

          SliverGrid.count(crossAxisCount: 2,
            children: List.generate(20, (index) {
              return Center (
                child: Card(

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            child: Container(width: MediaQuery.of(context).size.width,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: sampleimage,
                                ),
                              ),),
                            flex: 4,
                          ),
                          Flexible(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: <Widget>[
                                    Container( child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Quran classes for kids'),
                                        Text('RS 10,000', style: TextStyle(fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                    ),
                                    Positioned(
                                      left: 100,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(Icons.favorite,color: Colors.red,),
                                          Text('716',style: TextStyle(color:Color.fromRGBO(240, 98, 146, 1) ),)
                                        ],
                                      ),
                                    )
                                  ],
                                  alignment: Alignment.bottomLeft,)
                            ),
                            flex: 2,
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
            }),)
        ],
      ),
    );
  }
}
