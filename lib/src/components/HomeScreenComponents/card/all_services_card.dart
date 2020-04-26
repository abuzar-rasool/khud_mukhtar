import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';

class AllServicesCard extends StatelessWidget {
  AllServicesCard(
      {@required this.product, @required this.onPress, this.myImage});
  final Product product;
  final Image myImage;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    ImageProvider displayImage =
    myImage == null ? AssetImage("splash.png") : myImage.image;
    return GestureDetector(
      onTap: onPress,
      child: Card(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(8)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: displayImage,
                    ),
                  ),
                ),
                flex: 4,
              ),
              Flexible(
                child: Padding(
                    padding: const EdgeInsets.only(top: 9, right: 9, left: 9),
                    child: Stack(
                      children: <Widget>[
                        Container(

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('${product.title}', softWrap: true,
                                maxLines: 1,),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Rs ${product.price}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Row(
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
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                      alignment: Alignment.bottomLeft,
                    )),
                flex: 2,
              )
            ],
          ),
        ),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        elevation: 5.0,
      ),
    );
  }
}
