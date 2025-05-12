import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/painter_controller.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button.dart';
import 'package:mapleleaf/utils/ui_helper.dart';
import 'package:mapleleaf/view/Labor%20Contractor%20Engament/labor_contractor_engagement_view.dart';
import 'package:mapleleaf/view/dashboard/ule_dashboard_view.dart';
import 'package:mapleleaf/view/individual%20meetup/Individual_meetup_painter.dart';
import 'package:mapleleaf/view/painter%20engagement/painter_engagement_view.dart';
import 'package:mapleleaf/view/sab%20contractor%20profile/individual_meetup_labor_view.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom widgets/custom_appbar.dart';

class IndividualMeetupView extends StatefulWidget {
  const IndividualMeetupView({super.key});

  @override
  State<IndividualMeetupView> createState() => _IndividualMeetupViewState();
}

class _IndividualMeetupViewState extends State<IndividualMeetupView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child:  Scaffold(
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
              CustomAppbar(
                title: 'INDIVIDUAL MEETUPS',
                timeLocationIsVisible: false,
                onPreesed: () {
                  Get.offAll(() => UleDashboardView()); // Clears all previous routes
                },
              ),

              SizedBox(height: 10.h,),
              Expanded(child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min
                  ,
                  children: [
                    CustomButton(title: "PAINTER", color: AppColors.blackColor, isShowContainer: true, navigateTo: IndividualMeetupPainter(city: '',)),
                    const SizedBox(height: 20),
                    CustomButton(title: "LABORS CONTRACTOR", color: AppColors.blackColor, isShowContainer: true, navigateTo: IndividualMeetupLaborView())
                  ],
                ),
              ))
            ],
          ),
        ],
      ),
    ), onWillPop: () async{
      Get.offAll(() => UleDashboardView(


      ));
      return false;
    });
  }
}
