import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../view/individual meetup/individual_meeting_painters.dart';
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
                      child: _buildItem("assets/images/ic_calender.png", "MONTH", month),
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