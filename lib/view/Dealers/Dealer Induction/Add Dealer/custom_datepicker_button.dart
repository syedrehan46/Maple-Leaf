import 'package:flutter/material.dart';

class CustomDatePickerButton extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  const CustomDatePickerButton({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  State<CustomDatePickerButton> createState() => _CustomDatePickerButtonState();
}

class _CustomDatePickerButtonState extends State<CustomDatePickerButton> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller.text =
        "${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                widget.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
