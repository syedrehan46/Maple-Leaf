import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../app_colors.dart';
import '../app_fonts.dart';

class CustomDropdown1 extends StatelessWidget {
  final String label;
  final RxString selectedValue;
  final List<String> items;
  final BuildContext parentContext;
  final double? width;
  final double? height;
  final VoidCallback? ontap;
  final Color titleColor;

  CustomDropdown1({
    Key? key,
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.parentContext,
    this.width,
    this.height,
    this.ontap,
    required this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(parentContext),
      child: Obx(() => SizedBox(
        height: height ?? 65,
        width: width ?? MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 34, bottom: 25, left: 16, right: 16),
              decoration: BoxDecoration(
                color: AppColors.grey9E9EA2Color,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedValue.value.isEmpty
                        ? "Select ${label.replaceAll('*', '')}"
                        : selectedValue.value,
                    style: const TextStyle(color: Colors.black),
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
                  style: AppFonts.styleHarmoniaBold16W600(titleColor),
                ),
              ),
            ),
          ],
        ),
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
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 120),
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Select Item",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextField(
                  onChanged: (value) => searchText.value = value.toLowerCase(),
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: AppColors.grey8E8E8EColor),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const Divider(
                  color: AppColors.greyA4A4A4Color,
                  thickness: 0.5,
                  indent: 42,
                  endIndent: 10,
                ),
                Flexible(
                  child: Obx(() {
                    final filtered = items
                        .where((item) =>
                        item.toLowerCase().contains(searchText.value))
                        .toList();

                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: filtered.length,
                      itemBuilder: (_, index) {
                        final item = filtered[index];
                        return GestureDetector(
                          onTap: () {
                            selectedValue.value = item;
                            Navigator.pop(context);
                            if (ontap != null) ontap!();
                          },
                          child: Container(
                            // item height
                            margin: const EdgeInsets.symmetric(vertical: 5), // spacing between items
                            child: Text(
                              item,
                              style: const TextStyle(color: Colors.black, fontSize: 16),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) =>
                      const Divider(color: AppColors.grey8E8E8EColor,thickness: 0.5,),
                    );
                  }),
                ),
                const SizedBox(height: 2),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Close",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}