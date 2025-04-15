import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/ui_helper.dart';

class UleDashboardView extends StatefulWidget {
  const UleDashboardView({super.key});

  @override
  State<UleDashboardView> createState() => _UleDashboardViewState();
}

class _UleDashboardViewState extends State<UleDashboardView> {
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
            Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(radius: 30.r,),
                          ],
                        ),
                        Icon(Icons.notifications_none_rounded, size: 35.r, color: AppColors.whiteColor,),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
