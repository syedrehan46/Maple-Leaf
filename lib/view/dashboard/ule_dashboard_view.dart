import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class UleDashboardView extends StatefulWidget {
  const UleDashboardView({super.key});

  @override
  State<UleDashboardView> createState() => _UleDashboardViewState();
}

class _UleDashboardViewState extends State<UleDashboardView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); // Make sure screen util is initialized

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
                  height: 100,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Avatar and text
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundImage: AssetImage('assets/images/ic_profile.png'),
                              backgroundColor: Colors.white,
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
                        Icon(
                          Icons.notifications_none_rounded,
                          size: 30.r,
                          color: AppColors.whiteColor,
                        ),
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
                            _buildAvatar("assets/images/ule_group.png", "UG"),
                            SizedBox(width: 35),
                            _buildAvatar("assets/images/ic_ima.png", "IM"),
                            SizedBox(width: 35),
                            _buildAvatar("assets/images/ic_npi.png", "NPI"),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildAvatar("assets/images/ic_lm.png", "LM"),
                          SizedBox(width: 35),
                          _buildAvatar("assets/images/ic_pe.png", "PE"),
                          SizedBox(width: 35),
                          _buildAvatar("assets/images/ic_scp.png", "SCP"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(String imagePath, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(2), // Border thickness
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey.shade200, // Border color
              width: 1,           // Border width
            ),
          ),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: SizedBox(
                width: 35, // Smaller image size
                height: 35,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
