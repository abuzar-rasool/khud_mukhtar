import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/screens/NotificationScreen/data.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/drawer/oval-right-clipper.dart';


import '../home_screen.dart';
import '../profile_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

class Forums extends StatefulWidget {
  @override
  _Forums createState() => _Forums();
}

class _Forums extends State<Forums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: _buildDrawer(context),
      appBar: AppBar(

        title: Text(
          "Forums",
        ),
        centerTitle: true,

      ),

      body: SafeArea(
        child: Center(
          child:Text('COMING SOON!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),)
          ,
        ),
      )
    );
  }
}


_buildDrawer(BuildContext context) {
  AssetImage image = new AssetImage('assets/momina.jpg');
  return ClipPath(
    clipper: OvalRightBorderClipper(),
    child: Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: BoxDecoration(
            color: Color.fromRGBO(240, 98, 146, 1),
            boxShadow: [BoxShadow(color: Colors.black45)]),
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
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(240, 98, 146, 1),
                        Colors.white
                      ])),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: image,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Fatima Moin",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Text(
                  "@fatimamoin",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                SizedBox(height: 30.0),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    child: _buildRow(Icons.home, "Home")),
                _buildDivider(),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: _buildRow(Icons.person_pin, "Your profile")),
                _buildDivider(),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Forums()));
                    },
                    child: _buildRow(Icons.forum, "Forums")),
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
