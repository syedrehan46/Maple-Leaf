import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/ui_helper.dart'; // <<-- Make sure to import this
import 'package:mapleleaf/view/individual%20meetup/individual_meeting_painters.dart';

class IndividualMeetupPainter extends StatelessWidget {
  IndividualMeetupPainter({super.key});

  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildAppBar(context),
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
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
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
            const Text(
              "INDIVIDUAL MEETUPS PAINTER",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Positioned(
              left: 0,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
              ),
            ),
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () => UiHelper.showCustomFilterDialog(
                  context,
                  selectedIndex: selectedIndex,
                  selectedCity: selectedCity,
                  selectedStatus: selectedStatus,
                ),
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
    return GestureDetector(
      onTap: () {
        Get.to(() => IndividualMeetingPainters());
      },
      child: Card(
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
