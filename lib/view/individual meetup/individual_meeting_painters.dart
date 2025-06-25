import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom widgets/background_image.dart';
import 'package:mapleleaf/utils/custom widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom widgets/floatingaction_button.dart';
import 'package:mapleleaf/view/individual meetup/UserLead Page/add_leads_view.dart';
import 'package:mapleleaf/view/individual meetup/individual_meetup.dart';
import 'package:mapleleaf/view/individual meetup/painter_engagement_invite1.dart';
import '../../controller/painter_controller.dart';
import '../../model/IM/indivdual_painter_model.dart';
import 'Individual_meetup_painter.dart';
import 'individual_meetup_view.dart';

class IndividualMeetingPainters extends StatelessWidget {
  final List<IndivdualPainterModel>? painters;

  IndividualMeetingPainters({super.key, this.painters});

  final TextEditingController textEditingController = TextEditingController();
  final PainterDataController painterController = Get.put(PainterDataController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => IndividualMeetupPainter(city: ''));
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(child: BackgroundImage()),
            Column(
              children: [
                CustomAppbar(
                  title: "INDIVIDUAL MEETUPS PAINTR",
                  onPreesed: () {
                    Get.offAll(() => IndividualMeetupView());
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: textEditingController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: painters?.length ?? 0,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    itemBuilder: (context, index) {
                      final painter = painters?[index];

                      return GestureDetector(
                        onTap: () {
                          if (painterController.painterAttachmentImage.value == null) {
                            Get.to(() => AddLeadsView(
                              title: painter?.planType ?? '',
                              painter: painter,
                            ));
                          } else {
                            Get.to(() => PainterEngagementInvite1());
                          }
                        },

                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: painterController.painterAttachmentImage.value == null
                                  ? AppColors.redColor
                                  : AppColors.redColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    painter?.planType ?? 'No Name',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        painter?.phoneNumber ?? 'wehehj',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.arrow_forward_ios, size: 25, color: Colors.white),
                                      if (index == 0)
                                        Container(
                                          height: 25,
                                          width: 25,
                                          margin: const EdgeInsets.only(left: 8),
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "1",
                                              style: TextStyle(color: AppColors.primaryColor),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () {
            Get.to(() => IndividualMeetup());
          },
        ),
      ),
    );
  }
}
