import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/auth_controller.dart';
import 'package:mapleleaf/utils/custom%20widgets/forget_password_custom_design.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';// <-- Import your custom widget

class ForgetPasswordChangeView extends StatefulWidget {
  const ForgetPasswordChangeView({super.key});

  @override
  State<ForgetPasswordChangeView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgetPasswordChangeView> {
  final TextEditingController employeeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const Positioned.fill(
              child: Image(
                image: AssetImage("assets/images/menu_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.h),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back_ios, size: 16.r),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Change Password",
                      style: AppFonts.styleHarmoniaBold31W600(AppColors.blackColor),
                    ),
                    SizedBox(height: 100.h),

                    /// ✅ Reusable form section
                    CustomTwoInputForm(
                      controller1: employeeController,
                      controller2: passwordController,
                      labelText1: "Employee ID",
                      labelText2: "Password",
                      buttonText: "Change Password",
                      onTap: () {
                        if (employeeController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          Get.find<AuthController>().apiChangePassword(
                            empNo: employeeController.text,
                            password: passwordController.text,
                          );
                        } else {
                          print("Error: Fields are empty");
                        }
                      },
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
