import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/Custom_Toaste.dart';
import 'package:mapleleaf/utils/custom%20widgets/background_image.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom%20widgets/floatingaction_button.dart';
import 'package:mapleleaf/utils/custom%20widgets/meetup_card.dart';
import 'package:mapleleaf/view/individual%20meetup/UserLead%20Page/add_leads_view.dart';
import 'package:mapleleaf/view/individual%20meetup/individual_meetup.dart';
import 'package:mapleleaf/view/individual%20meetup/painter_engagement_invite1.dart';
import '../../controller/painter_controller.dart';
import 'Individual_meetup_painter.dart';
import 'individual_meetup_view.dart';

class PainterEntry {
  final String name;
  final String phoneNumber;
  final String type; // "MAPLE LEAF" or "YFFUR" or custom type
  PainterEntry({required this.name, required this.phoneNumber, required this.type});
}
class IndividualMeetingPainters extends StatelessWidget {
  IndividualMeetingPainters({super.key});
  final TextEditingController textEditingController = TextEditingController();
  final PainterDataController painterController = Get.find<PainterDataController>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: Scaffold(
      body: Stack(
        children: [
          // 🔽 Background image
          Positioned.fill(
              child: BackgroundImage()
          ),
          // 🔼 Foreground content
          Column(
            children: [
              CustomAppbar(title: "INDIVIDUAL MEETUPS PAINTER",onPreesed: (){
                Get.offAll(IndividualMeetupView());
              },),
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
              // Create an Obx widget to observe changes to the painter entries list
              Obx(() {
                // Create a list to store all painter entries including static ones
                List<PainterEntry> allEntries = [
                ];
                // Add dynamic entries from the controller if they exist
                if (painterController.painterName.value.isNotEmpty &&
                    painterController.phoneNumber.value.isNotEmpty) {
                  // Check if this painter is already in the list to avoid duplicates
                  bool alreadyExists = false;
                  for (var entry in allEntries) {
                    if (entry.name == painterController.painterName.value &&
                        entry.phoneNumber == painterController.phoneNumber.value) {
                      alreadyExists = true;
                      break;
                    }
                  }
                  if (!alreadyExists) {
                    // Add new painter to the list
                    allEntries.add(PainterEntry(
                        name: painterController.painterName.value,
                        phoneNumber: painterController.phoneNumber.value,
                        type: "PAINTER" // You can set a specific type or use a dynamic value
                    ));
                  }
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: allEntries.length,
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    itemBuilder: (context, index) {
                      final entry = allEntries[index];
                      // Determine the color based on the type
                      AppColors.redColor;

                      return GestureDetector(
                        onTap: () {
                          if(painterController.painterAttachmentImage.value!=null){
                            Get.to(AddLeadsView(title: entry.type));
                          }else{
                            Get.to(PainterEngagementInvite1());
                          }

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: painterController.painterAttachmentImage.value==null ? AppColors.pendingColor : AppColors.redColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    entry.name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Row(
                                    children: [
                                      Text(
                                          entry.phoneNumber,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white
                                          )
                                      ),
                                      const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 25,
                                          color: Colors.white
                                      ),
                                      // Only add the counter bubble for the first item (MAPLE EMPLOYEE)
                                      if (index == 0)
                                        Container(
                                          height: 25,
                                          width: 25,
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
                );
              }),
            ],
          ),
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(onPressed: (){
        Get.to(IndividualMeetup());
      }),
    ), onWillPop: () async {
      Get.offAll(() => IndividualMeetupPainter(city: '',));
      return false;
    },);
  }
}