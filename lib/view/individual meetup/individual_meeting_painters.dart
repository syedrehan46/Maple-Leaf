import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/view/individual%20meetup/UserLead%20Page/add_leads_view.dart';
import 'package:mapleleaf/view/individual%20meetup/individual_meetup.dart';

class IndividualMeetingPainters extends StatelessWidget {
  IndividualMeetingPainters({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔽 Background image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/menu_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 🔼 Foreground content
          Column(
            children: [
              SizedBox(height: 20,),
              // 🔴 Header
              Container(
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 10.h),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Text(
                        "INDIVIDUAL MEETUPS PAINTER ",
                        style: AppFonts.styleHarmoniaBold18W600(),
                      ),
                      Positioned(
                        left: 0,
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 🔍 Search box
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: textEditingController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Search",
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // 🟠 MAPLE EMPLOYEE Card
              GestureDetector(
                onTap: () {
                  Get.to(AddLeadsView(title: "MAPLE LEAF"));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "MAPLE \nEMPLOYEE",
                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 14.0),
                          child: Row(
                            children: [
                              const Text("03164442036", style: TextStyle(fontSize: 16, color: Colors.white)),
                              const Icon(Icons.arrow_forward_ios, size: 25, color: Colors.white),
                              Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(color: AppColors.primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 🟢 YFFUR Card
              GestureDetector(
                onTap: () {
                  Get.to(AddLeadsView(title: "YFFUR"));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "YFFUR",
                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 14.0),
                          child: Row(
                            children: const [
                              Text("03164442036", style: TextStyle(fontSize: 16, color: Colors.white)),
                              Icon(Icons.arrow_forward_ios, size: 25, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),

      // ➕ Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(IndividualMeetup());
        },
        backgroundColor: const Color(0xff207E39),
        child: const Icon(Icons.add, color: Colors.white, size: 40),
        shape: const CircleBorder(),
      ),
    );
  }
}
