import 'package:flutter/material.dart';
import 'package:store_app/widgets/cart_card.dart';

import '../models/product_model.dart';
import '../widgets/custom_card.dart';

class FavouriteProductsScreen extends StatelessWidget {
  const FavouriteProductsScreen({super.key});

  static String id = 'favourite products screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 70,
          ),
          child: Builder(
            builder: (context) {
              return GridView.builder(
                itemCount: favouriteProductList.length,
                clipBehavior: Clip.none,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 90,
                ),
                itemBuilder: (context, index) {
                  return CartCard(
                    product: favouriteProductList[index],
                  );
                },
              );
            },
          )),
    );
  }
}
