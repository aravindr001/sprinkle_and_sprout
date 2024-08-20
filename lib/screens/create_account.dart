import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sprinkle_and_sprout/screens/home.dart';
import 'package:sprinkle_and_sprout/screens/sign_in.dart';
import 'package:sprinkle_and_sprout/widgets/bottom_statement.dart';
import 'package:sprinkle_and_sprout/widgets/green_button.dart';
import 'package:sprinkle_and_sprout/widgets/inputfeild.dart';
import 'package:sprinkle_and_sprout/widgets/logo_hero.dart';
import 'package:sprinkle_and_sprout/widgets/titles.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

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
              child: Column(
                children: [
                  const Titles(title: "Create Account"),
                  const SizedBox(height: 20),
                  _buildInputFields(),
                  const SizedBox(height: 30),
                  GreenButton(
                    text: "Sign In Now",
                    onPressed: () => Get.to(() => const HomePage()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            BottomStatement(
              text: "Already have an Account?",
              buttonText: "Sign in",
              onPressed: () => Get.to(() => const SignInScreen()),
            ),
          ],
        ),
      ),
    );
  }



  // Input fields widget extraction
  Widget _buildInputFields() {
    return Column(
      children: const [
        InputField(placeholder: "Name"),
        SizedBox(height: 20),
        InputField(placeholder: "Email address"),
        SizedBox(height: 20),
        InputField(placeholder: "Password"),
      ],
    );
  }
}
