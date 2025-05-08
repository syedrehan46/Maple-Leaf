import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';

class CustomDropdownFeild extends StatefulWidget {
  final String? title;
  final String? hintText;
  final double width;
  final List<String> items;
  final Function(String) onChanged;
  final String? initialValue;

  const CustomDropdownFeild({
    Key? key,
    required this.width,
    required this.items,
    required this.onChanged,
    this.initialValue,
    this.title,
    this.hintText,
  }) : super(key: key);

  @override
  State<CustomDropdownFeild> createState() => _CustomDropdownFeildState();
}

class _CustomDropdownFeildState extends State<CustomDropdownFeild> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? (widget.items.isNotEmpty ? widget.items.first : null);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Text
        if (widget.title != null)
          Text(
            widget.title!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.blackColor // AppColors.black434343
            ),
          ),
        const SizedBox(height: 6),

        // Custom Dropdown
        Container(
          height: 50,
          width :(widget.width),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField<String>(
                isDense: true,
                decoration: InputDecoration.collapsed(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                value: selectedValue,
                dropdownColor: Colors.white, // AppColors.whiteColor
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedValue = value;
                    });
                    widget.onChanged(value);
                  }
                },
                items: widget.items.map((item) {
                  final isFirstItem = item == widget.items.first;

                  return DropdownMenuItem<String>(
                    value: item,
                    child: Container(
                      width: media.width,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      color: isFirstItem ? AppColors.redColor : Colors.transparent, // Red background for first item
                      child: Text(
                        item,
                        style: TextStyle(
                          color: isFirstItem ? Colors.white : const Color(0xFF000000), // White text for first item, black for others
                        ),
                      ),
                    ),
                  );
                }).toList(),
                selectedItemBuilder: (BuildContext context) {
                  return widget.items.map((item) {
                    return Text(
                      item,
                      style: const TextStyle(color: Colors.black),
                    );
                  }).toList();
                },
                icon: const Icon(Icons.arrow_drop_down),
                isExpanded: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

