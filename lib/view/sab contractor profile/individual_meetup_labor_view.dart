import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import '../../controller/IM/Individual Painter/individual_meetup_painter_labor_controller.dart';
import '../../model/IM/indivdual_painter_model.dart';
import '../../utils/custom widgets/custom_appbar.dart';
import '../../utils/custom widgets/meetup_card.dart';
import '../individual meetup/individual_meeting_painters.dart';

class IndividualMeetupLaborView extends StatelessWidget {
  final controller = Get.put(IndividualMeetupPainterLaborController());

  IndividualMeetupLaborView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/menu_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Foreground content
          Column(
            children: [
              CustomAppbar(
                title: 'INDIVIDUAL MEETUPS LABOR',
                timeLocationIsVisible: true,
              ),

              // Main content
              Expanded(
                child: Obx(() {
                  final list = controller.meetupCardList;
                  if (list.isEmpty) {
                    return const Center(child: Text("No data available"));
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return MeetupCard(
                        city: item.cityName ?? '',
                        area: item.subGroupName ?? '',
                        achieved: item.achievement?.toString() ?? '0',
                        target: item.target ?? 0,
                        weeklyFreq: item.weeklyFrequency ?? 0,
                        month: item.activeMonth ?? '',
                        topPadding: index == 0 ? 16 : 8,
                        onTap: () {
                          print("Tapped card at index $index");
                          Get.to(
                                () => IndividualMeetingPainters(painters: [item]),
                          );
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
