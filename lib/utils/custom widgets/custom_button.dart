import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Widget navigateTo; // 👈 New parameter

  const CustomButton({
    Key? key,
    required this.title,
    required this.color,

    required this.navigateTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.whiteColor,
            side: BorderSide(color: Color(0xff006400), width: 2),
          ),
          onPressed: () {
            Get.to(navigateTo); // 👈 Navigate to the passed screen
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
               "assets/images/leaf_ic.png",
                height: 30,
                width: 30,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style:  TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
