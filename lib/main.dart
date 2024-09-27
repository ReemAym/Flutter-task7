import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/screens/favourite_products_screen.dart';
import 'package:store_app/screens/home_screen.dart';
import 'package:store_app/screens/update_product_screen.dart';

import 'screens/category_product_screen.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        UpdateProductScreen.id: (context) => UpdateProductScreen(),
        CategoryProductScreen.id: (context) => const CategoryProductScreen(),
        FavouriteProductsScreen.id: (context) => FavouriteProductsScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
