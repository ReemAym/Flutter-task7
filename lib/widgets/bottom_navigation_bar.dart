import 'package:flutter/material.dart';
import 'package:store_app/screens/category_product_screen.dart';
import 'package:store_app/screens/home_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: 'Categories',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.greenAccent, // Color for the selected item
      unselectedItemColor: Colors.grey, // Color for the unselected items
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        onTap(index);
        navigateTo(context, index);
      },
    );
  }

  void navigateTo(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => HomeScreen(),
            transitionDuration: Duration.zero,
          ),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                CategoryProductScreen(),
            transitionDuration: Duration.zero,
          ),
        );
        break;
    }
  }
}
