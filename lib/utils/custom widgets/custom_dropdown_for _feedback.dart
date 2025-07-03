import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_colors.dart';
import '../app_fonts.dart';

class CustomDropdownFieldWidget extends StatelessWidget {
  final RxString selectedValue;
  final List<String> items;
  final BuildContext parentContext;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final bool enabled;

  const CustomDropdownFieldWidget({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.parentContext,
    this.width,
    this.height,
    this.onTap,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? () => _showDropdown(parentContext) : null,
      child: Obx(() => Container(
        height: height ?? 55,
        width: width ?? MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
              selectedValue.value.isEmpty ? "Select Item" : selectedValue.value,
              style: const TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: enabled ? Colors.black : Colors.grey.shade400,
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
            width: MediaQuery.of(context).size.width * 0.9,
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
                const SizedBox(height: 10),
                TextField(
                  onChanged: (value) => searchText.value = value.toLowerCase(),
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: AppColors.grey8E8E8EColor),
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: 'Search...',
                  ),
                ),
                const Divider(
                  color: AppColors.greyA4A4A4Color,
                  thickness: 0.5,
                  indent: 42,
                  endIndent: 10,
                ),
                const SizedBox(height: 6),
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
                            if (onTap != null) onTap!();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              item,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 16),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const Divider(
                        color: AppColors.grey8E8E8EColor,
                        thickness: 0.5,
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "CLOSE",
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
