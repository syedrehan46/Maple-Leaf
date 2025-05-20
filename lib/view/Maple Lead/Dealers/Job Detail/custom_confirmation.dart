import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom widgets/Custom_Toaste.dart';

import 'custom_toast.dart'; // Make sure this is your correct path

class ConfirmationPopup extends StatelessWidget {
  final String label;
  const ConfirmationPopup({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: Text(
        "$label..!!!",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      content: Text(
        "Are you sure you want to $label?",
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(), // Close only the dialog
          child: Text(
            "NO",
            style: AppFonts.styleHarmoniaBold14W600(const Color(0xff0f722a)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close dialog
           CustomToast("General Custom Updated Succefully",context: context);

            // Delay to ensure navigation completes before showing the toast

          },
          child: Text(
            "YES",
            style: AppFonts.styleHarmoniaBold14W600(const Color(0xff0f722a)),
          ),
        ),
      ],
    );
  }
}
