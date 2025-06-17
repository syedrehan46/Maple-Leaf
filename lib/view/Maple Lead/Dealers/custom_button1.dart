import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

class CustomButtons extends StatelessWidget {
  final Color bc_color;
  final String title;
  final double circular;
  final VoidCallback? onPressed;
  final double padding; // ✅ Changed from Float to double

  const CustomButtons({
    this.bc_color = Colors.red,
    required this.title,
    this.onPressed,
    this.padding=24,
    this.circular=12,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ), // ✅ Works with double
      child: SizedBox(
        height: media.height * 0.07,
        width: media.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bc_color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(circular)),
          ),
          onPressed: onPressed,
          child: Text(title, style: AppFonts.styleHarmoniaBold18W600()),
        ),
      ),
    );
  }
}
