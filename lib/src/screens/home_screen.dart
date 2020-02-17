import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/browse_categories.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/card/all_services_card.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/featured_services_card.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';
import 'package:khud_mukhtar/src/screens/search_screen.dart';
import 'package:khud_mukhtar/src/screens/service_single.dart';

class HomeScreen extends StatefulWidget {
  bool searchEnabled = false;

  @override
  _HomeScreen createState() => _HomeScreen();


}


class _HomeScreen extends State<HomeScreen> {

  double preferredSize = 60;
  static int none = 2;
  Future navigateToSubPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SearchScreen()));
  }

  @override
  Widget build(BuildContext context) {
    AssetImage profileimage = AssetImage('assets/momina.jpg'),
        sampleimage = AssetImage('assets/quranforkidssample.jpg');

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        leading: widget.searchEnabled
            ? Icon(
                Icons.arrow_back,
                color: Colors.white,
              )
            : Icon(
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
            padding:
                const EdgeInsets.only(top: 0, bottom: 25, right: 16, left: 16),
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
                      onTap: () {
                        navigateToSubPage(context);
                      },
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
                ],
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([

              BrowseCategoriesCard(),

              FeaturedServices(),
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
            ]),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            children: List.generate(4, (index) {
              return Center(
                  child: AllServicesCard(product: allProducts[index],
                  onPress: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ServiceSinglePage(product: allProducts[index],)),
                      );
                    }
                    ,),
              );
            }),
          )
        ],
      ),
    );
  }
}