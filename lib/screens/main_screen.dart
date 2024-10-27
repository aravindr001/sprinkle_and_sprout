import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkle_and_sprout/controllers/bottom_navi_controller.dart';
import 'package:sprinkle_and_sprout/navigator/chat.dart';
import 'package:sprinkle_and_sprout/pages/addDetails.dart';
import 'package:sprinkle_and_sprout/pages/home_page.dart';
import 'package:sprinkle_and_sprout/pages/leaderBoard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    IndexController selectedIndex = Get.put(IndexController());

    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: selectedIndex.index.toInt(),
          children:  [
            HomeScreen(),
            Leaderboard(),
            AddDetails(),
            ChatBot()
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
                _buildBottomNavItem(Icons.list, 'Leader Board'),
                _buildBottomNavItem(Icons.add, 'Add'),
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

