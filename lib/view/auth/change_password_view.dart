import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/auth_controller.dart';
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
  bool _isVisivleOldPassoword=false;
  bool _isVisivleNewPassoword=false;
  bool _isVisivleConfirmPassoword=false;
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard on tap
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Prevent layout shifting on keyboard
        body: Form(
          key: _formKey,
          child: Stack(
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
                        labelText: "UserName",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter correct username';
                          }
                          return null;},
                      ),
                      SizedBox(height: 20.h),
                      UiHelper.customPassTextField(
                        controller: oldPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your old password';
                          }
                          return null;},
                        obscureText: !_isVisivleOldPassoword,
                        isPasswordVisible: _isVisivleOldPassoword,
                        onPress: () {
                          setState(() {
                            _isVisivleOldPassoword= !_isVisivleOldPassoword;
                          });
                        },
                        hintText: "Old Password",
                      ),
                      SizedBox(height: 20.h),
                      UiHelper.customPassTextField(
                        controller: newPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your new password';
                          }
                          return null;},

                        obscureText: !_isVisivleNewPassoword,
                        isPasswordVisible: _isVisivleNewPassoword,
                        onPress: () {
                          setState(() {
                            _isVisivleNewPassoword= !_isVisivleNewPassoword;
                          });
                        },
                        hintText: "New Password",
                      ),
                      SizedBox(height: 20.h),
                      UiHelper.customPassTextField(
                        controller: confirmPasswordController,
                        validator: (value){
                          if(value!=newPasswordController.text ||value== null){
                            return "New and confirm passwords must be the same.";
                          }
                          else
                            return null;
                        },
                        obscureText: !_isVisivleConfirmPassoword,
                        isPasswordVisible: _isVisivleConfirmPassoword,
                        onPress: () {
                          setState(() {
                            _isVisivleConfirmPassoword=!_isVisivleConfirmPassoword;
                          });

                        },
                        hintText: "Confirm Password",
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: UiHelper.customButtonFill(
                          color: AppColors.primaryColor,
                          fontColor: Colors.white,
                          btnText: "Sign Up",
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              if(newPasswordController.text == confirmPasswordController.text){
                                Get.find<AuthController>().apiUpdateCredential(
                                    userName: usernameController.text,
                                    oldPassword: oldPasswordController.text,
                                    newPassword: newPasswordController.text
                                );
                              }else{
                                print("newpass not matched");
                              }
                            }
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
      ),
    );
  }
}

