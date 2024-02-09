import 'dart:convert';

import 'package:to_let_mobile_app/utils/images.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:to_let_mobile_app/models/home/model/product_model.dart';

class ProductLoaded{
  Future<List<ProductModel>> loadProducts() async {
    final jsonString = await rootBundle.loadString(Images.products_model);
    final jsonData = json.decode(jsonString);
    final products =
    (jsonData as List).map((item) => ProductModel.fromJson(item)).toList();
    return products;
  }
}