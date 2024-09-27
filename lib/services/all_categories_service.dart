import 'package:http/http.dart' as http;
import 'dart:convert';

import '../helpers/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    
   List<dynamic> data= await Api().get(url:'https://fakestoreapi.com/products/categories');

      return data;
   
  }
}
