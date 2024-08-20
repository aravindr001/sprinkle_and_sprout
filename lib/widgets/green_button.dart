import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final TextStyle textStyle;
  final Size size;

  const GreenButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.green, // Default color is green
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 20), // Default text style
    this.size = const Size(200, 50), // Default size
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: size,
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}