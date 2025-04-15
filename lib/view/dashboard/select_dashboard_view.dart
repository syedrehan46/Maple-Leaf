import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/view/dashboard/ule_dashboard_view.dart';

import '../../utils/app_colors.dart';
import '../../utils/ui_helper.dart';

class SelectDashboardView extends StatefulWidget {
  const SelectDashboardView({super.key});

  @override
  State<SelectDashboardView> createState() => _SelectDashboardViewState();
}

class _SelectDashboardViewState extends State<SelectDashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/menu_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            )),
            Positioned(
              top: 20,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: ()=> Get.back(),
                        child: Icon(Icons.arrow_back_ios, size: 16.r,)),
                  ],
                ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: UiHelper.customButtonFill(
                        color: AppColors.primaryColor,
                        fontColor: Colors.white,
                        btnText: "ule/pod".toUpperCase(),
                        onTap: (){
                          Get.to(()=> UleDashboardView());
                          print("ule/pod");
                        }
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: UiHelper.customButtonFill(
                        color: AppColors.primaryColor,
                        fontColor: Colors.white,
                        btnText: "fos".toUpperCase(),
                        onTap: (){
                          print("fill button");
                        }
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: UiHelper.customButtonFill(
                        color: AppColors.primaryColor,
                        fontColor: Colors.white,
                        btnText: "d2c".toUpperCase(),
                        onTap: (){
                          print("fill button");
                        }
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
