import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/main.dart';
import 'package:mapleleaf/utils/ui_helper.dart';
import 'package:mapleleaf/view/auth/change_password_view.dart';
import 'package:mapleleaf/view/auth/forgot_password_view.dart';
import 'package:mapleleaf/view/dashboard/select_dashboard_view.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _rememberMe = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // dismiss keyboard
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
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(Icons.arrow_back_ios, size: 16.r),
                        ),
                        Text(
                          "Create Account",
                          style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.h),
                    Text(
                      "Sign In to Your Account",
                      style: AppFonts.styleHarmoniaBold31W600(AppColors.blackColor),
                    ),
                    SizedBox(height: 100.h),

                    // Username
                    UiHelper.customTextField(
                      controller: usernameController,
                      labelText: "Username",
                    ),
                    SizedBox(height: 20.h),

                    // Password with visibility toggle
                    UiHelper.customPassTextField(controller: passwordController, obscureText: true, isPasswordVisible: true, onPress: (){}),
                    SizedBox(height: 10.h),

                    // Custom Circular Checkbox
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _rememberMe = !_rememberMe;
                        });
                      },
                      child: Row(
    children: [
    Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: Colors.red), // red border
    ),
    child: _rememberMe
    ? Center(
    child: Container(
    width: 10,
    height: 10,
    decoration: BoxDecoration(
    color: Colors.red,
    shape: BoxShape.circle,
    ),
    ),
    )
        : null,
    ),
    const SizedBox(width: 8),
    const Text('Remember Me'),
    ],
    ),

    ),


                    SizedBox(height: 20.h),

                    // Sign In Button
                    UiHelper.customButtonFill(
                      color: AppColors.primaryColor,
                      fontColor: Colors.white,
                      btnText: "Sign in".toUpperCase(),
                      onTap: () {
                        if (usernameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          // if (usernameController.text == "12150" &&
                          //     passwordController.text == "Maple@987") {
                          //   Get.to(() => const SelectDashboardView());
                          // } else {
                          //   print("invalid");
                          // }
                          Get.to(() => const SelectDashboardView());
                        } else {
                          print("Error");
                        }
                      },
                    ),

                    // SizedBox(height: Get.height * 0.1),

                    // Centered Forgot Password
                   Padding(
                     padding: const EdgeInsets.only(top: 14.0),
                     child: Column(
                       children: [
                         Center(
                           child: GestureDetector(
                             onTap: () {
                               Get.to(() => const ForgotPasswordView());
                             },
                             child: Text(
                               "Forgot the Password?",
                               style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),
                             ),
                           ),
                         ),

                         SizedBox(height: 10.h),

                         // Centered Change Password
                         Center(
                           child: GestureDetector(
                             onTap: () {
                               Get.to(() => const ChangePasswordView());
                             },
                             child: Text(
                               "Change Password?",
                               style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                    SizedBox(height: 85.h),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Version : $appVersion",
                        style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),
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
