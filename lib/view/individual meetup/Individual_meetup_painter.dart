import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controller/painter_controller.dart';
import '../../utils/custom widgets/custom_appbar.dart';
import '../../utils/custom widgets/meetup_card.dart';
import 'individual_meeting_painters.dart';
import 'individual_meetup_view.dart';

class IndividualMeetupPainter extends StatelessWidget {
  String city;
  IndividualMeetupPainter({super.key, required this.city});

  // Make sure the controller is registered as a singleton
  final painterDataController = Get.put(PainterDataController(), permanent: true);
  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;

  @override
  Widget build(BuildContext context) {
    // Don't override the city value here as it will reset the selected city
    // Only set it initially if it's empty
    if (painterDataController.city.value.isEmpty) {
      painterDataController.city.value = city;
    }

    return WillPopScope(child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: Obx(() => ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: painterDataController.meetupCards.length,
                itemBuilder: (context, index) {
                  final card = painterDataController.meetupCards[index];
                  return MeetupCard(
                    city: card.city,
                    area: card.area,
                    achieved: card.achieved,
                    target: card.target,
                    weeklyFreq: card.weeklyFreq,
                    month: card.month,
                    topPadding: index == 0 ? 16 : 8,
                    // Check if this card is selected
                    isSelected: painterDataController.isCardSelected(index),
                    onTap: () {
                      // Update the selected card info in the controller
                      painterDataController.updateSelectedCard(index, card);
                      // Make sure the city value is updated from the card
                      print("Card tapped with city: ${card.city}");
                      // Navigate to IndividualMeetingPainters screen
                      Get.to(() => IndividualMeetingPainters());
                    },
                  );
                },
              )),
            ),
          ],
        )
    ), onWillPop: () async {
      Get.offAll(() => IndividualMeetupView());
      return false;
    },);
  }

  Widget _buildAppBar(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(title: 'INDIVIDUAL MEETUPS PAINTER', timeLocationIsVisible: true,),
      ],
    );
  }
}

