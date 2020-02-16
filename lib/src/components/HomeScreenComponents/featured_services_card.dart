import 'package:flutter/material.dart';


class FeaturedServices extends StatelessWidget {

  FeaturedServices({@required this.index, @required this.onPress});
  final index;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Center(
      child: Container(
        height: 320,
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
                    children: List.generate(10, (index) {
                      return  CustomCard();
                    })
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  AssetImage profileimage = AssetImage('assets/momina.jpg'),
      sampleimage = AssetImage('assets/quranforkidssample.jpg');
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
          width: 200,
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Container(
                  width:
                  MediaQuery.of(context).size.width,
                  height: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: sampleimage,
                    ),
                  ),
                ),
                flex: 4,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context)
                          .size
                          .width,
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              'Quran classes for kids'),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Text(
                                'RS 10,000',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .bold),
                              ),
                              Spacer(),
                              Icon(Icons.favorite,
                                  color: Colors.red),
                              Text(
                                '716',
                                style: TextStyle(
                                    color:
                                    Color.fromRGBO(
                                        240,
                                        98,
                                        146,
                                        1)),
                              )
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
    );
  }


}



