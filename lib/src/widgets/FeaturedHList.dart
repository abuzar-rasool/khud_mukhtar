
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/card/all_services_card.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';
import 'package:khud_mukhtar/src/screens/service_single.dart';

import 'loading.dart';


class FeaturedHList extends StatefulWidget{
  //CustomListView({);
  @override
  _FeaturedHListState createState() => _FeaturedHListState();
}

class _FeaturedHListState extends State<FeaturedHList> {

  Future getItems() async{
    var firestore = Firestore.instance;
    QuerySnapshot userDoc =  await firestore.collection("Products").where("Featured",isEqualTo: true).getDocuments();
    //print(userDoc.data);
    //print(widget.userID);
    return userDoc.documents;
//    if(userDoc.data.containsKey("productList")){
//
//      var myProductIDs = (userDoc.data["productList"]);
//
//      var myProducts = [];
//      for(String id in myProductIDs){
//        print(id);
//
//        DocumentSnapshot product = await firestore.collection("Products").document(id).get();
//        myProducts.add(product);
//      }
//      return myProducts;
//    }
  }
  @override
  Widget build(BuildContext context) {
    return




      Container(
        child:FutureBuilder(
            future: getItems()
            ,builder:(_, snapshot){
          if (snapshot.data == null){
            return LoadingView();
          }

          if(snapshot.connectionState == ConnectionState.waiting){
            return LoadingView();
          }else {
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
                        child: GridView.count(
                            scrollDirection: Axis.horizontal,
                            crossAxisCount: 1,
                            children:List.generate(snapshot.data.length, (index){
                              DocumentSnapshot doc = snapshot.data[index];
                              var product = Product.fromMap(doc.data);

                              //Map product = doc.data;
                              Image thumnail = Image.network(product.mainImage);
                              print("Rs "+ product.price.toString());

                              return CustomCardProduct(
                                product: product,
                                myImage: thumnail,
                                onPress: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ServiceSinglePage(
                                          product: product,
                                        )),
                                  );
                                },
                              );

                            })
                        )
                      ),
                    )
                  ],
                ),
              ),
            );



//            return
//
//              GridView.count(
//                  scrollDirection: Axis.horizontal,
//                  crossAxisCount: 1,
//                  children:List.generate(snapshot.data.length, (index){
//                    DocumentSnapshot doc = snapshot.data[index];
//                    var product = Product.fromMap(doc.data);
//
//                    //Map product = doc.data;
//                    Image thumnail = Image.network(product.mainImage);
//                    print("Rs "+ product.price.toString());
//
//                    return CustomCardProduct(
//                      product: product,
//                      myImage: thumnail,
//                      onPress: () {
//                        Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => ServiceSinglePage(
//                                product: product,
//                              )),
//                        );
//                      },
//                    );
//
//                  })
//              );
          }

        })
    );
  }
}

class CustomCardProduct extends StatelessWidget {
  final Product product;
  final Function onPress;
  var myImage;
  CustomCardProduct({this.onPress, this.product,this.myImage});




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
                        image: myImage.image,
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
                          Text(product.title,maxLines: 1,),
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