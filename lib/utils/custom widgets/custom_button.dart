import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final bool isShowContainer;
  final Widget? navigateTo;
  final Color background_color;
  final RxInt? count;

  const CustomButton({
    Key? key,
    required this.title,
    required this.color,
    this.background_color = AppColors.whiteColor,
    this.isShowContainer = false,
    this.navigateTo,
    this.count,
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
            backgroundColor: background_color,
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
              if (isShowContainer && count != null) ...[
                const SizedBox(width: 10),
                Obx(() => TweenAnimationBuilder<double>(
                  duration: const Duration(seconds: 1),
                  tween: Tween<double>(begin: 0, end: count!.value.toDouble()),
                  builder: (context, value, child) {
                    return Container(
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.redColor,
                      ),
                      child: Center(
                        child: Text(
                          value.toInt().toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    );
                  },
                )),
              ]

            ],

          ),
        ),
      ),
    );
  }
}
