import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:todoapp/models/product/product.dart';

class ProductApi {
  static Future<List<Product>> getAllProducts() async {
    String path = 'assets/products.json';

    try {
      final data = await rootBundle.loadString(path);
      final Map<String, dynamic> jsonData = json.decode(data);
      final List<dynamic> productsJsonList = jsonData['products'];
      final List<Product> products = productsJsonList
          .map((productJson) => Product.fromJson(productJson))
          .toList();

      return products;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
