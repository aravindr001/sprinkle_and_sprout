import 'package:flutter/material.dart';

class BottomStatement extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  const BottomStatement({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.brown),
          ),
        ),
      ],
    );
  }
}
