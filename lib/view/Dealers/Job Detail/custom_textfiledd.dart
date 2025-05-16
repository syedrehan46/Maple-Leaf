import 'package:flutter/material.dart';

class CustomTextFieldS extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLength;

  const CustomTextFieldS({
    Key? key,
    required this.title,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = true,
    this.maxLength = 11,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isNumber = keyboardType == TextInputType.number || keyboardType == TextInputType.phone;

    Widget textField = TextField(
      controller: controller,
      readOnly: false, // Always false because we will control interaction via IgnorePointer
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: const TextStyle(fontSize: 16, color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        counterText: '',
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      style: const TextStyle(fontSize: 16),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          // Wrap with IgnorePointer only when readOnly is true
          readOnly ? IgnorePointer(child: textField) : textField,
        ],
      ),
    );
  }
}
