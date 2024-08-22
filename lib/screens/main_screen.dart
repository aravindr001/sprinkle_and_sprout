import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkle_and_sprout/controllers/bottom_navi_controller.dart';
import 'package:sprinkle_and_sprout/pages/home_page.dart';
import 'package:sprinkle_and_sprout/pages/water_page.dart';

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
            HomeScreen(),
            WaterScreen(),
            Center(child: Text('Favorites Page')),
            Center(child: Text('Profile Page')),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBarTheme(
            data: const BottomNavigationBarThemeData(
              backgroundColor: Colors.black,
              selectedItemColor:Colors.green,
              unselectedItemColor: Colors.black 
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.green,
              currentIndex: selectedIndex.index.value,
              onTap: (index) => selectedIndex.change(index),
              items:  [
                _buildBottomNavItem(Icons.home, 'Home'),
                _buildBottomNavItem(Icons.water_drop_outlined, 'Aqua'),
                _buildBottomNavItem(Icons.co2, 'FootPrint'),
                _buildBottomNavItem(Icons.chat_bubble, 'AI'),
              ],
            
              
            ),
          );
        },

      ),

     
    );
  }

  BottomNavigationBarItem _buildBottomNavItem(IconData icon, String label) {

    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}

