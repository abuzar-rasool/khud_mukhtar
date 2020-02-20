import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/screens/NotificationScreen/data.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/drawer/oval-right-clipper.dart';
import 'package:khud_mukhtar/src/screens/forums/forum.dart';
import 'package:khud_mukhtar/src/screens/home_screen.dart';


import '../profile_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: _buildDrawer(context),
      appBar: AppBar(

        title: Text(
          "Notifications",
        ),
        centerTitle: true,

      ),

      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Divider(),
            ),
          );
        },
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          Map notif = notifications[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  notif['dp'],
                ),
                radius: 25,
              ),

              contentPadding: EdgeInsets.all(0),
              title: Text(notif['notif']),
              trailing: Text(
                notif['time'],
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
              onTap: (){},
            ),
          );
        },

      ),
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
