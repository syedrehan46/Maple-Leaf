import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

class CustomTextFieldS extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLength;
  final bool centerLabel;
  final bool isAddborder;

  const CustomTextFieldS({
    Key? key,
    required this.title,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.readOnly = true,
    this.maxLength = 11,
    this.centerLabel = false,
    this.isAddborder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isNumber = keyboardType == TextInputType.number || keyboardType == TextInputType.phone;

    final borderStyle = isAddborder
        ? OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: Colors.grey, width: 1),
    )
        : const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    );

    final focusedBorderStyle = isAddborder
        ? OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
    )
        : UnderlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor),
    );

    Widget textField = TextField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      maxLength: maxLength,
      textAlign: centerLabel ? TextAlign.center : TextAlign.start,
      decoration: InputDecoration(
        labelText: title,
        labelStyle: AppFonts.styleHarmoniaBold14W600(AppColors.grey8E8E8EColor)
            .copyWith(fontWeight: FontWeight.w300),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        counterText: '',
        alignLabelWithHint: true,
        enabledBorder: borderStyle,
        focusedBorder: focusedBorderStyle,
      ),
      style: const TextStyle(fontSize: 16),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          textField,
          if (!readOnly && isNumber)
            ValueListenableBuilder<TextEditingValue>(
              valueListenable: controller,
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.only(top: 4.0, right: 4.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${value.text.length}/$maxLength",
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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
