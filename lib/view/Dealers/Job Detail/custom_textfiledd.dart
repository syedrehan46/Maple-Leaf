import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLength;

  const CustomTextField({
    Key? key,
    required this.title,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = true,
    this.maxLength=11,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isNumber = keyboardType == TextInputType.number || keyboardType == TextInputType.phone;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title above the field


          const SizedBox(height: 4),

          // TextField
          TextField(
            controller: controller,
            readOnly: readOnly,
            keyboardType: keyboardType,
            maxLength: maxLength != null ? maxLength : (isNumber ? 11 : null),
            decoration: InputDecoration(
              labelText: title,
              labelStyle: TextStyle(fontSize: 16,color: Colors.black),
              // ✅ Added this line
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              counterText: '',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).primaryColor),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
