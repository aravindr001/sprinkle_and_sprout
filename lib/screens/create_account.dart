import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkle_and_sprout/screens/main_screen.dart';
import 'package:sprinkle_and_sprout/screens/sign_in.dart';
import 'package:sprinkle_and_sprout/widgets/bottom_statement.dart';
import 'package:sprinkle_and_sprout/widgets/custom_button.dart';
import 'package:sprinkle_and_sprout/widgets/inputfeild.dart';
import 'package:sprinkle_and_sprout/widgets/logo_hero.dart';
import 'package:sprinkle_and_sprout/widgets/titles.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({super.key});

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String? _errorMessage;

  Future<void> _signUp() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Create a new user
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // On success, navigate to HomePage
        Get.off(() => HomePage());
      } on FirebaseAuthException catch (e) {
        setState(() {
          _errorMessage = e.message;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                          controller: _nameController,
                          validator: (value) =>
                              value!.isEmpty ? "Enter your name" : null,
                        ),
                        const SizedBox(height: 20),
                        InputField(
                          placeholder: "Email address",
                          controller: _emailController,
                          validator: (value) =>
                              value!.isEmpty ? "Enter a valid email" : null,
                        ),
                        const SizedBox(height: 20),
                        InputField(
                          placeholder: "Password",
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) =>
                              value!.length < 6 ? "Password too short" : null,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    GreenButton(
                      text: "Sign Up",
                      onPressed: _signUp,
                    ),
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
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
      ),
    );
  }
}
