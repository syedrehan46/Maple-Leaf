import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/view/individual%20meetup/individual_meeting_painters.dart';
import 'package:mapleleaf/view/sab%20contractor%20profile/individual_meetup_labor.dart';

import '../../utils/app_fonts.dart';
import '../../utils/custom widgets/custom_appbar.dart';
import '../../utils/custom widgets/meetup_card.dart';

class IndividualMeetupLaborView extends StatelessWidget {
  IndividualMeetupLaborView({super.key});

  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = "Please Select City".obs;
  final RxString selectedStatus = "Please Select Status".obs;

  Widget buildDropdown(String label, List<String> items, RxString selectedValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " $label",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FBFB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: Obx(() => DropdownButton<String>(
                value: selectedValue.value,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    selectedValue.value = newValue;
                  }
                },
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: value == items.first ? Colors.red : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              )),
            ),
          ),
        ],
      ),
    );
  }

  void showCustomFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.whiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Month", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(Icons.close, color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: List.generate(3, (index) {
                      final labels = ["This Month", "Since Last Month", "Since Last Two Month"];
                      return Obx(() => ElevatedButton(
                        onPressed: () => selectedIndex.value = index,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedIndex.value == index ? Colors.red : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        ),
                        child: Text(labels[index]),
                      ));
                    }),
                  ),
                  const SizedBox(height: 20),
                  buildDropdown("City", [
                    "Please Select City",
                    "CHARHOI",
                    "DANDI DARA",
                    "DINA",
                    "JHEUM",
                    "KHARIAN",
                    "KOTLA",
                    "SARAI ALAMGIR"
                  ], selectedCity),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text("SHOW RESULT", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: AppColors.primaryColor, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            selectedIndex.value = -1;
                            selectedCity.value = "Please Select City";
                            selectedStatus.value = "Please Select Status";
                          },
                          child: const Text("CLEAR", style: TextStyle(color: AppColors.primaryColor)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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
              CustomAppbar(title: 'INDIVIDUAL MEETUPS LABOR',timeLocationIsVisible: true,),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    MeetupCard(city: "DANDI DARA", area: "DANDI DARA", achieved: 2, target: 30, weeklyFreq: 8, month: "APRIL", topPadding: 16),
                    MeetupCard(city: "KOTLA", area: "KOTLA", achieved: 0, target: 30, weeklyFreq: 8, month: "APRIL"),
                    MeetupCard(city: "CHARHOI", area: "CHARHOI", achieved: 0, target: 30, weeklyFreq: 8, month: "APRIL"),
                    MeetupCard(city: "SARAI ALAMGIR", area: "SARAI ALAMGIR", achieved: 0, target: 30, weeklyFreq: 9, month: "APRIL"),
                    MeetupCard(city: "KOTLA", area: "KOTLA", achieved: 0, target: 30, weeklyFreq: 8, month: "APRIL"),
                    MeetupCard(city: "CHARHOI", area: "CHARHOI", achieved: 0, target: 30, weeklyFreq: 8, month: "APRIL"),
                    MeetupCard(city: "SARAI ALAMGIR", area: "SARAI ALAMGIR", achieved: 0, target: 30, weeklyFreq: 9, month: "APRIL"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

  }
}
