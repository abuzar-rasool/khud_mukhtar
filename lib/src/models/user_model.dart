import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class User {
   String id;
   String name;
   String imageUrl;
   String cnicPicture;
   String contactNumber;
   String city;
   String email;
   List<dynamic> followers = [];
   List<dynamic> following = [];
  List<Product> productList = [];
   double rating;
   String area;

  User.fromMap(Map map){
    this.name = map['name'];
    this.city = map['city'];
    this.followers = map['followers'];
    this.following = map['following'];
    this.cnicPicture = map['cnicPicture'];

    this.rating = map['rating'];
    this.area = map['area'];
    this.id = map['id'];
    this.imageUrl = map['imageUrl'];
    this.contactNumber = map['contactNumber'];

    var userProducts = List<Product>();
    if (map['productList'] != null){
    for (var i in map['productList']){
      print(i);
      userProducts.add(Product());
    }
  this.productList = userProducts;

  }
  }
  User(
      {this.area,
      this.id,
      this.name,
      this.imageUrl,
      this.cnicPicture,
      this.contactNumber,
      this.city,
      this.email,
      this.followers,
      this.following,
      this.productList,
      this.rating});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'cnicPicture': cnicPicture,
      'contactNumber': contactNumber,
      'city': city,
      'email': email,
      'followers': followers,
      'following': following,
      'productList': productList,
      'rating': rating,
      'area': area,
    };
  }
}

class Product implements Comparable<Product> {
   String title;
   int price;
   String description;
   int likes;
   String mainImage;
   List<String> galleryImages;
   String serviceType;
   bool homeBased;
   bool online;
   String userId;
   String categoryName;

   Product.fromMap(Map map){
     this.serviceType = map['serviceType'];
     this.title = map['title'];
     this.price = map['price'];
     this.description = map['description'];
     this.likes = map['likes'];
     this.mainImage = map['imageurl'];
     this.homeBased = map['homebased'];
     this.online = map['online'];
     this.userId = map['userid'];
     this.categoryName  = map['categoryName'];

     //this.serviceType = "Online";
this.serviceType = (this.homeBased ? "Home based" : "Online");
//if (this.online){
//  this.serviceType = ( this.serviceType == "" ? "Online" : "${this.serviceType} \n Online");
//}

     if(map['galleryImages'] != null){
       this.galleryImages = List<String>();
       for (var i in map['galleryImages']){
         this.galleryImages.add(i.toString());
       }
     }
     //this.galleryImages = map['galleryImages'];

   }
  Product(
      {this.serviceType,
      this.title,
      this.price,
      this.description,
      this.likes,
      this.mainImage,
        this.galleryImages,
        this.homeBased,
        this.online,
        this.userId,
        this.categoryName});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'price': price,
      'imageurl': mainImage,
      'description': description,
      'likes': likes,
      'galleryImages': galleryImages,
      'homebased': homeBased,
      'online': online,
      'userid': userId,
      'categoryName': categoryName,
      'Featured':false,

    };
  }

  @override
  int compareTo(Product other) {
    // TODO: implement compareTo

    return other.title == this.title ? 1 : 0;
  }


}

class Category {

  String name;

  IconData icon;

  Category(String name) {
    this.name = name;
    if (name == 'Education') {
      this.icon = FontAwesomeIcons.graduationCap;
    } else if (name == 'Baking') {
      this.icon = FontAwesomeIcons.birthdayCake;
    } else if (name == 'Photography') {
      this.icon = FontAwesomeIcons.camera;
    } else if (name == 'Marketing') {
      this.icon = FontAwesomeIcons.chartLine;
    } else if (name == 'Beauty') {
      this.icon = FontAwesomeIcons.spa;
    } else if (name == 'Education') {
      this.icon = FontAwesomeIcons.pen;
    } else if (name == 'Programming') {
      this.icon = FontAwesomeIcons.code;
    }
  }

  String toMap() {
    return this.name;
  }
}

//ALL APP DATA GOES HERE.
List<Category> categories = [
  Category('Education'),
  Category('Baking'),
  Category('Photography'),
  Category('Marketing'),
  Category('Beauty'),
  Category('Education'),
  Category('Programming'),
];
