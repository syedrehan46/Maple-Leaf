
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
  bool? _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/menu_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: ()=> Get.back(),
                          child: Icon(Icons.arrow_back_ios, size: 16.r,)),
                      Text("Create Account", style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),),
                    ],
                  ),
                  SizedBox(height: 25.h,),
                  Text("Sign In to Your Account", style: AppFonts.styleHarmoniaBold31W600(AppColors.blackColor),),
                  SizedBox(height: 100.h,),
                  UiHelper.customTextField(controller: usernameController,labelText: "Username"),
                  SizedBox(height: 20.h,),
                  UiHelper.customPassTextField(controller: passwordController, obscureText: true, isPasswordVisible: true, onPress: (){}),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio<bool>(
                        value: true,
                        groupValue: _rememberMe == true ? true : null,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = _rememberMe == true ? false : true;
                          });
                        },
                      ),
                      const Text('Remember Me'),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  UiHelper.customButtonFill(
                      color: AppColors.primaryColor,
                      fontColor: Colors.white,
                      btnText: "Sign in".toUpperCase(),
                      onTap: (){
                        if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
                          if(usernameController.text == "12150" && passwordController.text == "Maple@987"){
                            Get.to(()=> SelectDashboardView());
                          }else{
                            print("invalid");
                          }
                        }else{
                          print("Error");
                        }
                      }
                  ),
                  SizedBox(height: Get.height * 0.15,),
                  GestureDetector(
                      onTap: (){
                        Get.to(()=> ForgotPasswordView());
                      },
                      child: Text("Forgot the Password?", style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),)),
                  SizedBox(height: 10.h,),
                  GestureDetector(
                      onTap: (){
                        Get.to(()=> ChangePasswordView());
                      },
                      child: Text("Change Password?", style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),)),
                  SizedBox(height: 20.h,),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("Version : $appVersion", style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
