import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/ui_helper.dart';
import 'package:mapleleaf/view/Labor%20Contractor%20Engament/labor_contractor_engagement_view.dart';
import 'package:mapleleaf/view/individual%20meetup/Individual_meetup_painter.dart';
import 'package:mapleleaf/view/painter%20engagement/painter_engagement_view.dart';
import 'package:mapleleaf/view/sab%20contractor%20profile/individual_meetup_labor_view.dart';

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
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Container(
              // height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Column(
            children: [
              // Top Header
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                decoration: BoxDecoration(
                 color: AppColors.redColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
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
                      Expanded(child: Center(child: Text("Individual Meetups".toUpperCase(), style: AppFonts.styleHarmoniaBold18W600(),))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Expanded(child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min
                  ,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.whiteColor,
                            side: const BorderSide(color: Color(0xff2DA94F), width: 2),
                          ),
                          onPressed: () {
                            Get.to(IndividualMeetupPainter());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/leaf_ic.png',
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "PAINTER",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),

                              ),
                              SizedBox(width: 12,),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red),
                                child: Center(child: Text("0",style: TextStyle(color: Colors.white),)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.whiteColor,
                            side: const BorderSide(color: Color(0xff2DA94F), width: 2),
                          ),
                          onPressed: () {
                            Get.to(IndividualMeetupLaborView());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/leaf_ic.png',
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "LABORS CONTRACTOR",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 12,),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.red),
                                child: Center(child: Text("0",style: TextStyle(color: Colors.white),)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],

                ),
              ))
              // Container(
              //   height: 200,
              //   width: Get.width,
              //   margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              //   decoration: BoxDecoration(
              //     color: AppColors.primaryColor,
              //     borderRadius: BorderRadius.circular(10.r),
              //   ),
              //   child: Column(
              //     children: [
              //       Text("Hello", style: AppFonts.styleHarmoniaBold16W600(AppColors.whiteColor),),
              //     ],
              //   ),
              // ),
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
    );
  }
}
