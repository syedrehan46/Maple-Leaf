import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/view/individual%20meetup/UserLead%20Page/add_leads_view.dart';
import 'package:mapleleaf/view/individual%20meetup/individual_meetup.dart';

import '../../utils/app_fonts.dart';

class IndividualMeetupLabor extends StatelessWidget {
  IndividualMeetupLabor({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/menu_bg.png"), // Background image
                  fit: BoxFit.cover, // Ensures the image covers the entire screen
                ),
              ),
            ),
          ),

          // Foreground Content (Unchanged)
          Column(
            children: [
              // Header Container
              CustomAppbar(title: 'INDIVIDUAL MEETUPS PAINTER'),
              

              // Search TextField
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

              // Placeholder for No Data Found
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "No Data Found",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),

              // Spacer to push the button to the bottom
            ],
          ),
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(IndividualMeetup());
        },
        backgroundColor: const Color(0xff207E39),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        shape: const CircleBorder(),
      ),
    );

  }
}
