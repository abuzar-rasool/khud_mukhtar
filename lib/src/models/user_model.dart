import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

User user1= User(
  id: 0,
  name: 'Fatima Moin',
  imageUrl: 'assets/momina.jpg',
  cnicPicture: '',
  contactNumber: '0335-2366331'  ,
  city: 'Karachi',
  followers: 100,
  following: 200,
  productList: allproducts,
  rating: 2.5,

);

class User {
  final int id;
  final String name;
  final String imageUrl;
  final String cnicPicture;
  final String contactNumber;
  final String city;
  final String email;
  final int followers;
  final int following;
  final List<Product> productList;
  final double rating;
  User({this.id,this.name, this.imageUrl, this.cnicPicture, this.contactNumber, this.city, this.email, this.followers, this.following, this.productList, this.rating});

}

class Product{
  final String title;
  final int price;
  final String description;
  final Category category;
  final int likes;
  final user;
  final String mainImage;
  final List<String> galleryImages;


  Product({this.title, this.price, this.description, this.category, this.likes, this.user, this.mainImage, this.galleryImages});

}

class Category{
  final String name;
  final Icon icon;

  Category({this.name, this.icon});

}



//ALL APP DATA GOES HERE.
List<Category> categories=[
  Category(name: 'Education',icon: Icon(FontAwesomeIcons.pen)),
  Category(name: 'Education',icon: Icon(FontAwesomeIcons.pen)),
  Category(name: 'Education',icon: Icon(FontAwesomeIcons.pen)),
  Category(name: 'Education',icon: Icon(FontAwesomeIcons.pen)),
  Category(name: 'Education',icon: Icon(FontAwesomeIcons.pen)),
  Category(name: 'Education',icon: Icon(FontAwesomeIcons.pen)),
  Category(name: 'Education',icon: Icon(FontAwesomeIcons.pen)),

];
List<String> galleryImages = [
  'assets/quranforkidssample.jpg',
  'assets/quranforkidssample.jpg',
  'assets/quranforkidssample.jpg',
  'assets/quranforkidssample.jpg',
];
List<Product> allproducts= [
  Product(title: 'Quran Classes',price: 5000,description: "Hello World",likes: 4,user: user1,mainImage: 'assets/quranforkidssample.jpg',galleryImages: galleryImages),
  Product(title: 'Quran Classes',price: 5000,description: "Hello World",likes: 4,user: user1,mainImage: 'assets/quranforkidssample.jpg',galleryImages: galleryImages),
  Product(title: 'Quran Classes',price: 5000,description: "Hello World",likes: 4,user: user1,mainImage: 'assets/quranforkidssample.jpg',galleryImages: galleryImages),
  Product(title: 'Quran Classes',price: 5000,description: "Hello World",likes: 4,user: user1,mainImage: 'assets/quranforkidssample.jpg',galleryImages: galleryImages),
  Product(title: 'Quran Classes',price: 5000,description: "Hello World",likes: 4,user: user1,mainImage: 'assets/quranforkidssample.jpg',galleryImages: galleryImages),
  Product(title: 'Quran Classes',price: 5000,description: "Hello World",likes: 4,user: user1,mainImage: 'assets/quranforkidssample.jpg',galleryImages: galleryImages),
];