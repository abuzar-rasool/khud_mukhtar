import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/card/all_services_card.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';
import 'package:khud_mukhtar/src/screens/service_single.dart';
import 'package:khud_mukhtar/src/widgets/loading.dart';

class CategoryBrowse extends StatelessWidget {

  String categoryName;
  CategoryBrowse({this.categoryName});
  List<DocumentSnapshot> _documentSnapshot;
  Future<bool> getCategoryProducts() async {
    QuerySnapshot categoryProducts = await Firestore
        .instance
        .collection('Products')
        .where('categoryName',isEqualTo: categoryName)
        .getDocuments();
    _documentSnapshot = categoryProducts.documents;
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: FutureBuilder(
        future: getCategoryProducts(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            if(snapshot.data){
              return
                GridView.count(
                    crossAxisCount: 2,
                    children:List.generate(_documentSnapshot.length, (index){
                      DocumentSnapshot doc = snapshot.data[index];
                      var product = Product.fromMap(doc.data);
                      //Map product = doc.data;
                      Image thumnail = Image.network(product.mainImage);
                      print("Rs "+ product.price.toString());
                      return AllServicesCard(
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
                );
            }else{
              return Text('No products found');
            }
          }
          return LoadingView();
        },
      ),
    );
  }
}
