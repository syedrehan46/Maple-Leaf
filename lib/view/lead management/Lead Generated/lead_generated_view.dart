import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom widgets/custom_porfolio.dart';
import 'package:mapleleaf/view/lead management/Lead Converted/feedback_view.dart';
import 'package:mapleleaf/view/lead management/Lead Generated/Portfolio View/porfolio_two_view.dart';
import 'package:mapleleaf/view/lead management/Lead Generated/Portfolio View/portfolio_view.dart';

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

  @override
  void initState() {
    super.initState();

    // ✅ Clear filters on screen open
    controller.selectedCity.value = '';
    controller.selectedStatus.value = '';
    controller.selectedMonthIndex.value = 0;

    // ✅ Fetch all lead data (this month by default)
    controller.fetchLeadGeneratedData(0);
  }

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
                    onTap: () {
                      if (lead.leadStatus == "PROCESSED") {
                        Get.to(
                            FeedbackScreen(
                              lead: lead,
                              isShowPlanType: true,
                              showExpectedKgsAfterPlanType: true,
                              showFollowUpDate: true,
                              isShowFiveFields: false,
                              moveSalesSectionToBottom: true,
                              isShowButton: false,
                              isShowDropdown: false,
                                showShopNameAfterPlanType:true,
                            )
                        );
                      } else if (lead.leadStatus == "LEAD GENERATED" &&
                          lead.leadSource == "PAINTER LEAD") {
                        Get.to(PorfolioView(lead: lead));
                      } else if (lead.leadStatus == "LEAD GENERATED" &&
                          lead.leadSource == "GENERAL CUSTOMER LEAD") {
                        Get.to(PorfolioTwoView(lead: lead));
                      } else if (lead.leadStatus == "CONVERTED" &&
                          lead.leadSource == "GENERAL CUSTOMER LEAD") {
                        Get.to(PorfolioTwoView(lead: lead));
                      } else {
                        Get.to(
                            FeedbackScreen(
                              lead: lead,
                              isShowPlanType: true,
                              showExpectedKgsAfterPlanType: true,
                              showFollowUpDate: true,
                              isShowFiveFields: false,
                              moveSalesSectionToBottom: true,
                              isShowButton: false,
                              isShowDropdown: false,
                              isShowShopName: false,

                            )
                        );
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
                            : AppColors.primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Left Column (ID and Phone)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${lead.generalCustomerId}",
                                    style: AppFonts.styleHarmoniaBold16W600(Colors.white),
                                  ),
                                  const SizedBox(height: 4),
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
                                    "${lead.painterName ?? ''}",
                                    style: AppFonts.styleHarmoniaBold14W600(Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          if ((lead.leadStatus == "CONVERTED" ||
                              lead.leadStatus == "LEAD GENERATED") &&
                              lead.leadSource == "GENERAL CUSTOMER LEAD")
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
        CustomAppbar(
          title: 'Lead Generated',
          timeLocationIsVisible: true,
          isshowSummary: false,
          widget: GestureDetector(
            onTap: () {
              showCustomFilterDialog(
                context: context,
                cityList: controller.cityNameList,
                statusList: controller.statusList,
                selectedCity: controller.selectedCity,
                selectedStatus: controller.selectedStatus,
                selectedMonthIndex: controller.selectedMonthIndex,
                onApply: () async {
                  await controller.fetchLeadGeneratedData(
                    controller.selectedMonthIndex.value,
                    city: controller.selectedCity.value,
                    status: controller.selectedStatus.value,
                  );

                  if (controller.selectedCity.value.isNotEmpty ||
                      controller.selectedStatus.value.isNotEmpty) {
                    controller.applyFilters();
                  } else {
                    controller.leadGeneratedList.value = controller.allLeads;
                  }
                },
              );
            },
            child: Image.asset(
              "assets/images/ic_filter.png",
              height: 20,
              width: 20,
              color: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }
}
