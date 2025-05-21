import 'package:flutter/material.dart';

class CustomTextFieldS extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLength;
  final bool centerLabel;

  const CustomTextFieldS({
    Key? key,
    required this.title,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = true,
    this.maxLength = 11,
    this.centerLabel = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isNumber = keyboardType == TextInputType.number || keyboardType == TextInputType.phone;

    Widget textField = TextField(
      controller: controller,
      readOnly: false,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
        label: Align(
          alignment: centerLabel ? Alignment.center : Alignment.centerLeft,
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
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
          readOnly ? IgnorePointer(child: textField) : textField,
          if (!readOnly && isNumber)
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0, right: 4.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${value.text.length}/${maxLength}",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
