import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

class GroupManagementView extends StatelessWidget {
  const GroupManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.redColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              // color: AppColors.primaryColor
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text("GROUP MANAGEMENT",style: AppFonts.styleHarmoniaBold18W600()),
              Positioned(left: 0,child: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,))),
              Positioned(
                right: 15,
                child: Image.asset(
                  "assets/images/ic_filter.png",
                  height: 20,
                  width: 20,
                  color: Colors.white, // optional: tint the icon if needed
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
