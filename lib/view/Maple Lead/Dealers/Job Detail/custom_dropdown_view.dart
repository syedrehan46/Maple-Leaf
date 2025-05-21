import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;
  final RxString selectedValue;
  final List<String> items;
  final BuildContext parentContext;

  const CustomDropdownField({
    Key? key,
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.parentContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(parentContext),
      child: Obx(() => Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 34, bottom: 25, left: 16, right: 16),
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
                style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
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
                      color: Colors.black),
                ),
                const SizedBox(height: 12),
                TextField(
                  onChanged: (value) => searchText.value = value.toLowerCase(),
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: 42,
                  endIndent: 10,
                ),
                const SizedBox(height: 12),
                // Make only the list scrollable inside a Flexible widget
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
                        return ListTile(
                          title: Text(item,
                              style: const TextStyle(color: Colors.black)),
                          onTap: () {
                            selectedValue.value = item;
                            Navigator.pop(context);
                          },
                        );
                      },
                      separatorBuilder: (_, __) => const Divider(color: Colors.grey),
                    );
                  }),
                ),
                const SizedBox(height: 8),
                // Close button fixed at bottom right
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Close",
                      style: TextStyle(fontSize: 16,
                          color: Colors.red, fontWeight: FontWeight.bold),
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
