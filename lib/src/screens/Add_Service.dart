import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Service {
  const Service(this.name);
  final String name;
}

var  selectedType;
List<String> _category = <String>[
'Teaching',
'Baking',
'Cooking',
'Marketing'];

class AddService extends StatefulWidget {
  AddService({Key key}) : super(key: key);

  @override
  _AddService createState() => _AddService();
}

class _AddService extends State<AddService> {
  List<File> images= [null, null, null, null,null,null];
  File image;
  Future _getImage() async {
    File picture = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 300.0, maxHeight: 500.0);
    setState(() {
      image= picture;
    });}
  Future _getImages(int i) async {
    File pictures = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxWidth: 300.0, maxHeight: 500.0);
    print('pictures : $pictures');
    setState(() {
       images[i]= pictures;
       print("Im here.");
    });}
  @override
  Widget build(BuildContext context) {
    //  AssetImage logo = AssetImage('assets/logo.png');
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(240, 98, 146, 1),
        leading: IconButton(
          icon: Icon (Icons.arrow_back),
        onPressed:(){},
          color: Color.fromRGBO(255, 255, 255, 1),
      ),
        title: Text('Add New Service'),),
      body: SafeArea(
       child: SingleChildScrollView(
         scrollDirection: Axis.vertical,
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
                     padding: const EdgeInsets.only(left:20, right: 20, bottom: 12),
                     child: Align( alignment: Alignment.centerLeft,
                       child : Text('Service Name',  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color.fromRGBO(240, 98, 146, 1)),),
                     ),

                   ),
                   Padding(padding: const EdgeInsets.only(left:20, right: 20, bottom: 12),
                   child:SizedBox(
                     height: 50,
                     child:TextField(
                       decoration: InputDecoration(
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(20.0),
                           borderSide: new BorderSide(color : Color.fromRGBO(240,96,146,1)),
                         ),
                         focusedBorder: OutlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(240,96,146,1))),
                         prefixIcon: Icon(
                           Icons.business_center,
                           color: Color.fromRGBO(240, 98, 146, 1),
                         ),

                         labelText: "eg. Tutions - O Levels",
                         hintStyle: TextStyle(color: Colors.grey, fontSize: 9),
                         labelStyle: TextStyle(color: Colors.grey),
                       ),
                     ),
                   )),
                 ],
               ),
             ),//service name
             Container(
                   width: MediaQuery.of(context).size.width,
                   child: Column(
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.only(left:20, right: 20,),
                         child: Align( alignment: Alignment.centerLeft,
                           child : Text('Main Image',  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color.fromRGBO(240, 98, 146, 1)),),
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
                                    ? Icon(FontAwesomeIcons.plus, color: Color.fromRGBO(240, 98, 146, 1))
                                     : Image.file(image),
                               )
                           )

                         ],
                       ),

                     ],
                   ),
                 ),//main image
             Container(
               width: MediaQuery.of(context).size.width,
               child: Column(
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(left:20, right: 20,),
                     child: Align( alignment: Alignment.centerLeft,
                       child : Text('Other Images',  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color.fromRGBO(240, 98, 146, 1)),),
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
                           onTap:() => _getImages(0),
                           child: Container(
                             color: Colors.black12,
                             child: images[0] == null
                                 ? Icon(FontAwesomeIcons.plus, color: Color.fromRGBO(240, 98, 146, 1))
                                 : Image.file(images[0]),
                           )
                       ),
                       GestureDetector(
                           onTap:() => _getImages(1),
                           child: Container(
                             color: Colors.black12,
                             child: images[1] == null
                                 ? Icon(FontAwesomeIcons.plus, color: Color.fromRGBO(240, 98, 146, 1))
                                 : Image.file(images[1]),
                           )
                       ),
                       GestureDetector(
                           onTap:() => _getImages(2),
                           child: Container(
                             color: Colors.black12,
                             child: images[2] == null
                                 ? Icon(FontAwesomeIcons.plus, color: Color.fromRGBO(240, 98, 146, 1))
                                 : Image.file(images[2]),
                           )
                       ),
                       GestureDetector(
                           onTap:() => _getImages(3),
                           child: Container(
                             color: Colors.black12,
                             child: images[3] == null
                                 ? Icon(FontAwesomeIcons.plus, color: Color.fromRGBO(240, 98, 146, 1))
                                 : Image.file(images[3]),
                           )
                       ),
                       GestureDetector(
                           onTap:() => _getImages(4),
                           child: Container(
                             color: Colors.black12,
                             child: images[4] == null
                                 ? Icon(FontAwesomeIcons.plus, color: Color.fromRGBO(240, 98, 146, 1))
                                 : Image.file(images[4]),
                           )
                       ),
                       GestureDetector(
                           onTap:() => _getImages(5),
                           child: Container(
                             color: Colors.black12,
                             child: images[5] == null
                                 ? Icon(FontAwesomeIcons.plus, color: Color.fromRGBO(240, 98, 146, 1))
                                 : Image.file(images[5]),
                           )
                       ),


                     ],
                   ),

                 ],
               ),
             ),//more images
            Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:20, right: 20, bottom: 12),
                    child: Align( alignment: Alignment.centerLeft,
                      child : Text('Price',  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color.fromRGBO(240, 98, 146, 1)),),
                    ),

                  ),
         Padding(
           padding: const EdgeInsets.only(left:20, right: 20, bottom: 12),
           child:
           SizedBox(
             height:50,child:
           TextField(
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(20.0),
                 borderSide: new BorderSide(color : Color.fromRGBO(240,96,146,1)),
               ),
               focusedBorder: OutlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(240,96,146,1))),
               prefixIcon: Icon(
                 Icons.attach_money,
                 color: Color.fromRGBO(240, 98, 146, 1),
               ),
               prefixText: "PKR ",
               prefixStyle: TextStyle(color: Colors.black),
               labelText: "eg. 5000",
               hintStyle: TextStyle(color: Colors.grey, fontSize: 9.0),
               labelStyle: TextStyle(color: Colors.grey),
             ),
           ),
           )),
                ],
                  ),
            ), //price
             Container(
               width: MediaQuery.of(context).size.width,
               child: Column(
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(left:20.0, right:20,bottom:3),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:Text('Category', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color.fromRGBO(240, 98, 146, 1)),),
                    ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left:20, right: 20, bottom: 12),
                     child: Align(
                       alignment: Alignment.centerLeft,
                       child:DropdownButton(
                         items: _category.map((value) => DropdownMenuItem(
                           child: Text(
                             value,
                             style: TextStyle(color:  Colors.black),
                           ),
                           value: value,
                         ))
                             .toList(),
                         onChanged: (selectedCategoryType) {
                           print('$selectedCategoryType');
                           setState(() {
                             selectedType = selectedCategoryType;
                           });
                         },
                         value: selectedType,
                         isExpanded: false,
                         hint: Text(
                           'Choose Category Type',
                           style: TextStyle(color:  Colors.black, fontSize: 15),
                         ),
                       ),
                       ),
                     ),
                   ],


               ),
             ),//category
             Container(
               width: MediaQuery.of(context).size.width,
               child: Column(
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(left:20.0, right: 20.0, bottom: 7),
                     child: Align(
                       alignment: Alignment.centerLeft,
                       child: Text('Service Type', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color.fromRGBO(240, 98, 146, 1)),),

                     )
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left:19.0, right: 20.0, bottom: 12),
                     child: Align
                       (
                       alignment: Alignment.centerLeft,
                       child: Container(
                           child: Wrap(
                             spacing: 5.0,
                             runSpacing: 5.0,
                             children: <Widget>[
                               filterChipWidget(chipName: 'Home-Based'),
                               filterChipWidget(chipName: 'Online'),
                             ],
                           )
                       ),
                     ),
                   ),

                 ],
               ),
             ),//service type
             Container(
               width: MediaQuery.of(context).size.width,
               child: Column(
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(left:20.0, right:20, bottom: 12),
                    child:
                        Align(
                          alignment: Alignment.centerLeft,
                          child:  Text('Description', textAlign: TextAlign.right, style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold,  color: Color.fromRGBO(240, 98, 146, 1)),
                          ),
                        ),
                  ),
                   Container(
                     child:
                     Padding(
                       padding: const EdgeInsets.only(left:20.0, right: 20, bottom:12),
                       child: SizedBox(
                         height:50,
                         child:TextField(

                           decoration: InputDecoration(
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20.0),
                               borderSide: new BorderSide(color : Color.fromRGBO(240,96,146,1)),
                             ),
                             focusedBorder: OutlineInputBorder(borderSide: new BorderSide(color: Color.fromRGBO(240,96,146,1))),

                             hintText: "Tutions from 8am-5pm.",
                             labelText: "Add Description here",
                             hintStyle: TextStyle(color: Colors.grey, fontSize: 9),
                             labelStyle: TextStyle(color: Colors.grey),
                           ),
                           keyboardType:  TextInputType.multiline,
                           maxLines: null,

                         )
                       ),
                     ),
                   ),


                 ],
               ),
             ),//description
             Container(
               width: MediaQuery.of(context).size.width,
               child: Padding(
                 padding:  const EdgeInsets.only(right:20, left:20, bottom:12),
                 child: SizedBox(
                   height: 50,
                   child:RaisedButton(
                     onPressed:(){},
                     autofocus: true,
                     shape:ContinuousRectangleBorder(
                       borderRadius:BorderRadius.circular(15),
                     ),

                     color: Color.fromRGBO(240, 98, 146, 1),
                     child: Text('Publish Service', style: TextStyle(
                         fontSize: 22, fontWeight: FontWeight.bold,  color: Color.fromRGBO(255, 255, 255, 1)),
                     ),
                   ),
                 ),
               ),

             ),
           ],
         )
       )
      ),
      backgroundColor: Colors.white,
    );
  }
}

class filterChipWidget extends StatefulWidget {
  final String chipName;

  filterChipWidget({Key key, this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      labelStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1),fontSize: 16.0,fontWeight: FontWeight.bold),
      selected: _isSelected,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            30.0),),
      backgroundColor:  Color.fromRGBO(240,96,146,1),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Color.fromRGBO(247,166,194,1),);
  }
}
