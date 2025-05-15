import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

class CustomButtons extends StatelessWidget {
  final Color bc_color;
  final String title;
  final VoidCallback? onPressed;

  const CustomButtons({
    this.bc_color = const Color(0xFFB31D1E), // ✅ Proper default value
    required this.title,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: bc_color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            title,
            style: AppFonts.styleHarmoniaBold16W600(Colors.white),
          ),
        ),
      ),
    );
  }
}
