
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapleleaf/utils/ui_helper.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.arrow_back_ios, size: 16.r,),
                      Text("Create Account", style: AppFonts.styleHarmoniaBold14W600(AppColors.primaryColor),),
                    ],
                  ),
                  SizedBox(height: 25.h,),
                  Text("Sign In to Your Account", style: AppFonts.styleHarmoniaBold31W600(AppColors.blackColor),),
                  SizedBox(height: 100.h,),
                  UiHelper.customTextField(controller: usernameController,labelText: "Username"),
                  SizedBox(height: 20.h,),
                  UiHelper.customPassTextField(controller: passwordController, obscureText: true, isPasswordVisible: true, onPress: (){}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
