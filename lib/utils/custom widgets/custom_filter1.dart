import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_colors.dart';

void showCustomFilterDialog1({
  required BuildContext context,
  required List<String> cityList,
  List<String>? statusList, // Made optional
  required RxString selectedCity,
  RxString? selectedStatus,
  required RxInt selectedMonthIndex,
  required VoidCallback onApply,
}) {
  final modifiedCityList = ["Please Select City", ...cityList];
  final modifiedStatusList = statusList != null ? ["Please Select Status", ...statusList] : null;

  // Set initial values
  if (selectedCity.value.isEmpty) {
    selectedCity.value = modifiedCityList.first;
  }
  if (selectedStatus != null && selectedStatus.value.isEmpty && modifiedStatusList != null) {
    selectedStatus.value = modifiedStatusList.first;
  }
  if (selectedMonthIndex.value == -1) {
    selectedMonthIndex.value = 0; // Default to "This Month"
  }

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
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Filter", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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

                // Month Selector
                Obx(() {
                  final labels = ["This Month", "Since Last Month", "Since Last Two Month"];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(" Month", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 8),
                      // First row: 0 and 1
                      Row(
                        children: List.generate(2, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: ElevatedButton(
                              onPressed: () => selectedMonthIndex.value = index,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 35),
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                side: BorderSide(
                                  color: selectedMonthIndex.value == index
                                      ? AppColors.primaryColor
                                      : Colors.black,
                                  width: 1.5,
                                ),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              ),
                              child: Text(labels[index], style: const TextStyle(fontSize: 13)),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 10),
                      // Second row: index 2
                      ElevatedButton(
                        onPressed: () => selectedMonthIndex.value = 2,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 35),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedMonthIndex.value == 2
                                ? AppColors.primaryColor
                                : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Text(labels[2], style: const TextStyle(fontSize: 13)),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 20),

                // City Dropdown
                StatefulBuilder(
                  builder: (context, setState) {
                    // Reset to default if value is missing from updated list
                    if (!modifiedCityList.contains(selectedCity.value)) {
                      selectedCity.value = modifiedCityList.first;
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(" City", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xffD2F6F9FB),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedCity.value,
                                isExpanded: true,
                                icon: const Icon(Icons.arrow_drop_down),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCity.value = newValue!;
                                  });
                                },
                                items: modifiedCityList.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                        color: value.startsWith("Please Select") ? Colors.red : Colors.black,
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
                ),

                // Status Dropdown (Dynamic - only show if statusList is provided)
                if (modifiedStatusList != null && selectedStatus != null)
                  StatefulBuilder(
                    builder: (context, setState) {
                      // Reset to default if value is missing from updated list
                      if (!modifiedStatusList.contains(selectedStatus!.value)) {
                        selectedStatus.value = modifiedStatusList.first;
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(" Status", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: const Color(0xffD2F6F9FB),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedStatus.value,
                                  isExpanded: true,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedStatus.value = newValue!;
                                    });
                                  },
                                  items: modifiedStatusList.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          color: value.startsWith("Please Select") ? Colors.red : Colors.black,
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
                  ),

                const SizedBox(height: 20),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          onApply(); // Apply filters
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text("SHOW RESULT", style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(color: AppColors.primaryColor, width: 2),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        ),
                        onPressed: () {
                          selectedMonthIndex.value = 0; // Reset to "This Month"
                          selectedCity.value = modifiedCityList.first; // Reset to "Please Select City"
                          if (selectedStatus != null && modifiedStatusList != null) {
                            selectedStatus.value = modifiedStatusList.first; // Reset to "Please Select Status"
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.0),
                          child: Text("CLEAR", style: TextStyle(color: AppColors.primaryColor)),
                        ),
                      ),
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