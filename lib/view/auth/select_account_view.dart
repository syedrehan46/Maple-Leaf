import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/ui_helper.dart';
import 'package:mapleleaf/view/auth/sign_in_view.dart';

import '../../utils/app_fonts.dart';

class SelectAccountView extends StatefulWidget {
  const SelectAccountView({super.key});

  @override
  State<SelectAccountView> createState() => _SelectAccountViewState();
}

class _SelectAccountViewState extends State<SelectAccountView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg_img.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 3,),
                Center(child: Image.asset("assets/splash_logo.png"),),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text("By tapping 'Sign in' you agree to our ", style: AppFonts.styleHarmoniaRegular12W400(AppColors.whiteColor),),
                        Text("Terms.", style: AppFonts.styleHarmoniaBold12W600(AppColors.whiteColor).copyWith(decoration: TextDecoration.underline, decorationColor: AppColors.whiteColor,decorationThickness: 3),),
                        Text("Learn how we process your data in our ", style: AppFonts.styleHarmoniaRegular12W400(AppColors.whiteColor),),
                        Text("Privacy Policy ", style: AppFonts.styleHarmoniaBold12W600(AppColors.whiteColor).copyWith(decoration: TextDecoration.underline, decorationColor: AppColors.whiteColor,decorationThickness: 3),),
                        Text("and ", style: AppFonts.styleHarmoniaRegular12W400(AppColors.whiteColor),),
                        Text("Cookies Policy", style: AppFonts.styleHarmoniaBold12W600(AppColors.whiteColor).copyWith(decoration: TextDecoration.underline, decorationColor: AppColors.whiteColor,decorationThickness: 3),),
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    UiHelper.customButtonFill(
                        color: Colors.white,
                        fontColor: Colors.redAccent,
                        btnText: "Create Account".toUpperCase(),
                        onTap: (){
                          print("fill button");
                        }
                    ),
                    SizedBox(height: 10.h,),
                    UiHelper.customButtonOutline(
                        fontColor: Colors.white,
                        btnText: "Sign in".toUpperCase(),
                        onTap: (){
                          Get.to(()=> SignInView());
                          print("fill button");
                        }
                    ),
                    SizedBox(height: 10.h,),
                    Text("Trouble signing in?", style: AppFonts.styleHarmoniaRegular12W400(AppColors.whiteColor),),
                  ],
                ),
                SizedBox(height: 40.h,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
