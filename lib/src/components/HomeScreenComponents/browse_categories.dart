import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';

class BrowseCategoriesCard extends StatelessWidget {
  BrowseCategoriesCard({@required this.index, @required this.onPress});
  final index;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
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
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return new CustomCardCategory(icon:categories[index].icon,name: categories[index].name,);
                  }
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomCardCategory extends StatelessWidget {
  CustomCardCategory({@required this.onPress,this.icon,this.name});

  final Function onPress;
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                icon,
                color: Color.fromRGBO(240, 98, 146, 1),
                size: 35,
              ),
              SizedBox(
                height: 10,
              ),
              Text(name,style: TextStyle(fontSize: 12,color: Colors.pink[300]),)
            ],
          ),
        ),
      ),
    );
  }


}