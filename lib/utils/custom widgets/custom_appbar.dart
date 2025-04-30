import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../app_colors.dart';
import '../app_fonts.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final bool timeLocationIsVisible;
  final bool isshowSummary;
  CustomAppbar({super.key,required this.title, this.timeLocationIsVisible=false, this.isshowSummary=true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 20,),
        Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.redColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            // color: AppColors.primaryColor
          ),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 20),
                child: Row(
                  // alignment: Alignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,)),
                    Text("${title.toUpperCase()}",style: AppFonts.styleHarmoniaBold18W600()),
                    if(timeLocationIsVisible)
                    GestureDetector(
                      onTap: () {
                        showCustomFilterDialog(context);
                      },
                      child: Image.asset(
                        "assets/images/ic_filter.png",
                        height: 20,
                        width: 20,
                        color: Colors.white, // optional: tint the icon if needed
                      ),
                    ),
                    if(!timeLocationIsVisible)
                      SizedBox(width: MediaQuery.of(context).size.width*(10/360),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  final RxInt selectedIndex = 0.obs;

  final RxString selectedCity = "Please Select City".obs;

  final RxString selectedStatus = "Please Select Status".obs;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Month",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppColors.primaryColor, shape: BoxShape.circle),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(Icons.close,
                              color: Colors.white, size: 16),
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
                            color: selectedIndex.value == 0
                                ? Colors.red
                                : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 0),
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
                            color: selectedIndex.value == 1
                                ? Colors.red
                                : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
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
                            color: selectedIndex.value == 2
                                ? Colors.red
                                : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                        ),
                        child: const Text("Since Last Two Month"),
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildDropdown("City", [
                    "Please Select City",
                    "CHARHOI",
                    "DANDI DARA",
                    "DINA",
                    "JHEUM",
                    "KHARIAN",
                    "KOTLA",
                    "SARAI ALAMGIR"
                  ], selectedCity),
                  if(!isshowSummary)
                  const SizedBox(height: 10),
                  if(!isshowSummary)
                  buildDropdown("Status", [
                    "Please Select Status",
                    "LEAD GENERATED",
                    "PROCESSED",
                    "CONVERTED",
                    "CLOSE",
                  ], selectedStatus),
                  const SizedBox(height: 20),

                  /// Final button row
                  ///
                  if(isshowSummary)
                  ElevatedButton(
                    onPressed: () {
                      print("SHOW SUMMARY tapped");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                    child: const Text("SHOW SUMMARY"),
                  ),
                  if(isshowSummary)
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// SHOW SUMMARY


                      /// SHOW RESULT + CLEAR
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                              ),
                              child: const Text("SHOW RESULT",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton(
                            onPressed: () {
                              selectedIndex.value = -1;
                              selectedCity.value = '';
                              selectedStatus.value = '';
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                  color: AppColors.primaryColor, width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                            child: const Text("CLEAR",
                                style:
                                TextStyle(color: AppColors.primaryColor)),
                          ),
                        ],
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
                        return Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
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

}
