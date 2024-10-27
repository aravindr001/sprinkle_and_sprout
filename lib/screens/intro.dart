import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkle_and_sprout/screens/main_screen.dart';
import 'package:sprinkle_and_sprout/widgets/custom_button.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text("Welcome to Eco Meter",style: TextStyle(fontSize: 30),),
            Image.asset("assets/images/intopic.png",width: 300,),
            const Text("Challenge yourself to be sustainable"),
            GreenButton(text: "Continue", onPressed: (){
              Get.off(()=> HomePage());
            })
          ],
        ),
      ),
    );
  }
}