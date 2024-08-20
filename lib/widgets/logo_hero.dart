import "package:flutter/material.dart";

class LogoHero extends StatelessWidget {
  const LogoHero({super.key});

  @override
  Widget build(BuildContext context) {
    return  Hero(
      tag: "logo",
      child: Image.asset('assets/images/logo.png'),
    );
  }
}

