import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter/material.dart';
import 'package:mapleleaf/view/painter%20engagement/Engaged%20Painter/add_lead.dart';

import '../../../controller/PE/Painter_Engaged_Controller.dart';
import '../../../utils/app_colors.dart';
import 'Painter_list.dart';
class EngagedPainter extends StatelessWidget {

  EngagedPainter({super.key});

  bool isEngagedSelected = true;

  final RxInt selectedIndex = 0.obs;

  final RxString selectedCity = "Please Select City".obs;

  @override
  Widget build(BuildContext context) {
    final media=MediaQuery.of(context).size;

    final List<String> cities = [
      "Please Select City", // First red item
      "CHARHOI",
      "DANDI DARA",
      "DINA",
      "JHELUM",
      "KHARIAN",
      "KOTLA",
      "SARAI ALAMGIR",
    ];

    PainterEngagedController painterEngagedController=Get.find<PainterEngagedController>();


    void showCustomFilterDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: AppColors.whiteColor,
            insetPadding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
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
                            decoration: const BoxDecoration(color: AppColors.redColor, shape: BoxShape.circle),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(Icons.close, color: Colors.white, size: 20,),
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
                              color: selectedIndex.value == 0 ? AppColors.primaryColor : Colors.black,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                              color: selectedIndex.value == 1 ? AppColors.primaryColor : Colors.black,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
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
                              color: selectedIndex.value == 2 ? AppColors.primaryColor : Colors.black,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                          ),
                          child: const Text("Since Last Two Month"),
                        )),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("City", style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(height: 8),

                    // City Dropdown
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Obx(() => DropdownButton<String>(
                        dropdownColor: AppColors.whiteColor,
                        value: selectedCity.value,
                        isExpanded: true,
                        underline: Container(), // Remove the default underline
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            selectedCity.value = newValue;
                          }
                        },
                        items: cities.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: value == "Please Select City" ? Colors.black : Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                      )),
                    ),

                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        onPressed: () {
                          print("SHOW SUMMARY tapped");
                        },
                        child: const Text("SHOW SUMMARY", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("SHOW RESULT", style: TextStyle(color: Colors.white)),
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
                            selectedCity.value = "Please Select City";
                          },
                          child: Text("CLEAR", style: TextStyle(color: AppColors.primaryColor)),
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

    return SafeArea(
      child:
// Updated UI Code with Search Functionality
        SingleChildScrollView(
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    width: media.width,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F5F7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) {
                          // Update search query in controller
                          painterEngagedController.updateSearchQuery(value);
                        },
                        cursorColor: AppColors.primaryColor,
                        decoration: const InputDecoration(
                          hintText: "Search",

                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    showCustomFilterDialog(context);
                  },
                  child: Image.asset(
                    'assets/images/ic_filter.png',
                    height: 24,
                    width: 24,
                    color: AppColors.redColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Show filtered list instead of original list
          painterEngagedController.filteredPainterList.isEmpty
              ? painterEngagedController.searchQuery.value.isNotEmpty
              ? const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'No painters found matching your search',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          )
              : const SizedBox.shrink()
              : ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(10),
            itemCount: painterEngagedController.filteredPainterList.length,
            itemBuilder: (context, index) {
              final painterData = painterEngagedController.filteredPainterList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  height: 55,
                  width: media.width * (0.7),
                  decoration: BoxDecoration(
                    color: painterData.isPainter == 'OLD'
                        ? AppColors.selectColor
                        : AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 26, right: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            painterData.painterName.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: 110,
                          margin: const EdgeInsets.only(left: 8),
                          child: Text(
                            painterData.phoneNumber.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () {
                            Get.to(() => AddLead(), arguments: {
                              'name': painterData.painterName,
                              'phone': painterData.phoneNumber,
                            });
                          },
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              painterData.leadCount.toString(),
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
                ],
              )),
        ),
    );

  }
}