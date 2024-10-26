import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sprinkle_and_sprout/screens/main_screen.dart';
import 'package:sprinkle_and_sprout/screens/sign_in.dart';
import 'package:sprinkle_and_sprout/widgets/bottom_statement.dart';
import 'package:sprinkle_and_sprout/widgets/custom_button.dart';
import 'package:sprinkle_and_sprout/widgets/inputfeild.dart';
import 'package:sprinkle_and_sprout/widgets/logo_hero.dart';
import 'package:sprinkle_and_sprout/widgets/titles.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String? _email, _password, _errorMessage;

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _email!,
          password: _password!,
        );
        // Navigate to the next screen or show a success message
        print('User signed up: ${userCredential.user?.email}');
      } on FirebaseAuthException catch (e) {
        // setState(() {
        _errorMessage = e.message;
        // });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const LogoHero(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Titles(title: "Create Account"),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      InputField(
                        placeholder: "Name",
                        controller: nameController,
                      ),
                      const SizedBox(height: 20),
                      InputField(
                        placeholder: "Email address",
                        controller: emailController,
                      ),
                      const SizedBox(height: 20),
                      InputField(
                        placeholder: "Password",
                        controller: passwordController,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  GreenButton(
                    text: "Sign In Now",
                    onPressed: () => Get.off(() => const HomePage()),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: _signUp,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/google_logo.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            BottomStatement(
              text: "Already have an Account?",
              buttonText: "Sign in",
              onPressed: () => Get.to(() => SignInScreen()),
            ),
          ],
        ),
      ),
    );
  }

}
