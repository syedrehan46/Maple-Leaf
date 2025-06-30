import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mapleleaf/controller/LM/lead_processing_controller.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Converted/feedback_view.dart';

import '../../../utils/app_fonts.dart';
import '../../../utils/custom widgets/custom_filter.dart';

class LeadProcessingView extends StatefulWidget {
  const LeadProcessingView({super.key});

  @override
  State<LeadProcessingView> createState() => _LeadProcessingViewState();
}

class _LeadProcessingViewState extends State<LeadProcessingView> {
  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;
  final RxInt selectedMonthIndex = (-1).obs;
  final LeadProcessingController controller = Get.put(LeadProcessingController());

  @override
  void initState() {
    super.initState();

    // ✅ Clear filters on screen open
    controller.selectedCity.value = '';
    controller.selectedStatus.value = '';
    controller.selectedMonthIndex.value = 0;

    // ✅ Fetch all lead data (this month by default)
    controller.fetchLeadProcessingData(0);
  }



  Widget buildDropdown(String label, List<String> items, RxString selectedValue) {
    String dropdownValue = items.first;
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(" $label", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/menu_bg.png", fit: BoxFit.cover)),
          Column(
            children: [
              CustomAppbar(
                title: 'Lead Processing',
                timeLocationIsVisible: true,
                widget: GestureDetector(
                  onTap: () {
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
                      onApply: () async {
                        print("Helloo Rehan");

                        // ✅ Assign UI selections to controller filters
                        controller.selectedCity.value = selectedCity.value;
                        controller.selectedStatus.value = selectedStatus.value;
                        controller.selectedMonthIndex.value = selectedMonthIndex.value;

                        // ✅ Now call API with correct values
                        await controller.fetchLeadProcessingData(
                          controller.selectedMonthIndex.value,
                          city: controller.selectedCity.value,
                          status: controller.selectedStatus.value,
                        );
                        if (controller.selectedCity.value.isNotEmpty ||
                            controller.selectedStatus.value.isNotEmpty) {
                          controller.applyFilters();
                        } else {
                          controller.leadProcessingList.value = controller.allLeads;
                        }// ✅ Apply local filters
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

              Obx(() {
                if (controller.leadProcessingList.isEmpty && controller.errorMessage.isEmpty) {
                  return const Expanded(child: Center(child: CircularProgressIndicator()));
                } else if (controller.errorMessage.isNotEmpty) {
                  return Expanded(child: Center(child: Text(controller.errorMessage.value)));
                }

                return Expanded(
                  child: Builder(
                    builder: (context) {
                      // ✅ Filter only "PROCESSED" leads
                      final processedLeads = controller.leadProcessingList
                          .where((lead) => lead.leadStatus == "PROCESSED")
                          .toList();

                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 12),
                        itemCount: processedLeads.length,
                        itemBuilder: (context, index) {
                          final lead = processedLeads[index];

                          return Padding(
                            padding: EdgeInsets.fromLTRB(12, index == 0 ? 22 : 6, 12, 4),
                            child: GestureDetector(
                              onTap: () => Get.to(() => FeedbackScreen(
                                lead: lead,
                                isShowPlanType: false,
                                moveSalesSectionToBottom: false,
                                showExpectedKgsAfterPlanType: false,
                                isShowButton: false,
                                isShowDropdown: false,
                                isShowShopName: true,
                                moveExpectedKgsBelowRetailer: true,
                                isShowFiveFields: true,
                                isShowexpectedkgsbeforeshopname: true,
                              )),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.activeColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${lead.generalCustomerId}",
                                              style: AppFonts.styleHarmoniaBold14W600(Colors.white),
                                            ),
                                            const SizedBox(width: 52),
                                            Text(
                                              "${lead.leadConvertedDate}",
                                              style: AppFonts.styleHarmoniaBold14W600(Colors.white),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "${lead.customerPhone}   ${lead.painterName}",
                                          style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),
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
                    },
                  ),
                );

              }),
            ],
          ),
        ],
      ),
    );
  }
}
