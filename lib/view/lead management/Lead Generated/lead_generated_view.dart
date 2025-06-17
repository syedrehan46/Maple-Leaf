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

class LeadGeneratedView extends StatefulWidget {
  const LeadGeneratedView({super.key});

  @override
  State<LeadGeneratedView> createState() => _LeadGeneratedViewState();
}

class _LeadGeneratedViewState extends State<LeadGeneratedView> {
  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;

  final LeadGeneratedController controller = Get.put(LeadGeneratedController());

  Widget buildDropdown(String label, List<String> items, RxString selectedValue) {
    String dropdownValue = items.first;

    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " $label",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xffD2F6F9FB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        selectedValue.value = dropdownValue;
                      });
                    },
                    selectedItemBuilder: (BuildContext context) {
                      return items.map((String value) {
                        return Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                        );
                      }).toList();
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: value == items.first ? Colors.red : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showCustomFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.whiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Month",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppColors.primaryColor, shape: BoxShape.circle),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(Icons.close, color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => _filterButton("This Month", 0)),
                      const SizedBox(width: 16),
                      Obx(() => _filterButton("Since Last Month", 1)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Obx(() => _filterButton("Since Last Two Month", 2)),
                  const SizedBox(height: 20),
                  buildDropdown("City", ["Please Select City", "CHARHOI", "DANDI DARA", "DINA", "JHEUM", "KHARIAN", "KOTLA", "SARAI ALAMGIR"], selectedCity),
                  buildDropdown("Status", ["Please Select Status", "LEAD GENERATED", "PROCESSED", "CONVERTED", "CLOSE"], selectedStatus),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          controller.fetchLeadGeneratedData(0); // Optional: Refresh data
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text("SHOW RESULT", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: AppColors.primaryColor, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          selectedIndex.value = -1;
                          selectedCity.value = '';
                          selectedStatus.value = '';
                        },
                        child: const Text("CLEAR", style: TextStyle(color: AppColors.primaryColor)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
                      if(lead.leadStatus =="PROCESSED"){
                    Get.to(FeedbackScreen(lead: lead,isShowFiveFields: false,title: "PORTFOLIO",isShowButton: false,isShowDropdown: false,
                    isShowPlanType: true,moveSalesSectionToBottom:true,moveExpectedKgsBelowRetailer:true
                    ));
                      }else{
                        Get.to(PorfolioTwoView(lead: lead));
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
            showCustomFilterDialog(context);
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
