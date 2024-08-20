import "package:flutter/material.dart";

class Titles extends StatelessWidget {
  final String title;
  const Titles({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 40),
    );
  }
}