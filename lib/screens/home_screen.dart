import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/favourite_products_screen.dart';
import 'package:store_app/services/get_all_product_service.dart';

import '../widgets/bottom_navigation_bar.dart';
import '../widgets/custom_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String id = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart_sharp,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, FavouriteProductsScreen.id);
              }),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 70,
          ),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No products available'));
              } else {
                List<ProductModel> productsList = snapshot.data!;
                return GridView.builder(
                  itemCount: productsList.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 90,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      product: productsList[index],
                    ); // Assuming CustomCard() displays the product
                  },
                );
              }
            },
          )),
  
  bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        
      ),
  
    );
  }
}
