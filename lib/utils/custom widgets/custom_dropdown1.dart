import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../app_colors.dart';
import '../app_fonts.dart';

class CustomDropdown1 extends StatefulWidget {
  final String label;
  final RxString selectedValue;
  final List<String> items;
  final BuildContext parentContext;
  final double? width;
  final double? height;
  final VoidCallback? ontap;

  const CustomDropdown1({
    Key? key,
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.parentContext,
    this.width,
    this.height,
    this.ontap
  }) : super(key: key);

  @override
  State<CustomDropdown1> createState() => _CustomDropdown1State();
}

class _CustomDropdown1State extends State<CustomDropdown1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showDropdown(widget.parentContext),
      child: Obx(() => SizedBox(
        height: widget.height ?? 65,
        width: widget.width ?? MediaQuery.of(context).size.width,
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
                  Expanded(
                    child: Text(
                      widget.selectedValue.value.isEmpty || !widget.items.contains(widget.selectedValue.value)
                          ? "Select ${widget.label.replaceAll('*', '')}" // remove * if present
                          : widget.selectedValue.value,
                      style: TextStyle(
                        color: widget.selectedValue.value.isEmpty || !widget.items.contains(widget.selectedValue.value)
                            ? AppColors.blackColor.withOpacity(0.6)
                            : AppColors.blackColor,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 4,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  widget.label,
                  style: AppFonts.styleHarmoniaBold16W600(AppColors.primaryColor),
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
                Text(
                  "Select Item",
                  style: const TextStyle(
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
                Flexible(
                  child: Obx(() {
                    final filtered = widget.items
                        .where((item) =>
                        item.toLowerCase().contains(searchText.value))
                        .toList();
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: filtered.length,
                      itemBuilder: (_, index) {
                        final item = filtered[index];
                        final isSelected = widget.selectedValue.value == item;

                        return ListTile(

                          title: Text(
                            item,
                            style: TextStyle(
                              color: isSelected
                                  ? AppColors.primaryColor
                                  : Colors.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          onTap: () {

                            setState(() {
                              widget.selectedValue.value = item;
                              Navigator.pop(context);
                              print("selected Value :${widget.selectedValue.value}");
                              if (widget.ontap != null) widget.ontap!();
                              print(">>>>>>>>>>>>>>>>>>>>>>>>>> ${widget.selectedValue.value}");
                            });

                          },
                        );
                      },
                      separatorBuilder: (_, __) =>
                      const Divider(color: Colors.grey),
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