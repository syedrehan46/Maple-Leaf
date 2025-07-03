import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mapleleaf/model/LM/Lead Converted/lead_converted_model.dart';
import 'package:mapleleaf/model/login_model.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom widgets/custom_porfolio.dart';
import 'package:mapleleaf/view/lead management/Lead Converted/feedback_view.dart';
import 'package:mapleleaf/view/lead management/Lead Generated/Portfolio View/porfolio_two_view.dart';

import '../../../controller/LM/lead_converted_controller.dart';
import '../../../utils/custom widgets/custom_filter.dart';

class LeadConvertedView extends StatefulWidget {
  const LeadConvertedView({super.key});

  @override
  State<LeadConvertedView> createState() => _LeadConvertedViewState();
}

class _LeadConvertedViewState extends State<LeadConvertedView> {
  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;
  final RxInt selectedMonthIndex = (-1).obs;

  final LeadConvertedController controller = Get.put(LeadConvertedController());

  @override
  void initState() {
    super.initState();
    controller.selectedCity.value = '';
    controller.selectedStatus.value = '';
    controller.selectedMonthIndex.value = 0;
    controller.fetchLeadConvertedData(0);
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
                        return Text(value, style: const TextStyle(color: Colors.black));
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
      body: Column(
        children: [
          CustomAppbar(
            title: 'Lead Converted',
            timeLocationIsVisible: true,
            widget: GestureDetector(
              onTap: () {
                selectedMonthIndex.value = 0;
                showCustomFilterDialog(
                  context: context,
                  cityList: controller.cityNameList,
                  statusList: controller.statusList,
                  selectedCity: selectedCity,
                  selectedStatus: selectedStatus,
                  selectedMonthIndex: selectedMonthIndex,
                  onApply: () async {
                    controller.selectedCity.value = selectedCity.value;
                    controller.selectedStatus.value = selectedStatus.value;
                    controller.selectedMonthIndex.value = selectedMonthIndex.value;
                    await controller.fetchLeadConvertedData(
                      controller.selectedMonthIndex.value,
                      city: controller.selectedCity.value,
                      status: controller.selectedStatus.value,
                    );
                    if (controller.selectedCity.value.isNotEmpty ||
                        controller.selectedStatus.value.isNotEmpty) {
                      controller.applyFilters();
                    } else {
                      controller.leadConvertedList.value = controller.allLeads;
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
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/menu_bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Obx(() {
                  if (controller.leadConvertedList.isEmpty && controller.errorMessage.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.errorMessage.isNotEmpty) {
                    return Center(child: Text(controller.errorMessage.value));
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 12),
                    itemCount: controller.leadConvertedList.length,
                    itemBuilder: (context, index) {
                      final lead = controller.leadConvertedList[index];
                      final Color textColor = lead.leadStatus == "PROCESSED" ? AppColors.whiteColor : AppColors.blackColor;

                      return Padding(
                        padding: EdgeInsets.fromLTRB(12, index == 0 ? 22 : 6, 12, 4),
                        child: GestureDetector(
                          onTap: () {
                            if (lead.leadStatus == "PROCESSED") {
                              Get.to(FeedbackScreen(lead: lead));
                            } else if (lead.leadStatus == "CONVERTED" && lead.leadSource == "PAINTER LEAD") {
                              Get.to(FeedbackScreen(
                                lead: lead,
                                isShowPlanType: false,
                                moveSalesSectionToBottom: false,
                                showExpectedKgsAfterPlanType: false,
                                isShowButton: true,
                                isShowDropdown: true,
                                showExpectedKgsBeforeRetailer: false,
                                isShowexpectedkgsbeforeshopname: false,
                                isShowShopName: false,
                                moveExpectedKgsBelowRetailer: false,
                                isShowFiveFields: true,

                                showShopNameAfterPlanType: false, // ✅ Added flag
                              ));
                            } else {
                              Get.to(CustomPorfolio(
                                lead: lead,
                                isShowFields: true,
                                isremovedFields: true,
                              ));
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: lead.leadStatus == "PROCESSED"
                                  ? AppColors.readyForCollectionColor
                                  : AppColors.pendingColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${lead.generalCustomerId}", style: AppFonts.styleHarmoniaBold16W600(textColor)),
                                        const SizedBox(height: 4),
                                        Text("${lead.customerPhone}", style: AppFonts.styleHarmoniaBold14W600(textColor)),
                                      ],
                                    ),
                                    const SizedBox(width: 16),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${lead.leadCreationDate ?? ''}", style: AppFonts.styleHarmoniaBold14W600(textColor)),
                                        const SizedBox(height: 8),
                                        Text("${lead.painterName ?? ''}", style: AppFonts.styleHarmoniaBold14W600(textColor)),
                                      ],
                                    ),
                                  ],
                                ),
                                if ((lead.leadStatus == "CONVERTED") && lead.leadSource == "GENERAL CUSTOMER LEAD")
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
