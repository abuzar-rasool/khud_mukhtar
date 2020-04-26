import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khud_mukhtar/src/components/HomeScreenComponents/card/all_services_card.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';
import 'package:khud_mukhtar/src/screens/service_single.dart';

class SearchScreen extends StatefulWidget {
  bool searchEnabled;
  SearchScreen({this.searchEnabled = true});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double preferredSize = 64;
  static int none = 2;
  static final TextEditingController myController = TextEditingController();
  //var mySearchWidget = SearchResults();

  List<Widget> bottomSearchBar = <Widget>[
    SizedBox(
      height: 9,
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: TextField(
        onChanged: (text){
        //  print("Text: $text");
        },
       controller: myController,
        autofocus: true,
        enabled: true,
        decoration: InputDecoration(

          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),

          hintText: "What are you looking for",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0),
        ),
      ),
    ),
  ];
  List<Widget> _createActionWidget(searchEnabled) {
    if (!searchEnabled) {
      return <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Karachi, Pakistan",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.location_on,
              color: Colors.white,
            )
          ],
        )
      ];
    } else {
      return <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              if (preferredSize > 64) {
                preferredSize -= 160;
                print('Filter closed');
                bottomSearchBar.removeLast();
              } else {
                preferredSize += 160;
                print('Filter opened');
                bottomSearchBar.add(Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          Text(
                            'Categories',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              showFancyCustomDialog(context);
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Chip(
                            label: Text(
                              'Home Based',
                              style: TextStyle(color: Colors.pink[300]),
                            ),
                            avatar: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.cancel,
                                color: Colors.pink[300],
                              ),
                            ),
                            deleteIconColor: Colors.white,
                            backgroundColor: Colors.white,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Service Type',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              showFancyCustomDialog(context);
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Chip(
                            label: Text(
                              'All',
                              style: TextStyle(color: Colors.pink[300]),
                            ),
                            avatar: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.cancel,
                                color: Colors.pink[300],
                              ),
                            ),
                            deleteIconColor: Colors.white,
                            backgroundColor: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                ));
              }
            });
          },
          icon: Icon(
            Icons.filter_list,
            color: Colors.white,
          ),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        leading: widget.searchEnabled
            ? IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {

                  Navigator.pop(context);

                },
              )
            : Icon(
                Icons.menu,
                color: Colors.white,
              ),
        actions: _createActionWidget(widget.searchEnabled),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(40),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(preferredSize),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 25, right: 16, left: 16),
            child: Container(
              alignment: Alignment.center,
              height: preferredSize,
              child: Column(
                children: bottomSearchBar,
              ),
            ),
          ),
        ),
      ),
      body:
      Padding(padding: EdgeInsets.all(8),child:SearchResults(myController: myController,) ,)

        ,
    );
  }

  final category = [
    'Education',
    'Cooking',
    'Baking',
    'Photography',
    'Marketing',
    'Programming'
  ];

  void showFancyCustomDialog(BuildContext context) {
    Dialog fancyDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 600.0,
        width: 300.0,
        child: Stack(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child:  ListView.builder(
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {Navigator.pop(context);},
                          child: ListTile(title: Text(category[index])));
                    })
            ),
//            Container(
//              width: double.infinity,
//              height: 50,
//              alignment: Alignment.bottomCenter,
//              decoration: BoxDecoration(
//                color: Colors.pink[300],
//                borderRadius: BorderRadius.only(
//                  topLeft: Radius.circular(12),
//                  topRight: Radius.circular(12),
//                ),
//              ),
//              child: Align(
//                alignment: Alignment.center,
//                child: Text(
//                  "Choose a category",
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 20,
//                      fontWeight: FontWeight.w600),
//                ),
//              ),
//            ),
//            Align(
//              alignment: Alignment.bottomCenter,
//              child: InkWell(
//                onTap: () {
//                  Navigator.pop(context);
//                },
//                child: Container(
//                  width: double.infinity,
//                  height: 50,
//                  decoration: BoxDecoration(
//                    color: Colors.blue[300],
//                    borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(12),
//                      bottomRight: Radius.circular(12),
//                    ),
//                  ),
//                  child: Align(
//                    alignment: Alignment.center,
//                    child: Text(
//                      "Okay let's go!",
//                      style: TextStyle(
//                          color: Colors.white,
//                          fontSize: 20,
//                          fontWeight: FontWeight.w600),
//                    ),
//                  ),
//                ),
//              ),
//            ),
            Align(
              // These values are based on trial & error method
              alignment: Alignment(1.05, -1.05),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => fancyDialog);
  }
}

void textEntered(String text){
  print(text);
}




 class SearchResults extends StatefulWidget {
   var originalDocuments = List();



   TextEditingController myController;
   SearchResults({this.myController});
   @override
   SearchResultsState createState() => SearchResultsState();

 }

 class SearchResultsState extends State<SearchResults> {

   var filteredDocuments = List();

   Future getItems() async{
     if (widget.originalDocuments.length > 0){
       return widget.originalDocuments;
     }
    // var userID = widget.userID ?? await getID();

     widget.originalDocuments = List();

     filteredDocuments = List();
     var firestore = Firestore.instance;
     QuerySnapshot userDoc =  await firestore.collection("Products").getDocuments();
     //print(userDoc.data);
     //print(widget.userID);
     //userDoc.documents.
     for (DocumentSnapshot d in userDoc.documents){
       var product = Product.fromMap(d.data);
       if (!widget.originalDocuments.contains(product)){
       widget.originalDocuments.add(product);}
     }
     print(widget.originalDocuments.length);
//     filteredDocuments = widget.originalDocuments;
//
//     if (this.mounted){
//       setState((){
//         //Your state change code goes here
//       });
//     }

     return widget.originalDocuments;
     //originalDocuments.addAll(userDoc.documents);
//     if(userDoc.data.containsKey("productList")){
//
//       var myProductIDs = (userDoc.data["productList"]);
//
//       var myProducts = [];
//       for(String id in myProductIDs){
//         print(id);
//
//         DocumentSnapshot product = await firestore.collection("Products").document(id).get();
//         myProducts.add(product);
//       }
//       return myProducts;
//     }
   }

bool doesContain(Product product, String text){
  if (product.title != null){
  if (product.title.toLowerCase().contains(text)){
return true;
  }}
  if (product.description != null){
  if (product.description.toLowerCase().contains(text)){
    return true;
  }}

  return false;
}

   void searchDocuments(String text){
     filteredDocuments = List();
     if (widget.originalDocuments.length == 0){return;}

     for (Product product in widget.originalDocuments){

      if (doesContain(product,text) && !filteredDocuments.contains(product)){
        filteredDocuments.add(product);
      }
     }
   }

   @override
   Widget build(BuildContext context) {


     print("yoooo" );
    widget.myController.addListener((){

      print(widget.myController.text);
     searchDocuments(widget.myController.text.toLowerCase());
      print(widget.originalDocuments);
      print(filteredDocuments);
//      setState(() {
//
//      });

      if (this.mounted){
        setState((){
          //Your state change code goes here
        });
      }
    });
    getItems();
//    FutureBuilder(future: getItems(),
//      builder: (_, snapshot){
//        //return Text("YAYYY");
//
//      },);
     return

       GridView.count(
           crossAxisCount: 2,
           children:List.generate(filteredDocuments.length, (index){
            // DocumentSnapshot doc = snapshot.data[index];
             var product = filteredDocuments[index];

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

   }
 }

