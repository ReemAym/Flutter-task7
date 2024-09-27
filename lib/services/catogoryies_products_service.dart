import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../helpers/api.dart';

class CategoriesProductsService {
  Future<List<ProductModel>> getCategoriesProducts(String category) async {
    
   List<dynamic> data= await Api().get(url:'https://fakestoreapi.com/products/category/$category');

      List<ProductModel> productList = [];
      for (int i = 0; i < data.length; i++) {
        productList.add(ProductModel.fromjson(data[i]));
      }

      return productList;
 
  }
}
