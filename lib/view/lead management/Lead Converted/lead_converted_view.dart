import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mapleleaf/model/LM/Lead Converted/lead_converted_model.dart';
import 'package:mapleleaf/model/login_model.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom widgets/custom_appbar.dart';
import 'package:mapleleaf/view/lead management/Lead Converted/feedback_view.dart';

import '../../../controller/LM/lead_converted_controller.dart';

class LeadConvertedView extends StatefulWidget {
  const LeadConvertedView({super.key});

  @override
  State<LeadConvertedView> createState() => _LeadConvertedViewState();
}

class _LeadConvertedViewState extends State<LeadConvertedView> {
  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;

  final LeadConvertedController controller = Get.put(LeadConvertedController());

  // @override
  // void initState() {
  //   super.initState();
  //   controller.fetchLeadConvertedData();
  // }


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
                          decoration: const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(Icons.close, color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: List.generate(3, (index) {
                      final labels = ["This Month", "Since Last Month", "Since Last Two Month"];
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Obx(() => ElevatedButton(
                          onPressed: () => selectedIndex.value = index,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            side: BorderSide(
                              color: selectedIndex.value == index ? Colors.red : Colors.black,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          ),
                          child: Text(labels[index]),
                        )),
                      );
                    }),
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
      body: Column(
        children: [

          CustomAppbar(title: 'Lead Converted', timeLocationIsVisible: true),
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
                      // final leadDate = DateFormat('dd-MMM-yyyy').format(
                      //     DateTime.tryParse(lead.leadConvertedDate ?? '') ?? DateTime.now());

                      return Padding(
                        padding: EdgeInsets.fromLTRB(12, index == 0 ? 22 : 6, 12, 4),
                        child: GestureDetector(
                          onTap: () => Get.to(() =>  FeedbackScreen(lead: lead,)),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: lead.leadStatus =="CONVERTED"? AppColors.readyForCollectionColor :AppColors.pendingColor,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${lead.generalCustomerId }",
                                      style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),
                                    ),
                                    SizedBox(width: 58,),
                                    Text(
                                      "${lead.leadConvertedDate}",
                                      style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "${lead.customerPhone }   ${lead.customerName}",
                                  style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),
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
