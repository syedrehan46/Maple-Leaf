import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../utils/custom widgets/custom_appbar.dart';
import '../../utils/custom widgets/meetup_card.dart';

class IndividualMeetupPainter extends StatelessWidget {
  IndividualMeetupPainter({super.key});

  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String monthName = DateFormat('MMMM').format(now);
    String upperCaseMonthName = monthName.toUpperCase();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildAppBar(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                MeetupCard(city: "LAHORE", area: "LAHORE", achieved: 2, target: 5, weeklyFreq: 2, month: upperCaseMonthName, topPadding: 16,),
                MeetupCard(city: "KOTLA", area: "KOTLA", achieved: 0, target: 5, weeklyFreq: 2, month: upperCaseMonthName),
                MeetupCard(city: "CHARHOI", area: "CHARHOI", achieved: 0, target: 5, weeklyFreq: 2, month: upperCaseMonthName),
                MeetupCard(city: "SARAI ALAMGIR", area: "SARAI ALAMGIR", achieved: 0, target: 5, weeklyFreq: 2, month: upperCaseMonthName),
                MeetupCard(city: "KOTLA", area: "KOTLA", achieved: 0, target: 5, weeklyFreq: 2, month: upperCaseMonthName),
                MeetupCard(city: "CHARHOI", area: "CHARHOI", achieved: 0, target: 5, weeklyFreq: 2, month:upperCaseMonthName),
                MeetupCard(city: "SARAI ALAMGIR",area: "SARAI ALAMGIR", achieved: 0, target: 5, weeklyFreq: 2, month: upperCaseMonthName),
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
