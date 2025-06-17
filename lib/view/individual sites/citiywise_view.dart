import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/IS/is_controller.dart';
import '../../utils/custom widgets/meetup_card.dart';

class CityWiseView extends StatelessWidget {
  CityWiseView({super.key});
  final PlanController controller = Get.put(PlanController());

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemCount: controller.cityWisePlanList.length,
        itemBuilder: (context, index) {
          final item = controller.cityWisePlanList[index];
      
          return MeetupCard(
            city: item.cityName,
            achieved: "${item.achievement}/${item.noOfVisits}",
            weeklyFreq: item.weeklyFrequency,
            month: item.activeMonth,
            area: '_',
          );
        },
      ),
    );
  }
}

