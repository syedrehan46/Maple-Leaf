import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_images.dart';

class UiHelper{

  static customContainer({required Color color,required double radius, required Widget child, double pH = 10, double pV = 15,}){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: pH.w,vertical: pV.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
            width: 1,
            color: Color(0xffA4A4A433).withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackShadow.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  static customButton({required double height,required String btnText, required VoidCallback onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(child: Text(btnText, style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),),),
      ),
    );
  }

  static customButtonWithCounter({required double height,required String btnText, required String countText, required VoidCallback onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 50.w),
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(btnText, style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),),
            SizedBox(width: 10.w,),
            CircleAvatar(
              radius: 10.r,
              backgroundColor: AppColors.whiteColor,
              child: Center(child: Text(countText, style: AppFonts.styleHarmoniaRegular10W600(AppColors.primaryColor),)),
            ),
          ],
        ),
      ),
    );
  }

  // static customButtonFill({required Color color,required Color fontColor,required String btnText, required VoidCallback onTap}){
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Container(
  //       padding: EdgeInsets.symmetric(vertical: 12.h),
  //       decoration: BoxDecoration(
  //         color: color,
  //         borderRadius: BorderRadius.circular(100),
  //       ),
  //       child: Center(child: Text(btnText, style: AppFonts.styleManropeRegular15W700(fontColor),),),
  //     ),
  //   );
  // }

  static Widget customButtonFill({
    required Color color,
    required Color fontColor,
    required String btnText,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Button background color
          foregroundColor: Colors.white, // Ripple/splash color
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 3, // Set elevation if needed
        ),
        child: Text(
          btnText,
          style: AppFonts.styleHarmoniaBold14W600(fontColor),
        ),
      ),
    );
  }



  static customButtonOutline({required Color fontColor,required String btnText, required VoidCallback onTap}){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2,color: Colors.white),
        ),
        child: Center(child: Text(btnText, style: AppFonts.styleHarmoniaBold14W600(fontColor),),),
      ),
    );
  }

  static customPassTextField({
    required TextEditingController controller,
    required bool obscureText,
    required bool isPasswordVisible,
    required VoidCallback onPress,
    String hintText = "Password",
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      cursorColor: AppColors.primaryColor,
      style: AppFonts.styleHarmoniaRegular13W400(AppColors.greyA4A4A4Color),
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(hintText),
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: AppFonts.styleHarmoniaRegular13W400(AppColors.greyA4A4A4Color),
        suffixIcon: GestureDetector(
          onTap: onPress,
          child: isPasswordVisible
              ? SvgPicture.asset(AppImages.unHideIcon, fit: BoxFit.scaleDown,color: Colors.black,)
              : SvgPicture.asset(AppImages.hideIcon, fit: BoxFit.scaleDown),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color:Colors.red, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
      validator: validator,
    );
  }


  static customTextField({required TextEditingController controller, required String labelText}){
    return TextField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      textCapitalization: TextCapitalization.words,
      style: AppFonts.styleHarmoniaRegular13W400(AppColors.blackColor),
      decoration: InputDecoration(
        hintText: labelText,
        label: Text(labelText),
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: AppFonts.styleHarmoniaRegular13W400(AppColors.greyA4A4A4Color),
        // isDense: true,
        // Add focusedBorder and enabledBorder here
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.greyA4A4A4Color, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  // static customAppBar({required String title, required String subTitle ,String subNext = ""}){
  //   return AppBar(
  //     backgroundColor: AppColors.whiteColor,
  //     surfaceTintColor: AppColors.whiteColor,
  //     leading: Padding(
  //         padding: EdgeInsets.only(left: 10.w),
  //         child: SizedBox(
  //           width: 45, // Explicit width for the avatar
  //           height: 45, // Explicit height
  //           child: ClipOval(
  //             child: CachedNetworkImage(
  //               imageUrl: Get.find<ProfileController>().avatar.toString(),
  //               fit: BoxFit.cover, // Ensures the image fills the circle
  //               placeholder: (context, url) => Center(
  //                 child: SizedBox(
  //                   width: 20,
  //                   height: 20,
  //                   child: CircularProgressIndicator(
  //                     strokeWidth: 2,
  //                     color: AppColors.primaryColor,
  //                   ),
  //                 ),
  //               ),
  //               errorWidget: (context, url, error) => CircleAvatar(
  //                 radius: 22.5, // Half of width/height
  //                 backgroundColor: Colors.grey.withOpacity(0.2),
  //                 child: Icon(Icons.error, color: AppColors.blackColor),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     title: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(title, style: AppFonts.styleManropeRegular14W600(AppColors.blackColor),),
  //         RichText(
  //           textAlign: TextAlign.start,
  //           text: TextSpan(
  //             text: subTitle,
  //             style: AppFonts.styleManropeRegular10W500(AppColors.blackColor),
  //             children: [
  //               TextSpan(
  //                 text: subNext,
  //                 style: AppFonts.styleManropeRegular10W500(AppColors.blackColor),
  //               ),
  //             ],
  //           ),
  //         ),
  //         // Text(subTitle, style: AppFonts.styleManropeRegular8W500(AppColors.blackColor)),
  //       ],
  //     ),
  //     actions: [
  //       GestureDetector(
  //         onTap: (){
  //           Get.to(()=> NotificationsView(isFromHome: true,));
  //         },
  //         child: Padding(
  //           padding: EdgeInsets.only(right: 15.w),
  //           child: SvgPicture.asset(AppImages.bellIcon,width: 20.w,),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  //
  // static customBar({required String title, required String subTitle ,String subNext = ""}){
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Container(
  //         color: Colors.transparent,
  //         child: Row(
  //           children: [
  //             CircleAvatar(
  //               radius: 25.r, // Adjust the size as needed
  //               backgroundColor: Colors.grey.withOpacity(0.2), // Background in case of error
  //               backgroundImage: NetworkImage(
  //                 Get.find<ProfileController>().avatar.isEmpty ? preferences.getString(SharedKeys.keyAvatar)! : Get.find<ProfileController>().avatar.toString(),
  //               ),
  //             ),
  //             SizedBox(width: 10.w,),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(title, style: AppFonts.styleManropeRegular14W600(AppColors.blackColor),),
  //                 RichText(
  //                   textAlign: TextAlign.start,
  //                   text: TextSpan(
  //                     text: subTitle,
  //                     style: AppFonts.styleManropeRegular10W500(AppColors.blackColor),
  //                     children: [
  //                       TextSpan(
  //                         text: subNext,
  //                         style: AppFonts.styleManropeRegular10W500(AppColors.blackColor),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 // Text(subTitle, style: AppFonts.styleManropeRegular8W500(AppColors.blackColor)),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //       GestureDetector(
  //         onTap: (){
  //           Get.to(()=> NotificationsView(isFromHome: true,));
  //         },
  //         child: SvgPicture.asset(AppImages.bellIcon,width: 20.w,),
  //       ),
  //     ],
  //   );
  // }
}