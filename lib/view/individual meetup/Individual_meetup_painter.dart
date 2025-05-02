import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/ui_helper.dart'; // <<-- Make sure to import this
import 'package:mapleleaf/view/individual%20meetup/individual_meeting_painters.dart';

import '../../utils/app_fonts.dart';
import '../../utils/custom widgets/custom_appbar.dart';
import '../../utils/custom widgets/meetup_card.dart';

class IndividualMeetupPainter extends StatelessWidget {
  IndividualMeetupPainter({super.key});

  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
    return Column(
      children: [
        CustomAppbar(title: 'INDIVIDUAL MEETUPS PAINTER',timeLocationIsVisible: true,),
      ],
    );
  }
}
