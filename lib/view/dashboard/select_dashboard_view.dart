import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button.dart';
import 'package:mapleleaf/view/dashboard/ule_dashboard_view.dart';

class SelectDashboardView extends StatefulWidget {
  const SelectDashboardView({super.key});

  @override
  State<SelectDashboardView> createState() => _SelectDashboardViewState();
}

class _SelectDashboardViewState extends State<SelectDashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Corrected Positioned.fill widget with background image
            Positioned.fill(
              child: Image.asset(
                "assets/images/bg.png",
                fit: BoxFit.cover, // Ensures the image covers the entire screen
              ),
            ),
            // ⬇️ BACK BUTTON
            Positioned(
              top: 20.h,
              left: 20.w,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: Icon(Icons.arrow_back_ios, size: 20.r, color: Colors.white),
              ),
            ),

            // ⬇️ BUTTONS IN CENTER
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomButton(title: "ULE/POD/D2C", color: AppColors.primaryColor, navigateTo: UleDashboardView()),
                  SizedBox(height: 20.h),
                  CustomButton(title: "FOS",background_color: AppColors.primaryColor, color: AppColors.whiteColor),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }}


