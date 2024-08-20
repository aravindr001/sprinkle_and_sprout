import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sprinkle_and_sprout/screens/create_account.dart';
import 'package:sprinkle_and_sprout/screens/home.dart';
import 'package:sprinkle_and_sprout/widgets/bottom_statement.dart';
import 'package:sprinkle_and_sprout/widgets/green_button.dart';
import 'package:sprinkle_and_sprout/widgets/inputfeild.dart';
import 'package:sprinkle_and_sprout/widgets/logo_hero.dart';
import 'package:sprinkle_and_sprout/widgets/titles.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            const LogoHero(),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Titles(title: ("Sign In Now")),
                  const SizedBox(height: 20,),
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
                  GreenButton(text: "Sign In Now", onPressed: () => Get.to(()=>  HomePage()))
                ],
              ),
            ),
            const SizedBox(height: 80,),
          BottomStatement(text: "Don't you have an Account?", buttonText:"Create one", onPressed: ()=>Get.to(()=>const CreateAccount()))   
          ],
        ),
      ),
    );
  }
}
