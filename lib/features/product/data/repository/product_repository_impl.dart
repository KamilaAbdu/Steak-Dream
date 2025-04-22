import 'dart:convert';
import 'package:flutter/services.dart';
//import 'package:logger/logger.dart';
import 'package:steak_dream/features/product/data/model/product_model.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<ProductEntity>> getProducts() async {
   
   final String jsonStr = await rootBundle.loadString('lib/core/assets/mock/product.json');

    //var logger = Logger();
    //logger.d("Loaded JSON: $jsonStr");
    final List<dynamic> jsonList = jsonDecode(jsonStr);
    return jsonList.map((e) => ProductModel.fromJson(e)).toList();
  }
}
