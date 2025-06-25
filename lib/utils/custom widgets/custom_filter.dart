import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_colors.dart';

void showCustomFilterDialog({
  required BuildContext context,
  required List<String> cityList,
  required List<String> statusList,
  required RxString selectedCity,
  RxString? selectedStatus,
  required RxInt selectedMonthIndex,
  required VoidCallback onApply,
}) {
  final modifiedCityList = ["Please Select City", ...cityList];
  final modifiedStatusList = ["Please Select Status", ...statusList];

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

                // Month Selector
                Obx(() {
                  final labels = ["This Month", "Since Last Month", "Since Last Two Month"];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First row: 0 and 1
                      Row(
                        children: List.generate(2, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: ElevatedButton(
                              onPressed: () => selectedMonthIndex.value = index,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 35), // ✅ Smaller height
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
                      // const SizedBox(height: 10),
                      // Second row: index 2
                      ElevatedButton(
                        onPressed: () => selectedMonthIndex.value = 2,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(0, 35), // ✅ Smaller height
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
                buildDropdown("City", modifiedCityList, selectedCity),

                // Status Dropdown
                buildDropdown("Status", modifiedStatusList, selectedStatus!),

                const SizedBox(height: 20),

                // Buttons
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                      onPressed: () {
                        Navigator.pop(context);
                        onApply(); // Apply filters
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
                        selectedMonthIndex.value = -1;
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
Widget buildDropdown(String label, List<String> items, RxString selectedValue) {
  return StatefulBuilder(
    builder: (context, setState) {
      // Reset to default if value is missing from updated list
      if (!items.contains(selectedValue.value)) {
        selectedValue.value = items.first;
      }

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
                  value: selectedValue.value,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue.value = newValue!;
                    });
                  },
                  items: items.map((String value) {
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
  );
}
