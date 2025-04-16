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
                              backgroundImage: AssetImage('assets/images/user_avatar.png'),
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
                  padding: EdgeInsets.all(12.0),
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
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.orangeAccent.withOpacity(0.2),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage("assets/images/ule_group.png"),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "UG",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                ),
                              ],
                            ),
                            SizedBox(width: 35),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.greenAccent.withOpacity(0.2),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage("assets/images/ic_ima.png"),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "IM",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                ),
                              ],
                            ),
                            SizedBox(width: 35),
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor: Colors.blueAccent.withOpacity(0.2),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundImage: AssetImage("assets/images/ic_npi.png"),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "NPI",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.orangeAccent.withOpacity(0.2),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage("assets/images/ule_group.png"),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "UG",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                  ),
                                ],
                              ),
                              SizedBox(width: 35),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.greenAccent.withOpacity(0.2),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage("assets/images/ic_ima.png"),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "IM",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                  ),
                                ],
                              ),
                              SizedBox(width: 35),
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.blueAccent.withOpacity(0.2),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage("assets/images/ic_npi.png"),
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "NPI",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                                  ),
                                ],
                              ),

                            ],
                          ),
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
        CircleAvatar(
          radius: 30, // You can adjust the size as needed
          backgroundImage: AssetImage(imagePath),
          backgroundColor: Colors.grey[200], // Optional: fallback color
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
