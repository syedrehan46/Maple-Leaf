import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';

class CustomButton1 extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;
  final Color backgroundColor;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomButton1({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isEnabled = true,
    this.backgroundColor = AppColors.redColor,
    this.width = 0.9, // 90% of parent width by default
    this.height = 50,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return SizedBox(
      width: media.width * width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor.withOpacity(0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          text.toUpperCase(), // Convert text to uppercase
          style: TextStyle(
            color: AppColors.whiteColor,
            fontWeight: fontWeight,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}