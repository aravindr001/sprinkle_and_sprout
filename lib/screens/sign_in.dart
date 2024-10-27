import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sprinkle_and_sprout/screens/create_account.dart';
import 'package:sprinkle_and_sprout/screens/main_screen.dart';
import 'package:sprinkle_and_sprout/screens/adduser_details.dart'; // Import AddUserDetailsScreen
import 'package:sprinkle_and_sprout/widgets/bottom_statement.dart';
import 'package:sprinkle_and_sprout/widgets/custom_button.dart';
import 'package:sprinkle_and_sprout/widgets/inputfeild.dart';
import 'package:sprinkle_and_sprout/widgets/logo_hero.dart';
import 'package:sprinkle_and_sprout/widgets/titles.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();

  // Controllers for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Sign in with email and password
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );

        // Check if the user has the necessary details in Firestore
        await _checkUserDetails(userCredential.user?.uid);
      } on FirebaseAuthException catch (e) {
        _errorMessage = e.message;
        print(_errorMessage);
        // Display the error message to the user
        Get.snackbar('Error', _errorMessage ?? 'Sign in failed');
      }
    }
  }

  Future<void> _checkUserDetails(String? uid) async {
    if (uid == null) return;

    // Fetch user document from Firestore
    DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(uid).get();

    // Check if necessary fields are missing
    if (!userDoc.exists ||
        (userDoc.data() as Map<String, dynamic>)['name'] == null ||
        (userDoc.data() as Map<String, dynamic>)['address'] == null ||
        (userDoc.data() as Map<String, dynamic>)['householdCount'] == null) {
      // Redirect to AddUserDetailsScreen if any detail is missing
      Get.off(() => AddUserDetailsScreen(uid: uid));
    } else {
      // Redirect to HomePage if user details are complete
      Get.off(() => HomePage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const LogoHero(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Titles(title: ("Sign In")),
                    const SizedBox(height: 20),
                    InputField(
                      placeholder: "Email address",
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    InputField(
                      placeholder: "Password",
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    GreenButton(
                      text: "Sign In Now",
                      onPressed:
                          _signIn, // Call the _signIn function on button press
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            BottomStatement(
              text: "Don't you have an Account?",
              buttonText: "Create one",
              onPressed: () => Get.to(() => CreateAccount()),
            ),
          ],
        ),
      ),
    );
  }
}
