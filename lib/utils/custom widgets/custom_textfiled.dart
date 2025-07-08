import 'package:flutter/material.dart';

class CustomNumberInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool readonly;
  final TextInputType keyboardType; // <-- New optional parameter

  const CustomNumberInputField({
    Key? key,
    required this.controller,
    this.readonly = false,
    this.hintText = 'Enter number',
    this.keyboardType = TextInputType.number, // <-- Default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readonly,
      keyboardType: keyboardType, // <-- Use it here
      cursorColor: Colors.red,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        isDense: true,
      ),
      style: const TextStyle(fontSize: 16),
    );
  }
}
