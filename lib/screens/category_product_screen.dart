import 'package:flutter/material.dart';
import 'package:store_app/widgets/drop_down_menu.dart';

import '../models/product_model.dart';
import '../services/catogoryies_products_service.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/custom_card.dart';

class CategoryProductScreen extends StatefulWidget {
  const CategoryProductScreen({super.key});

  static String id = 'category product screen';

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  int _currentIndex = 1;
  String _selectedCategory = 'electronics'; // Initialize with default value

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onCategoryChanged(String newCategory) {
    setState(() {
      _selectedCategory = newCategory; // Update selected category
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Category Products',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            DropdownField(
              icon: Icons.production_quantity_limits,
              label: 'category',
              initialValue: _selectedCategory,
              onChanged:
                  _onCategoryChanged, // Pass the callback for value changes
            ),
            const SizedBox(
              height: 70,
            ),
            Expanded(
              child: FutureBuilder<List<ProductModel>>(
                future: CategoriesProductsService().getCategoriesProducts(
                    _selectedCategory), // Pass the selected category
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
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
