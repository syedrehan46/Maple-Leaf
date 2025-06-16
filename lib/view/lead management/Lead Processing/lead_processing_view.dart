import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mapleleaf/controller/LM/lead_processing_controller.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Converted/feedback_view.dart';

import '../../../utils/app_fonts.dart';

class LeadProcessingView extends StatefulWidget {
  const LeadProcessingView({super.key});

  @override
  State<LeadProcessingView> createState() => _LeadProcessingViewState();
}

class _LeadProcessingViewState extends State<LeadProcessingView> {
  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;
  final LeadProcessingController controller = Get.put(LeadProcessingController());

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
                      const Text("Month", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                      Obx(() => ElevatedButton(
                        onPressed: () {
                          selectedIndex.value = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedIndex.value == 0 ? Colors.red : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                        ),
                        child: const Text("This Month"),
                      )),
                      const SizedBox(width: 16),
                      Obx(() => ElevatedButton(
                        onPressed: () {
                          selectedIndex.value = 1;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedIndex.value == 1 ? Colors.red : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        ),
                        child: const Text("Since Last Month"),
                      )),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => ElevatedButton(
                        onPressed: () {
                          selectedIndex.value = 2;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedIndex.value == 2 ? Colors.red : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        ),
                        child: const Text("Since Last Two Month"),
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildDropdown("City", ["Please Select City", "CHARHOI", "DANDI DARA", "DINA", "JHEUM", "KHARIAN", "KOTLA", "SARAI ALAMGIR"], selectedCity),
                  const SizedBox(height: 16),
                  buildDropdown("Status", ["Please Select Status", "LEAD GENERATED", "PROCESSED", "CONVERTED", "CLOSE"], selectedStatus),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                        onPressed: () {
                          Navigator.pop(context);
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/menu_bg.png", fit: BoxFit.cover)),
          Column(
            children: [
              CustomAppbar(title: 'Lead Processing', timeLocationIsVisible: true),
              Obx(() {
                if (controller.leadProcessingList.isEmpty && controller.errorMessage.isEmpty) {
                  return const Expanded(child: Center(child: CircularProgressIndicator()));
                } else if (controller.errorMessage.isNotEmpty) {
                  return Expanded(child: Center(child: Text(controller.errorMessage.value)));
                }

                return Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 12),
                    itemCount: controller.leadProcessingList.length,
                    itemBuilder: (context, index) {
                      final lead = controller.leadProcessingList[index];

                      return Padding(
                        padding: EdgeInsets.fromLTRB(12, index == 0 ? 22 : 6, 12, 4),
                        child: GestureDetector(
                          // onTap: () => Get.to(() => FeedbackScreen()),
                          onTap: (){},
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: lead.leadStatus == "PROCESSED"
                                  ? AppColors.readyForCollectionColor
                                  : AppColors.primaryColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${lead.customerName}",
                                      style: AppFonts.styleHarmoniaBold16W600(Colors.white),
                                    ),
                                    const SizedBox(width: 45),
                                    Text(
                                      "${lead.leadConvertedDate}",
                                      style: AppFonts.styleHarmoniaBold14W600(Colors.white),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "${lead.customerPhone}   ${lead.customerName}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
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
    );
  }
}
