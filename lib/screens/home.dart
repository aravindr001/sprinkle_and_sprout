import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkle_and_sprout/controllers/bottom_navi_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    IndexController selectedIndex = Get.put(IndexController());

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: selectedIndex.index.toInt(),
          children: const [
            Center(child: Text('Home Page')),
            Center(child: Text('Search Page')),
            Center(child: Text('Favorites Page')),
            Center(child: Text('Profile Page')),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black54,
            currentIndex: selectedIndex.index.value,
            onTap: (index) => selectedIndex.change(index),
            items:  [
              _buildBottomNavItem(Icons.home, 'Home'),
              _buildBottomNavItem(Icons.search, 'Search'),
              _buildBottomNavItem(Icons.favorite, 'Favorites'),
              _buildBottomNavItem(Icons.person, 'Profile'),
            ],
          );
        },
      ),
    );
  }

// Function to build BottomNavigationBarItem to reduce repetition
  BottomNavigationBarItem _buildBottomNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}

