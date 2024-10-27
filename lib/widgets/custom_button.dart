import 'package:flutter/material.dart';

class GreenButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double? width;
  final double? height;

  const GreenButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.green, // Default color is green
    this.textStyle = const TextStyle(
        color: Colors.white, fontSize: 20), // Default text style
    this.width, // Optional width parameter
    this.height, // Optional height parameter
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
        minimumSize: Size(
          width ?? 200, // Default width if not provided
          height ?? 50, // Default height if not provided
        ),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
