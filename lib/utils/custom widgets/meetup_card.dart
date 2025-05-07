import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import '../../view/individual meetup/individual_meeting_painters.dart';

class MeetupCard extends StatelessWidget {
  final String city;
  final String area;
  final int achieved;
  final int target;
  final int weeklyFreq;
  final String month;
  final double topPadding;

  const MeetupCard({
    super.key,
    required this.city,
    required this.area,
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
        Get.to(() => IndividualMeetingPainters(city: city));
      },
      child: Card(
        color: AppColors.redColor,
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
                    _buildItem(imagePath: "assets/images/ic_city.png", title: "CITY", value: city),
                    const SizedBox(height: 15),
                    _buildItem(imagePath: "assets/images/ic_sub_city.png", title: "AREA", value: area),
                    const SizedBox(height: 15),
                    _buildItem(imagePath: "assets/images/ic_achievements.png", title: "ACH/TARGET", value: "$achieved/$target"),
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
                    _buildItem(imagePath: "assets/images/ic_frequency.png", title: "WEEKLY FREQUENCY", value: "$weeklyFreq"),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: _buildItem(icon: Icons.calendar_month, title: "MONTH", value: month),
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

  Widget _buildItem({String? imagePath, IconData? icon, required String title, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        if (imagePath != null)
          Image.asset(imagePath, width: 18, height: 18, color: Colors.white)
        else if (icon != null)
          Icon(icon, size: 18, color: Colors.white),
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
