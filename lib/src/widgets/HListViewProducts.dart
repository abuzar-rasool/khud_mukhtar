
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/card/all_services_card.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';
import 'package:khud_mukhtar/src/screens/service_single.dart';

import 'loading.dart';

class HListViewProducts extends StatefulWidget{
  //CustomListView({);
  @override
  _HListViewProductsState createState() => _HListViewProductsState();
}

class _HListViewProductsState extends State<HListViewProducts> {

  Future getItems() async{
    var firestore = Firestore.instance;
    QuerySnapshot userDoc =  await firestore.collection("Products").getDocuments();
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
    return Container(
        child:FutureBuilder(
            future: getItems()
            ,builder:(_, snapshot){
          if (snapshot.data == null){
            return LoadingView();
          }

          if(snapshot.connectionState == ConnectionState.waiting){
            return LoadingView();
          }else {
            return

              GridView.count(
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 1,
                  children:List.generate(snapshot.data.length, (index){
                    DocumentSnapshot doc = snapshot.data[index];
                    var product = Product.fromMap(doc.data);

                    //Map product = doc.data;
                    Image thumnail = null;
                    if (product.mainImage != null){
                      thumnail  = Image.network(product.mainImage);
                    }
                    print("Rs "+ product.price.toString());

                    return AllServicesCard(
                      product: product,
                      myImage: thumnail ,
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
              );
          }

        })
    );
  }
}
