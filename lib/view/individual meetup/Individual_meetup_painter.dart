import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/IM/Individual Painter/individual_painter_controller.dart';
import '../../controller/painter_controller.dart';
import '../../utils/custom widgets/custom_appbar.dart';
import '../../utils/custom widgets/meetup_card.dart';
import 'individual_meeting_painters.dart';
import 'individual_meetup_view.dart';

class IndividualMeetupPainter extends StatelessWidget {
  final String city;
  IndividualMeetupPainter({super.key, required this.city});
  final IndividualPainterController controller = Get.put(IndividualPainterController());
  final RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => IndividualMeetupView());
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            _buildAppBar(),
            Expanded(
              child: Obx(() {
                if (controller.meetupCardList.isEmpty) {
                  return Center(child: Text("No data available"));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: controller.meetupCardList.length,
                  itemBuilder: (context, index) {
                    final card = controller.meetupCardList[index];
                    return MeetupCard(
                        city: card.cityName ?? '',
                        area: card.subGroupName ?? '',
                        achieved: card.achievement?.toString() ?? '0',
                        target: card.target ?? 0,
                        weeklyFreq: card.weeklyFrequency ?? 0,
                        month: card.activeMonth ?? '',
                        topPadding: index == 0 ? 16 : 8,
                        onTap: () async {
                          controller.selectedPlan.value = card;
                          controller.selectedPlanIndex.value = index;

                          // 🔁 Fetch new painter data based on selectedPlan
                          await controller.fetcAllPainter();

                          // Navigate to next screen
                          Get.to(() => IndividualMeetingPainters());
                        }


                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Column(
      children: [
        CustomAppbar(
          title: 'INDIVIDUAL MEETUPS PAINTER',
          timeLocationIsVisible: true,
        ),
      ],
    );
  }
}