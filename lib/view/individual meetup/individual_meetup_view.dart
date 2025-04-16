import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

import '../../utils/app_colors.dart';

class IndividualMeetupView extends StatefulWidget {
  const IndividualMeetupView({super.key});

  @override
  State<IndividualMeetupView> createState() => _IndividualMeetupViewState();
}

class _IndividualMeetupViewState extends State<IndividualMeetupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/menu_bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Column(
              children: [
                // Top Header
                Container(
                  // height: 100,
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Avatar and text
                        GestureDetector(
                          onTap: ()=> Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 20.r,
                            color: AppColors.whiteColor,
                          ),
                        ),
                        Expanded(child: Center(child: Text("Individual Meetup", style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),))),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h,),
                Container(
                  height: 200,
                  width: Get.width,
                  margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      Text("Hello", style: AppFonts.styleHarmoniaBold16W600(AppColors.whiteColor),),
                    ],
                  ),
                ),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: 20,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Container(
                //         height: 200,
                //         width: Get.width,
                //         margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                //         decoration: BoxDecoration(
                //           color: AppColors.primaryColor,
                //           borderRadius: BorderRadius.circular(10.r),
                //         ),
                //         child: Column(
                //           children: [
                //             Text("Hello", style: AppFonts.styleHarmoniaBold16W600(AppColors.whiteColor),),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
