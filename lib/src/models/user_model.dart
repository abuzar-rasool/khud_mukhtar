import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  List<Product> productList = [];
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
  final bool homeBased;
  final bool online;
  final String userId;
  final String categoryName;

  Product(
      {this.serviceType,
      this.title,
      this.price,
      this.description,
      this.category,
      this.likes,
      this.user,
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
      'category': category,
      'likes': likes,
      'user': user,
      'galleryImages': galleryImages,
      'homebased': homeBased,
      'online': online,
      'userid': userId,
      'categoryName': categoryName,

    };
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
List<String> galleryImages = [
  'assets/quranforkidssample.jpg',
  'assets/quranforkidssample.jpg',
  'assets/quranforkidssample.jpg',
  'assets/quranforkidssample.jpg',
];
