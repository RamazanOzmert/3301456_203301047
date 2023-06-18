import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Product> fetchAlbum() async {
  final response = await http.get(
    Uri.parse('https://fakestoreapi.com/products/1'),
  );

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    return Product.fromJson(jsonDecode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post!');
  }
}

//CREATE AN ALBUM CLASS
class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }
}
