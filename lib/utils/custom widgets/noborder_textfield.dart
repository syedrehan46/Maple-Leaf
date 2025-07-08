import 'package:flutter/material.dart';

class NoBorderTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const NoBorderTextField({
    Key? key,
    required this.controller,
    this.hintText = "Type something cool...", // default random hint
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none, // no border
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      style: TextStyle(fontSize: 16),
    );
  }
}
