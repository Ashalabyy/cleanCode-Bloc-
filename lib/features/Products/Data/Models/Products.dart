import 'package:flutter/material.dart';

class Products {
  List<dynamic> products;

  Products({required this.products});

  factory Products.fromJson(Map<String, dynamic> jsonBrands) => Products(
        products: jsonBrands['products'],
      );
}
