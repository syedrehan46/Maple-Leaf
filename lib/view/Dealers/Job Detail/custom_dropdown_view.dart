import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mapleleaf/utils/app_colors.dart';

import '../../../utils/app_fonts.dart';
class CustomDropdownField extends StatelessWidget {
  final String label;
  final RxString selectedValue;
  final List<String> items;
  final BuildContext parentContext;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.parentContext,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(parentContext),
      child: Obx(() => Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 34, bottom: 25, left: 16, right: 16),
            decoration: BoxDecoration(
             color: AppColors.grey9E9EA2Color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedValue.value.isEmpty
                      ? "Please Select $label"
                      : selectedValue.value,
                  style: const TextStyle(color: AppColors.blackColor),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          Positioned(
            top: 4,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                label,
                style: AppFonts.styleHarmoniaBold16W600(Color(0xFFB31D1E)),
              ),
            ),
          ),
        ],
      )),
    );
  }

  void _showDropdown(BuildContext context) {
    final RxString searchText = ''.obs;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 32),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select a $label",
                    style: AppFonts.styleHarmoniaBold18W600(),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    onChanged: (value) => searchText.value = value.toLowerCase(),
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Search $label",
                      hintStyle: const TextStyle(color: Colors.black45),
                      prefixIcon: const Icon(Icons.search, color: AppColors.grey8E8E8EColor),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 12),
                  Obx(() {
                    final filtered = items
                        .where((item) => item.toLowerCase().contains(searchText.value))
                        .toList();

                    return ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 300),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: filtered.length,
                        itemBuilder: (_, index) {
                          final item = filtered[index];
                          return ListTile(
                            title: Text(item, style: const TextStyle(color: Colors.black)),
                            onTap: () {
                              selectedValue.value = item;
                              Navigator.pop(context);
                            },
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(color: Colors.grey),
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Close",
                        style: TextStyle(color: AppColors.redColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
