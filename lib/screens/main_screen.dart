import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkle_and_sprout/controllers/bottom_navi_controller.dart';
import 'package:sprinkle_and_sprout/pages/footprint_page.dart';
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
            FootPrint(),
            Center(child: Text('Profile Page')),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          return Theme(
            data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: Colors.green,
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                // primaryColor: Colors.red,
                textTheme: Theme.of(context)
                    .textTheme
                    // .copyWith(bodySmall: const TextStyle(color: Colors.yellow))
                    ), 
            child: BottomNavigationBar(
              unselectedItemColor: Colors.black,
              // backgroundColor: Colors.green,
              currentIndex: selectedIndex.index.value,
              onTap: (index) => selectedIndex.change(index),
              items:  [
                _buildBottomNavItem(Icons.home, 'Home'),
                _buildBottomNavItem(Icons.water_drop_outlined, 'Aqua'),
                _buildBottomNavItem(Icons.co2, 'FootPrint'),
                _buildBottomNavItem(Icons.chat_bubble, 'AI'),
              ],
              type: BottomNavigationBarType.shifting, // This line makes the bottom navigation bar floating
            
              
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

