import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/view/individual%20sites/IS_form.dart';
import '../../controller/IS/is_controller.dart';
import '../../utils/custom widgets/meetup_card.dart';
class AreaWiseView extends StatelessWidget {
  AreaWiseView({super.key});
  final PlanController controller = Get.put(PlanController());
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Obx((){
        return ListView.builder(
          itemCount: controller.areaWisePlanList.length,
          itemBuilder: (context, index) {
            final item = controller.areaWisePlanList[index];
            return InkWell(onTap:(){
              final isController = Get.find<PlanController>();
              isController.selectedCityFromList.value = item.cityName ?? '';
              Get.off(IsForm());},
              child: MeetupCard(
                showTarget: false,
                city: item.cityName,
                achieved: "${item.achievement}/${item.noOfVisits}",
                weeklyFreq: item.weeklyFrequency,
                month: item.activeMonth,
                area: item.areaName,
              ),
            );
          },
        );
      }),
    );
  }
}
