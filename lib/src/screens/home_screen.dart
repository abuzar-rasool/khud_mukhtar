import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/browse_categories.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/card/all_services_card.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/featured_services_card.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';
import 'package:khud_mukhtar/src/screens/search_screen.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/drawer/oval-right-clipper.dart';
import 'package:khud_mukhtar/src/screens/service_single.dart';
final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
class HomeScreen extends StatefulWidget {
  bool searchEnabled = false;

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  double preferredSize = 64;
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
      key: _key,
      drawer: _buildDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        leading: widget.searchEnabled
            ? Icon(
          Icons.arrow_back,
          color: Colors.white,
        )
            : IconButton(
          onPressed: () {_key.currentState.openDrawer();},

              icon: Icon(
          Icons.menu,
          color: Colors.white,
        ),
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
                    height: 9,
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
                        TextStyle(color: Colors.grey, fontSize: 12.0),
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
final Color primary = Colors.pink[300];
final Color active = Colors.pink[300];
_buildDrawer() {
  AssetImage image = new AssetImage('assets/momina.jpg');
  return ClipPath(
    clipper: OvalRightBorderClipper(),
    child: Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: BoxDecoration(
            color: Color.fromRGBO(240, 98, 146, 1), boxShadow: [BoxShadow(color: Colors.black45)]),
        width: 300,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(
                      Icons.power_settings_new,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: [Color.fromRGBO(240, 98, 146, 1), Colors.white])),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: image,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "erika costell",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Text(
                  "@erika07",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                SizedBox(height: 30.0),
                _buildRow(Icons.home, "Home"),
                _buildDivider(),
                _buildRow(Icons.person_pin, "Your profile"),
                _buildDivider(),
                _buildRow(Icons.settings, "Settings"),
                _buildDivider(),
                _buildRow(Icons.email, "Contact us"),
                _buildDivider(),
                _buildRow(Icons.info_outline, "Help"),
                _buildDivider(),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Divider _buildDivider() {
  return Divider(
    color: Colors.white,
  );
}

Widget _buildRow(IconData icon, String title) {
  final TextStyle tStyle = TextStyle(color: Colors.white, fontSize: 16.0);
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(children: [
      Icon(
        icon,
        color: Colors.white,
      ),
      SizedBox(width: 10.0),
      Text(
        title,
        style: tStyle,
      ),
    ]),
  );
}

