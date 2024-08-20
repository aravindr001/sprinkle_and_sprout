import "package:flutter/material.dart";


class InputField extends StatelessWidget {
  final String placeholder;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const InputField({
    Key? key,
    required this.placeholder,
    this.controller,
    this.keyboardType = TextInputType.text,
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
      child: TextField(
        
        controller: controller,
        keyboardType: keyboardType,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          
          hintText: placeholder,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
        ),
      ),
    );
  }
}