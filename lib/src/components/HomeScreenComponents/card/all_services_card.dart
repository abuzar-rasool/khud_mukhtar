import 'package:flutter/material.dart';

class AllServicesCard extends StatelessWidget {

  AssetImage profileimage = AssetImage('assets/momina.jpg'),
      sampleimage = AssetImage('assets/quranforkidssample.jpg');

  AllServicesCard({@required this.index, @required this.onPress});
  final index;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
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
                child: Container(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Quran classes for kids'),
                      Spacer(),
                      Row(children: <Widget>[
                        Text(
                          'RS 10,000',
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
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
                      ],)
                    ],
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
