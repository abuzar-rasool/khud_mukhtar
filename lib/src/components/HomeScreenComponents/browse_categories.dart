import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/screens/ProductDetails.dart';

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
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: List.generate(10, (index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return ProductDetails();
                          }));
                    },
                      child: CustomCard());
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({@required this.index, @required this.onPress});
  final index;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: 100,
          child: Icon(
            Icons.code,
            color: Color.fromRGBO(240, 98, 146, 1),
            size: 50,
          ),
        ),
      ),
    );
  }


}



