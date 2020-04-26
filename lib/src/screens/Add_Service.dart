import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

import '../uplod.dart';

class Service {
  const Service(this.name);

  final String name;
}

List<String> _category = <String>[
  'Teaching',
  'Baking',
  'Cooking',
  'Marketing',
  'Beauty',
  'Content',
  'Programming',
];

class AddService extends StatefulWidget {
  AddService({Key key}) : super(key: key);

  @override
  _AddService createState() => _AddService();
}

class _AddService extends State<AddService> {
  String serviceName;
  bool imageCheck = true;
  int servicePrice;
  String categorySelected;
  bool homeBased = false;
  bool online = false;
  String description;
  bool chipCheck = true;
  var selectedType;
  final databaseReference = Firestore.instance;
  final formkey = new GlobalKey<FormState>();

  bool validate()
  {
    final form = formkey.currentState;
    if (form.validate()) {
     if(homeBased == true || online == true)
       {
         form.save();
         return true;
       }
     else
       {
         setState(() {
           chipCheck = false;
         });
       }
    }
    if(homeBased == true || online == true)
    {
      setState(() {
        chipCheck = true;
      });
    }
    else
      {
        setState(() {
          chipCheck = false;
        });
      }
    return false;
  }

  List<File> images = [null, null, null, null, null, null];
  File image;

  Future _getImage() async {
    File picture = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 300.0, maxHeight: 500.0);
    setState(() {
      image = picture;
    });
  }

  Future _getImages(int i) async {
    File pictures = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 300.0, maxHeight: 500.0);
    print('pictures : $pictures');
    setState(() {
      images[i] = pictures;
      print("Im here.");
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey =
    new GlobalKey<ScaffoldState>();

    //  AssetImage logo = AssetImage('assets/logo.png');
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 98, 146, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        title: Text('Add New Service'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                  key: formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                  new ListTile(

                    title: new Text('Service Name',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(240, 98, 146, 1)),
                    ),
                    subtitle: new TextFormField(
                      onChanged: (value) {
                        serviceName = value;
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.business_center,
                          color: Color.fromRGBO(240, 98, 146, 1),
                        ),
                        hintText: "eg. Fatima Moin",
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: 15.0),
                        labelStyle: TextStyle(color: Colors.grey),
                        errorStyle: TextStyle(color: Colors.pink),
                      ),
                      validator: (value) => value.isEmpty ? "Please enter your service name" : null,


                    ),
                    isThreeLine: true,
                  ) , //service name
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Main Image',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(240, 98, 146, 1)),
                              ),
                            ),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: const EdgeInsets.all(15),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: _getImage,
                                  child: Container(
                                    color: Colors.black12,
                                    child: image == null
                                        ? Icon(FontAwesomeIcons.plus,
                                        color:
                                        Color.fromRGBO(240, 98, 146, 1))
                                        : Image.file(image),
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ), //main image
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Other Images',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(240, 98, 146, 1)),
                              ),
                            ),
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            primary: false,
                            padding: const EdgeInsets.all(15),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () => _getImages(0),
                                  child: Container(
                                    color: Colors.black12,
                                    child: images[0] == null
                                        ? Icon(FontAwesomeIcons.plus,
                                        color:
                                        Color.fromRGBO(240, 98, 146, 1))
                                        : Image.file(images[0]),
                                  )),
                              GestureDetector(
                                  onTap: () => _getImages(1),
                                  child: Container(
                                    color: Colors.black12,
                                    child: images[1] == null
                                        ? Icon(FontAwesomeIcons.plus,
                                        color:
                                        Color.fromRGBO(240, 98, 146, 1))
                                        : Image.file(images[1]),
                                  )),
                              GestureDetector(
                                  onTap: () => _getImages(2),
                                  child: Container(
                                    color: Colors.black12,
                                    child: images[2] == null
                                        ? Icon(FontAwesomeIcons.plus,
                                        color:
                                        Color.fromRGBO(240, 98, 146, 1))
                                        : Image.file(images[2]),
                                  )),
                              GestureDetector(
                                  onTap: () => _getImages(3),
                                  child: Container(
                                    color: Colors.black12,
                                    child: images[3] == null
                                        ? Icon(FontAwesomeIcons.plus,
                                        color:
                                        Color.fromRGBO(240, 98, 146, 1))
                                        : Image.file(images[3]),
                                  )),
                              GestureDetector(
                                  onTap: () => _getImages(4),
                                  child: Container(
                                    color: Colors.black12,
                                    child: images[4] == null
                                        ? Icon(FontAwesomeIcons.plus,
                                        color:
                                        Color.fromRGBO(240, 98, 146, 1))
                                        : Image.file(images[4]),
                                  )),
                              GestureDetector(
                                  onTap: () => _getImages(5),
                                  child: Container(
                                    color: Colors.black12,
                                    child: images[5] == null
                                        ? Icon(FontAwesomeIcons.plus,
                                        color:
                                        Color.fromRGBO(240, 98, 146, 1))
                                        : Image.file(images[5]),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ), //more images
                    new ListTile(

                      title: new Text('Price',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(240, 98, 146, 1)),
                      ),
                      subtitle: new TextFormField(
                        onChanged: (value) {
                          servicePrice = int.parse(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: Color.fromRGBO(240, 98, 146, 1),
                          ),
                          hintText: "eg. 5000",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 15.0),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(color: Colors.pink),

                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) => value.isEmpty ? "Please enter a price" : null,

                      ),
                      isThreeLine: true,
                    ) , //price
                    new ListTile(

                      title: new Text('Category',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(240, 98, 146, 1)),
                      ),
                      subtitle: DropdownButtonFormField(
                          items: _category
                              .map((value) => DropdownMenuItem(
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black),
                            ),
                            value: value,
                          ))
                              .toList(),
                          onChanged: (selectedCategoryType) {
                            print('$selectedCategoryType');

                            setState(() {
                              selectedType = selectedCategoryType;
                              categorySelected = selectedType;
                            });
                          },
                          isDense: true,
                          value: selectedType,
                          isExpanded: false,
                          hint:  Text(
                            'Choose Category',
                            style: TextStyle(color: Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Please select your category";
                            };
                          }
                      ),
                      isThreeLine: true,
                    ) , //category
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, bottom: 7),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Service Type',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(240, 98, 146, 1)),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 20.0, bottom: 12),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[Wrap(
                                          spacing: 5.0,
                                          runSpacing: 5.0,
                                          children: <Widget>[
                                            filterChipWidget(
                                              chipName: 'Home-Based',
                                              isSelected: homeBased,
                                              onClick: (value) {
                                                homeBased = value;

                                              },
                                            ),
                                            filterChipWidget(
                                              chipName: 'Online',
                                              isSelected: online,
                                              onClick: (value) {
                                                online = value;
                                              },
                                            ),

                                          ],
                                        ),],
                                      ),
                                      showAlert(),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ), //service type
                    new ListTile(
                      title: new Text('Description',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(240, 98, 146, 1)),
                      ),
                      subtitle: new TextFormField(
                        onChanged: (value) {
                          description = value;
                        },
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: "eg. Teaching young kids to code in Python",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: 15.0),
                          labelStyle: TextStyle(color: Colors.grey),
                          errorStyle: TextStyle(color: Colors.pink),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                      )
                        ),
                        validator: (value) => value.isEmpty ? "Please enter a description" : null,
                      ),
                      isThreeLine: true,
                    ) ,
                   //description
                    SizedBox(height:17),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 12),
                        child: SizedBox(
                          height: 50,
                          child: Builder(
                            builder: (context) => RaisedButton(
                              onPressed: () async {
                                if (validate())
                                  {
                                    FirebaseUser currentUser =
                                    await FirebaseAuth.instance.currentUser();
                                    print(serviceName);
                                    print(servicePrice);
                                    print(categorySelected);
                                    print(homeBased);
                                    print(online);
                                    print(description);
                                    Product newService = Product(
                                      title: serviceName,
                                      price: servicePrice,
                                      description: description,
                                      categoryName: categorySelected,
                                      userId: currentUser.uid,
                                      online: online,
                                      homeBased: homeBased,
                                      likes: 0,
                                    );

                                    CollectionReference productCollection =
                                    databaseReference.collection("Products");
                                    DocumentReference productDocument =
                                    await productCollection
                                        .add(newService.toMap())
                                        .catchError((e) {
                                      print(e);
                                    });
                                    DocumentReference userDocument = databaseReference
                                        .collection("Users")
                                        .document(currentUser.uid.toString());

                                    await userDocument.updateData({
                                      'productList': FieldValue.arrayUnion(
                                          [productDocument.documentID])
                                    });

                                    print('Text Data Uploaded Uplodaing Images....');
                                    var productMainImage = FileUpload(
                                        fileType: 'productimage',
                                        file: image,
                                        id: productDocument.documentID);

                                    String imagepath =
                                    await productMainImage.uploadFile();
                                    print('Main Image Uploaded');
                                    List<String> galleryImagePath = [];
                                    for (var galleryImage in images) {
                                      if (galleryImage != null) {
                                        var productGalleryImage = FileUpload(
                                            fileType: 'productgallery',
                                            file: galleryImage,
                                            id: productDocument.documentID);
                                        String productGalleryImagePath =
                                        await productGalleryImage.uploadFile();
                                        galleryImagePath.add(productGalleryImagePath);
                                      }
                                    }
                                    print('Gallery Image Uploaded');

                                    await productDocument.updateData({
                                      'imageurl': imagepath,
                                      'galleryImages':
                                      FieldValue.arrayUnion(galleryImagePath)
                                    });

                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Service Published'),
                                      duration: Duration(seconds: 3),
                                    ));

                                  }
                              },
                              autofocus: true,
                              shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              color: Color.fromRGBO(240, 98, 146, 1),
                              child: Text(
                                'Publish Service',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ))),
      backgroundColor: Colors.white,
    );
  }

  Widget showAlert() {
    if (chipCheck == false) {
      return Container(
        width: double.infinity,
        child: Text(
                  "Please select a service type",
                  style: TextStyle(
                      color: Color.fromRGBO(204, 0, 0,1),
                    fontSize: 12,
                  ),

                ),
        );
    }
    return SizedBox(
      height: 0,
    );
  }

}
//chip update
class filterChipWidget extends StatefulWidget {
  final String chipName;
  bool isSelected;
  Function onClick;

  filterChipWidget({Key key, this.chipName, this.isSelected, this.onClick})
      : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 16.0,
          fontWeight: FontWeight.bold),
      selected: widget.isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: Color.fromRGBO(240, 96, 146, 1),
      onSelected: (isSelected) {
        setState(() {
          widget.isSelected = !widget.isSelected;
          widget.onClick(widget.isSelected);
        });
      },
      selectedColor: Color.fromRGBO(247, 166, 194, 1),
    );
  }
}
