import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkle_and_sprout/controllers/auth_controller.dart'; // Import the AuthController
import 'package:sprinkle_and_sprout/screens/intro.dart';


class AddUserDetailsScreen extends StatelessWidget {
  final String uid;
  final AuthController authController = Get.find(); // Access the AuthController

  AddUserDetailsScreen({required this.uid});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController householdController = TextEditingController();

  Future<void> saveUserData() async {
    // Call the updateUserDetails method from AuthController
    await authController.updateUserDetails(
      nameController.text,
      addressController.text,
      int.parse(householdController.text),
    );

    // Navigate to IntroductionScreen after saving user details
    Get.off(() => IntroductionScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complete Your Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: addressController,
              decoration: const InputDecoration(labelText: "Address"),
            ),
            TextField(
              controller: householdController,
              decoration: const InputDecoration(labelText: "Household Count"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveUserData,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
