import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';


class AllServicesCard extends StatelessWidget {

  //AssetImage profileimage = AssetImage('assets/momina.jpg'),
     // sampleimage = AssetImage('assets/quranforkidssample.jpg');

  AllServicesCard({@required this.product, @required this.onPress, this.myImage});
  final Product product;
  final Image myImage;

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    ImageProvider displayImage = myImage == null ? AssetImage(product.mainImage) : myImage.image;

    // TODO: implement build
    return  GestureDetector(
      onTap: onPress,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(

            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                       image: displayImage,
                       // image: AssetImage(product.mainImage),
                      ),
                    ),
                  ),
                  flex: 4,
                ),
                Flexible(
                  child: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: <Widget>[
                                Text('${product.title}'),
                                Text(
                                  'Rs ${product.price}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: 130,
                            top:10,
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                                Text(
                                  '${product.likes}',
                                  style: TextStyle(
                                      color: Color.fromRGBO(
                                          240, 98, 146, 1)),
                                )
                              ],
                            ),
                          )
                        ],
                        alignment: Alignment.bottomLeft,
                      )),
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
  }
}