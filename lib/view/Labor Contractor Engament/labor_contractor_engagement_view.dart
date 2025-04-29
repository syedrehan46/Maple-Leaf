import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';

import '../../utils/app_fonts.dart';

class LaborContractorEngagementView extends StatelessWidget {
  LaborContractorEngagementView({super.key});

  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;

  Widget buildDropdown(String label, List<String> items, RxString selectedValue) {
    String dropdownValue = items.first;

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
              color: const Color(0xffD2F6F9FB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: Obx(() => DropdownButton<String>(
                value: selectedValue.value.isNotEmpty ? selectedValue.value : items.first,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    selectedValue.value = newValue;
                  }
                },
                selectedItemBuilder: (BuildContext context) {
                  return items.map((String value) {
                    return Text(
                      value,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    );
                  }).toList();
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => ElevatedButton(
                        onPressed: () {
                          selectedIndex.value = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedIndex.value == 0 ? Colors.red : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                        ),
                        child: const Text("This Month"),
                      )),
                      const SizedBox(width: 16),
                      Obx(() => ElevatedButton(
                        onPressed: () {
                          selectedIndex.value = 1;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedIndex.value == 1 ? Colors.red : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        ),
                        child: const Text("Since Last Month"),
                      )),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => ElevatedButton(
                        onPressed: () {
                          selectedIndex.value = 2;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedIndex.value == 2 ? Colors.red : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        ),
                        child: const Text("Since Last Two Month"),
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildDropdown("City", ["Please Select City", "CHARHOI", "DANDI DARA", "DINA", "JHEUM", "KHARIAN", "KOTLA", "SARAI ALAMGIR"], selectedCity),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: const Text("SHOW RESULT", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: AppColors.primaryColor, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          selectedIndex.value = -1;
                          selectedCity.value = '';
                          selectedStatus.value = '';
                        },
                        child: const Text("CLEAR", style: TextStyle(color: AppColors.primaryColor)),
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
      body: SafeArea(
        child: Column(
          children: [

            Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "INDIVIDUAL MEETUPS LABOR",
                    style: AppFonts.styleHarmoniaBold18W600(),
                  ),
                  Positioned(
                    left: 0,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    child: GestureDetector(
                      onTap: () => showCustomFilterDialog(context),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.transparent,
                        child: Image.asset(
                          "assets/images/ic_filter.png",
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                children: const [
                  MeetupCard(city: "DANDI DARA", subCity: "DANDI DARA", achieved: 2, target: 30, weeklyFreq: 8, month: "APRIL", topPadding: 16),
                  MeetupCard(city: "KOTLA", subCity: "KOTLA", achieved: 0, target: 30, weeklyFreq: 8, month: "APRIL"),
                  MeetupCard(city: "CHARHOI", subCity: "CHARHOI", achieved: 0, target: 30, weeklyFreq: 8, month: "APRIL"),
                  MeetupCard(city: "SARAI ALAMGIR", subCity: "SARAI ALAMGIR", achieved: 0, target: 30, weeklyFreq: 9, month: "APRIL"),
                  MeetupCard(city: "KOTLA", subCity: "KOTLA", achieved: 0, target: 30, weeklyFreq: 8, month: "APRIL"),
                  MeetupCard(city: "CHARHOI", subCity: "CHARHOI", achieved: 0, target: 30, weeklyFreq: 8, month: "APRIL"),
                  MeetupCard(city: "SARAI ALAMGIR", subCity: "SARAI ALAMGIR", achieved: 0, target: 30, weeklyFreq: 9, month: "APRIL"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MeetupCard extends StatelessWidget {
  final String city;
  final String subCity;
  final int achieved;
  final int target;
  final int weeklyFreq;
  final String month;
  final double topPadding;

  const MeetupCard({
    super.key,
    required this.city,
    required this.subCity,
    required this.achieved,
    required this.target,
    required this.weeklyFreq,
    required this.month,
    this.topPadding = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.shade800,
      margin: EdgeInsets.fromLTRB(16, topPadding, 16, 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItem("assets/images/ic_city.png", "CITY", city),
                  const SizedBox(height: 8),
                  _buildItem("assets/images/ic_sub_city.png", "SUB CITY", subCity),
                  const SizedBox(height: 8),
                  _buildItem("assets/images/ic_achievements.png", "ACH/TARGET", "$achieved/$target"),
                ],
              ),
            ),
            Container(
              height: 160,
              width: 1,
              color: Colors.white.withOpacity(0.4),
              margin: const EdgeInsets.symmetric(horizontal: 8),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildItem("assets/images/ic_frequency.png", "WEEKLY FREQUENCY", "$weeklyFreq"),
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: _buildItem("assets/images/ic_frequency.png", "MONTH", month),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String imagePath, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(imagePath, width: 18, height: 18, color: Colors.white),
        const SizedBox(width: 8),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "$title\n",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}