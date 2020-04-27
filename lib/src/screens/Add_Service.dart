import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khud_mukhtar/src/models/user_model.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:khud_mukhtar/src/screens/profile_screen.dart';
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
  String error;

  var selectedType;
  final databaseReference = Firestore.instance;
  static final formkey = new GlobalKey<FormState>();

  bool validate()
  {
    final form = formkey.currentState;
    if (form.validate()) {
     if(homeBased == true || online == true)
       {
         if (imageCheck == true)
           {
             form.save();
             return true;
           }
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
    if(image != null)
    {
      setState(() {
        imageCheck = true;
      });
    }
    else
    {
      setState(() {
        imageCheck = false;
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
    //  var _scaffoldKey = new GlobalKey<ScaffoldState>();
    //  AssetImage logo = AssetImage('assets/logo.png');
    // TODO: implement build
    return Scaffold(

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
              child: Stack(
                children: <Widget>[
                  Form(
                      key: formkey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
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
                                  padding: const EdgeInsets.only(left: 15, right: 15, top:15, bottom: 7),
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
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                    ),
                                    child: showAlert(2, "Please upload an image."))
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
                                    top: 7,
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
                                hintText: "eg. Python Classes",
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 15.0),
                                labelStyle: TextStyle(color: Colors.grey),
                                errorStyle: TextStyle(color: Colors.pink),
                              ),
                              validator: (value) =>
                              value.isEmpty
                                  ? "Please enter your service name"
                                  : null,
                            ),
                            isThreeLine: true,
                          ), //service name
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
                              decoration: InputDecoration(

                                errorStyle: TextStyle(color: Colors.pink),
                              ),
                              hint:  Text(
                                'Choose Category',
                                style: TextStyle(color: Colors.grey),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return "Please select your category";
                                };
                              },
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
                                            showAlert(1, "Please select a service type"),
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
                          ) , //description
                          SizedBox(height:17),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, bottom: 12),
                              child: SizedBox(
                                height: 50,
                                child: Builder(
                                  builder: (context) => ProgressButton(
                                    defaultWidget: const Text('Add Service',
                                        textAlign: TextAlign.center, style:
                                        TextStyle(fontSize: 24, color: Colors.white)),
                                    progressWidget: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                                    animate: false,
                                    color: Color.fromRGBO(240, 98, 146, 1),
                                    borderRadius: 80,
                                    type: ProgressButtonType.Raised,
                                    onPressed: () async {
                                      if (image == null)
                                      {
                                        setState(() {
                                          imageCheck = false;
                                        });
                                      }
                                      if (homeBased == false && online == false)
                                        setState(() {
                                          chipCheck = false;
                                        });
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
                                          setState(() {
                                            error = e.message.toString();
                                          });
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


                                        Navigator.pop(context,
                                            "Your Service has been created.");
                                      };
                                    },

                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                  showAlert(3, error)
                ],
              ))),
      backgroundColor: Colors.white,
    );
  }

  Widget showAlert(int id, String error) {
    if (id == 1)
      {
        if (chipCheck == false) {
          return Container(
            width: double.infinity,
            child: Text(
              error,
              style: TextStyle(
                color: Colors.pink,
                fontSize: 12,
              ),

            ),
          );
        }
      }
    else if (id == 2)
      {
        if (imageCheck == false) {
          return Container(
            width: double.infinity,
            child: Text(
              error,
              style: TextStyle(
                color: Colors.pink,
                fontSize: 12,
              ),
            ),
          );
        }
      }
    else if (id == 3) {
    if (error != null)
      {
        Container(
          color: Color.fromRGBO(240, 98, 146, 1),
          width: double.infinity,
          height : MediaQuery.of(context).size.height/11,
          padding: EdgeInsets.fromLTRB(8, 6, 8, 6),
          child: Center(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.error_outline, color: Colors.white),
                ),
                Expanded(
                  child: AutoSizeText(
                    error,
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: IconButton(
                    icon: Icon(Icons.close,
                      color: Colors.white,),
                    onPressed: () {
                      setState(() {
                        error = null;
                      });
                    },
                  ),
                )
              ],
            ),
          ),

        );
      }
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
