import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_colors.dart';
import '../app_fonts.dart';

class CustomDropdown1 extends StatelessWidget {
  final String label;
  final RxString selectedValue;
  final List<String> items;
  final BuildContext parentContext;
  final double? width;
  final double? height;
  final Color? titleColor; // optional title color only

  const CustomDropdown1({
    Key? key,
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.parentContext,
    this.width,
    this.height,
    this.titleColor, // use for title only
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color labelColor = titleColor ?? AppColors.primaryColor;

    return GestureDetector(
      onTap: () => _showDropdown(parentContext),
      child: Obx(() => SizedBox(
        height: height ?? 65,
        width: width ?? MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 34, bottom: 25, left: 16, right: 16),
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
                        ? " Select $label"
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
                  style: AppFonts.styleHarmoniaBold14W600(AppColors.lightOrange),
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
                const SizedBox(height: 12),
                TextField(
                  onChanged: (value) => searchText.value = value.toLowerCase(),
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
                Flexible(
                  child: Obx(() {
                    final filtered = items
                        .where((item) => item.toLowerCase().contains(searchText.value))
                        .toList();

                    return ListView.separated(
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
                    );
                  }),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Close",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
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
