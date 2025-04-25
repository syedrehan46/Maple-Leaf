import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/view/Group%20Management/group_management_view.dart';
import 'package:mapleleaf/view/individual%20meetup/individual_meetup_view.dart';
import 'package:mapleleaf/view/lead%20management/lead_management_view.dart';
import 'package:mapleleaf/view/new%20painter%20induction/new_painter_induction_view.dart';
import 'package:mapleleaf/view/painter%20engagement/painter_engagement_view.dart';
import 'package:mapleleaf/view/sab%20contractor%20profile/sab_contractor_profile_view.dart';
import '../../utils/app_colors.dart';

class UleDashboardView extends StatefulWidget {
  const UleDashboardView({super.key});

  @override
  State<UleDashboardView> createState() => _UleDashboardViewState();
}

class _UleDashboardViewState extends State<UleDashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                height: 120,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Avatar and text
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: CircleAvatar(
                              radius: 25.r,
                              backgroundImage:
                              AssetImage('assets/images/ic_profile.png'),
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello, Welcome 🎉",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Text(
                                "Aftab Ahmad",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(padding:EdgeInsets.only(top:16),child:Image.asset("assets/images/ic_notification.png",height:25,width:25,color:Colors.white))
                    ],
                  ),
                ),
              ),

              // Our Menu Text
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Our Menu",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Avatars with Labels
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildAvatar(
                              imagePath: "assets/images/ule_group.png",
                              label: "GE",
                              onTap: () {Get.to(GroupManagementView());}),
                          SizedBox(width: 35.w),
                          _buildAvatar(
                              imagePath: "assets/images/ic_ima.png",
                              label: "IM",
                              onTap: () {
                                Get.to(() => IndividualMeetupView());
                              }),
                          SizedBox(width: 35.w),
                          _buildAvatar(
                              imagePath: "assets/images/ic_npi.png",
                              label: "NPI",
                              onTap: () {
                                Get.to(NewPainterInductionView());
                              }),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildAvatar(
                            imagePath: "assets/images/ic_lm.png",
                            label: "LM",
                            onTap: () {Get.to(LeadManagementView());}),
                        SizedBox(width: 35.w),
                        _buildAvatar(
                            imagePath: "assets/images/ic_pe.png",
                            label: "PE",
                            onTap: () {Get.to(PainterEngagementView());}),
                        SizedBox(width: 35.w),
                        _buildAvatar(
                            imagePath: "assets/images/ic_scp.png",
                            label: "SCP",
                            onTap: () {Get.to(SabContractorProfileView());}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar({
    required String imagePath,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.w,
              ),
            ),
            child: CircleAvatar(
              radius: 35.r,
              backgroundColor: Colors.white,
              child: Image.asset(
                imagePath,
                height: 40.r,
                width: 40.r,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          label,
          style: AppFonts.styleHarmoniaBold14W600(AppColors.blackColor),
        ),
      ],
    );
  }
}
