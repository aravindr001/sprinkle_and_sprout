import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sprinkle_and_sprout/screens/create_account.dart';
import 'package:sprinkle_and_sprout/screens/main_screen.dart';
import 'package:sprinkle_and_sprout/widgets/bottom_statement.dart';
import 'package:sprinkle_and_sprout/widgets/green_button.dart';
import 'package:sprinkle_and_sprout/widgets/inputfeild.dart';
import 'package:sprinkle_and_sprout/widgets/logo_hero.dart';
import 'package:sprinkle_and_sprout/widgets/titles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          }
          // );
        // }
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const LogoHero(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Titles(title: ("Sign In")),
                  const SizedBox(
                    height: 20,
                  ),
                  const InputField(
                    placeholder: "Email address",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const InputField(placeholder: "Password"),
                  const SizedBox(
                    height: 30,
                  ),
                  GreenButton(
                      text: "Sign In Now",
                      onPressed: () => Get.off(() => HomePage()))
                ],
              ),
            ),
            const SizedBox(
              height:90,
            ),
            
            // const SizedBox(height: 20),
            BottomStatement(
                text: "Don't you have an Account?",
                buttonText: "Create one",
                onPressed: () => Get.to(() =>  CreateAccount()))
          ],
        ),
      ),
    );
  }
}
