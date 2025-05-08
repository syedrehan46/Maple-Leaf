import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/auth_controller.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/ui_helper.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  TextEditingController employeeController = TextEditingController();
  TextEditingController cnicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // dismiss keyboard on tap
      child: Scaffold(
        resizeToAvoidBottomInset: false, // prevent screen shift on keyboard
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
                      "Forgot Password",
                      style: AppFonts.styleHarmoniaBold31W600(AppColors.blackColor),
                    ),
                    SizedBox(height: 100.h),
                    UiHelper.customTextField(
                      controller: employeeController,
                      labelText: "Employee ID",
                    ),
                    SizedBox(height: 20.h),
                    UiHelper.customTextField(
                      controller: cnicController,
                      labelText: "CNIC",
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: UiHelper.customButtonFill(
                        color: AppColors.primaryColor,
                        fontColor: Colors.white,
                        btnText: "Verify",
                        onTap: () {
    if (employeeController.text.isNotEmpty &&
    cnicController.text.isNotEmpty) {
    Get.find<AuthController>().apiVerifyPassword(empNo: employeeController.text, cnic: cnicController.text);
    }
    else {
    print("Error");
    }
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
