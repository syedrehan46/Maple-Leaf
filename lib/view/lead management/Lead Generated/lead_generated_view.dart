import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_porfolio.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Converted/feedback_view.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Generated/Portfolio%20View/porfolio_two_view.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Generated/Portfolio%20View/portfolio_view.dart';

import '../../../controller/LM/lead_generated_controller.dart';
import '../../../utils/custom widgets/custom_filter.dart';

class LeadGeneratedView extends StatefulWidget {
  const LeadGeneratedView({super.key});

  @override
  State<LeadGeneratedView> createState() => _LeadGeneratedViewState();
}

class _LeadGeneratedViewState extends State<LeadGeneratedView> {
  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;
  final RxInt selectedMonthIndex = (-1).obs;

  final LeadGeneratedController controller = Get.put(LeadGeneratedController());



  Widget _filterButton(String label, int index) {
    return ElevatedButton(
      onPressed: () {
        selectedIndex.value = index;
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: BorderSide(
          color: selectedIndex.value == index ? Colors.red : Colors.black,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      ),
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset("assets/images/menu_bg.png", fit: BoxFit.fill),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Obx(() {
            if (controller.leadGeneratedList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: controller.leadGeneratedList.length,
              itemBuilder: (context, index) {
                final lead = controller.leadGeneratedList[index];
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    8,
                    index == 0 ? 22 : 6,
                    12,
                    4,
                  ),
                  child: GestureDetector(
                    onTap: ()  {
                      if(lead.leadStatus =="PROCESSED"){
                    Get.to(FeedbackScreen(lead: lead,isShowFiveFields: false,title: "PORTFOLIO",isShowButton: false,isShowDropdown: false,
                    isShowPlanType: true,moveSalesSectionToBottom:true,moveExpectedKgsBelowRetailer:true
                    ));
                      }

                      else{
                        Get.to(PorfolioTwoView(lead: lead),);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: lead.leadStatus == "PROCESSED"
                            ? Colors.green
                            : lead.leadStatus == "CONVERTED"
                            ? AppColors.pendingColor
                            :AppColors.primaryColor,

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Left Column (ID and Phone)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start, // align left
                                children: [
                                  Text(
                                    "${lead.generalCustomerId}",
                                    style: AppFonts.styleHarmoniaBold16W600(Colors.white),
                                  ),
                                  const SizedBox(height: 4), // spacing between ID and phone
                                  Text(
                                    "${lead.customerPhone}",
                                    style: AppFonts.styleHarmoniaBold14W600(Colors.white),
                                  ),
                                ],
                              ),

                              const SizedBox(width: 16),

                              // Right Column (Date and Name)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${lead.leadCreationDate ?? ''}",
                                    style: AppFonts.styleHarmoniaBold14W600(Colors.white),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${lead.customerName ?? ''}",
                                    style: AppFonts.styleHarmoniaBold14W600(Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          if(lead.leadStatus != "PROCESSED")
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(
                              "assets/images/ule_group.png",
                              height: 20,
                              width: 20,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                );
              },
            );
          }),
        ),
        CustomAppbar(title: 'Lead Generated', timeLocationIsVisible: true, isshowSummary: false,widget: GestureDetector(
          onTap: () {

            // 👇 Add your API/filter logic here
            print(" ${controller.cityList}");
            print("Selected Status: ${controller.statusList}");
            print("Selected Month Index: ${selectedMonthIndex}");
            selectedMonthIndex.value = 0;
            showCustomFilterDialog(
              context: context,
              cityList: controller.cityNameList,
              statusList: controller.statusList,
              selectedCity: selectedCity,
              selectedStatus: selectedStatus,
              selectedMonthIndex: selectedMonthIndex,
                onApply: () {
                  print("Helloo Rehan");

                  // ✅ Assign UI selections to controller filters
                  controller.selectedCity.value = selectedCity.value;
                  controller.selectedStatus.value = selectedStatus.value;
                  controller.selectedMonthIndex.value = selectedMonthIndex.value;

                  // ✅ Now call API with correct values
                  controller.fetchLeadGeneratedData(
                    selectedMonthIndex.value,
                    status: selectedStatus.value,
                    city: selectedCity.value,
                  );
                }

            );
          },

          child: Image.asset(
            "assets/images/ic_filter.png",
            height: 20,
            width: 20,
            color: Colors.white, // optional: tint the icon if needed
          ),
        ),),
      ]),
    );
  }
}
