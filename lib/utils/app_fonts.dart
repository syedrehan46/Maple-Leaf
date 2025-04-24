
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_strings.dart';

class AppFonts{

  static TextStyle styleHarmoniaRegular10W600(Color color){
    return TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.fontFamilyHarmoniaRegular,
        color: color
    );
  }

  static TextStyle styleHarmoniaRegular12W400(Color color){
    return TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppStrings.fontFamilyHarmoniaRegular,
        color: color
    );
  }

  static TextStyle styleHarmoniaBold12W600(Color color){
    return TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.fontFamilyHarmoniaBold,
        color: color
    );
  }

  static TextStyle styleHarmoniaRegular13W400(Color color){
    return TextStyle(
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppStrings.fontFamilyHarmoniaRegular,
        color: color
    );
  }

  static TextStyle styleHarmoniaRegular14W400(Color color){
    return TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontFamily: AppStrings.fontFamilyHarmoniaRegular,
        color: color
    );
  }

  static TextStyle styleHarmoniaBold14W600(Color color){
    return TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.fontFamilyHarmoniaBold,
        color: color
    );
  }

  static TextStyle styleHarmoniaBold31W600(Color color){
    return TextStyle(
        fontSize: 31.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.fontFamilyHarmoniaBold,
        color: color
    );
  }
  static TextStyle styleHarmoniaBold16W600(Color color){
    return TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.fontFamilyHarmoniaBold,
        color: color
    );
  }
  static TextStyle styleHarmoniaBold18W600(Color color){
    return TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        fontFamily: AppStrings.fontFamilyHarmoniaBold,
        color: color
    );
  }

}