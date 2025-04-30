import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
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
                  _buildULEButton(),
                  SizedBox(height: 20.h),
                  _buildFOSButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildULEButton() {
    return GestureDetector(
      onTap: () => Get.offAll(() => const UleDashboardView()),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(40.r),
            border: Border.all(color: Color(0xff2DA94F), width: 2),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/leaf_ic.png", height: 30, width: 30),
              SizedBox(width: 10.w),
              Text(
                "ULE/POD/D2C",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFOSButton() {
    return GestureDetector(
      onTap: () => print("FOS tapped"),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8B0000), Color(0xFFB22222)],
            ),
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.4,
                child: Image.asset("assets/images/leaf_ic.png", height: 30, width: 30),
              ),
              SizedBox(width: 10.w),
              Text(
                "FOS",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
