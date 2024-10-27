import "package:flutter/material.dart";
class InputField extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool obscureText; // Add obscureText as a parameter

  const InputField({
    Key? key,
    required this.placeholder,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.obscureText = false, // Default to false for non-password fields
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        validator: validator,
        obscureText: obscureText, // Apply obscureText here
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
