import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/ui_helper.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Prevent layout shifting on keyboard
        body: Stack(
          children: [
            // 📌 Background Image (Static)
            const Positioned.fill(
              child: Image(
                image: AssetImage("assets/images/menu_bg.png"),
                fit: BoxFit.cover,
              ),
            ),

            // Foreground Content
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(Icons.arrow_back_ios, size: 16.r),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Change Password",
                      style: AppFonts.styleHarmoniaBold31W600(AppColors.blackColor),
                    ),
                    SizedBox(height: 100.h),
                    UiHelper.customTextField(
                      controller: usernameController,
                      labelText: "Employee ID",
                    ),
                    SizedBox(height: 20.h),
                    UiHelper.customPassTextField(
                      controller: oldPasswordController,
                      obscureText: true,
                      isPasswordVisible: true,
                      onPress: () {},
                      hintText: "Old Password",
                    ),
                    SizedBox(height: 20.h),
                    UiHelper.customPassTextField(
                      controller: newPasswordController,
                      obscureText: true,
                      isPasswordVisible: true,
                      onPress: () {},
                      hintText: "New Password",
                    ),
                    SizedBox(height: 20.h),
                    UiHelper.customPassTextField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      isPasswordVisible: true,
                      onPress: () {},
                      hintText: "Confirm Password",
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: UiHelper.customButtonFill(
                        color: AppColors.primaryColor,
                        fontColor: Colors.white,
                        btnText: "Verify",
                        onTap: () {
                          print("fill button");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
