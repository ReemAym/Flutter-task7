import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products', token: '');
    // print(data);
    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      // print('******************************');
      // print(data[i]);
      productsList.add(
        ProductModel.fromjson(data[i]),
      );
    }
    return productsList;
  }
}
