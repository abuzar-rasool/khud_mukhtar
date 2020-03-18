import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:khud_mukhtar/src/screens/home_screen.dart';

List<Product> allProducts = [
  Product(
      title: 'Quran Classes',
      price: 2000,
      description: "Hello World",
      likes: 4,
      mainImage: 'assets/quranforkidssample.jpg',
      galleryImages: galleryImages,
      serviceType: 'Home Based',
      user: user1,
      category: categories[0]),
  Product(
      title: 'O Level Tutions',
      price: 10000,
      description: "Hello World",
      likes: 4,
      mainImage: 'assets/teaching.jpeg',
      galleryImages: galleryImages,
      serviceType: 'Home Based',
      user: user1,
      category: categories[0]),
  Product(
      title: 'Baking Classes',
      price: 5000,
      description: "Hello World",
      likes: 4,
      mainImage: 'assets/baking.jpeg',
      galleryImages: galleryImages,
      serviceType: 'Home Based',
      user: user1,
      category: categories[0]),
  Product(
      title: 'Wedding Photos',
      price: 5000,
      description: "Hello World",
      likes: 4,
      mainImage: 'assets/wedding.jpeg',
      galleryImages: galleryImages,
      serviceType: 'Home Based',
      user: user1,
      category: categories[0]),
  Product(
      title: 'Marketing for business',
      price: 5000,
      description: "Hello World",
      likes: 4,
      mainImage: 'assets/marketing.jpeg',
      galleryImages: galleryImages,
      serviceType: 'Online',
      user: user1,
      category: categories[0]),
];
User user1 = User(
  id: '0',
  name: 'Momina Qureshi',
  imageUrl: 'assets/momina.jpg',
  cnicPicture: '',
  contactNumber: '0335-2366331',
  city: 'Karachi',
  followers: 100,
  following: 200,
  rating: 2.5,
  area: 'Defence',
);
User loggedInUser = User(
  id: '0',
  name: 'Fatima Moin',
  imageUrl: 'assets/fatima.jpeg',
  cnicPicture: '',
  contactNumber: '0335-2366331',
  city: 'Karachi',
  followers: 100,
  following: 200,
  rating: 2.5,
  area: 'Defence',
);

class User {
  final String id;
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
  final String area;

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

class Product {
  final String title;
  final int price;
  final String description;
  final Category category;
  final int likes;
  final User user;
  final String mainImage;
  final List<String> galleryImages;
  final serviceType;

  Product(
      {this.serviceType,
      this.title,
      this.price,
      this.description,
      this.category,
      this.likes,
      this.user,
      this.mainImage,
      this.galleryImages});
}

class Category {
  final String name;

  final IconData icon;

  Category({this.name, this.icon});
}

//ALL APP DATA GOES HERE.
List<Category> categories = [
  Category(name: 'Education', icon: FontAwesomeIcons.graduationCap),
  Category(name: 'Baking', icon: FontAwesomeIcons.birthdayCake),
  Category(name: 'Photography', icon: FontAwesomeIcons.camera),
  Category(name: 'Marketing', icon: FontAwesomeIcons.chartLine),
  Category(name: 'Beauty', icon: FontAwesomeIcons.spa),
  Category(name: 'Education', icon: FontAwesomeIcons.pen),
  Category(name: 'Programming', icon: FontAwesomeIcons.code),
];
List<String> galleryImages = [
  'assets/quranforkidssample.jpg',
  'assets/quranforkidssample.jpg',
  'assets/quranforkidssample.jpg',
  'assets/quranforkidssample.jpg',
];
