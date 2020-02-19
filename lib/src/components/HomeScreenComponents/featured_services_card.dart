import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';
import 'package:khud_mukhtar/src/screens/service_single.dart';


class FeaturedServices extends StatelessWidget {

  FeaturedServices({@required this.index, @required this.onPress});
  final index;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Center(
      child: Container(
        height: 300,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: allProducts.length==null ? 0 : allProducts.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new CustomCardProduct(
                      product:allProducts[index],
                      onPress: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ServiceSinglePage(product: allProducts[index],)),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCardProduct extends StatelessWidget {
  final Product product;
  final Function onPress;
  CustomCardProduct({this.onPress, this.product});




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onPress,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(0),
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
                    height: 135,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(product.mainImage),
                      ),
                    ),
                  ),
                  flex: 4,
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
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
                          Text(product.title),
                          Spacer(),
                          Row(
                            children: <Widget>[
                              Text(
                                'Rs ${product.price}',
                                style: TextStyle(
                                    fontWeight:
                                    FontWeight
                                        .bold),
                              ),
                              Spacer(),
                              Icon(Icons.favorite,
                                  color: Colors.red),
                              Text(
                                '${product.likes}',
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