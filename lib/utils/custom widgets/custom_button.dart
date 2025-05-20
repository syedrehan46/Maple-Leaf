import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final bool isShowContainer;
  // final bool isShowImage;
  final Widget? navigateTo;
  final Color background_color;
  const CustomButton({
    Key? key,
    required this.title,
    required this.color,
    // this.isShowImage=false,
    this.background_color = AppColors.whiteColor,
    this.isShowContainer = false,
     this.navigateTo,
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
            backgroundColor: background_color, // Use this if needed
            side: const BorderSide(color: Color(0xff006400), width: 1),
          ),
          onPressed: () {
            Get.to(navigateTo);
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
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (isShowContainer) ...[
                const SizedBox(width: 10),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.redColor,
                  ),
                  child: const Center(
                    child: Text(
                      "0",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
