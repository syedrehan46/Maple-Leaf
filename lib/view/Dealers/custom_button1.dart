import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final Color bc_color;
  final String title;
  final Widget? ToNavigate;

  const CustomButton({
    required this.bc_color,
    required this.title,
    required this.ToNavigate,
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
          onPressed: () {
            if (ToNavigate != null) {
              Get.to(() => ToNavigate!);
            }
          },
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
