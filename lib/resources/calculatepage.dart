import 'package:flutter/material.dart';

class CalculatePage extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  const CalculatePage({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 400,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        autocorrect: false,
        enableSuggestions: false,
        style: const TextStyle(
          color: Colors.grey,
        ),
        decoration: InputDecoration(
          hintText: text,
          filled: true,
          fillColor: const Color.fromRGBO(18, 14, 14, 0.69),
          border: InputBorder.none,
          hintStyle: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
