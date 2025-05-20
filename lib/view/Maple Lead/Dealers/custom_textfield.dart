import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/sign_up_controller.dart';

import '../../../utils/app_colors.dart';


class BuildTextField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final bool obscurePassword;
  final LoginController? loginController;

  BuildTextField({
    super.key,
    required this.controller,
    required this.title,
    this.obscurePassword = false,
    this.loginController,
  }) : assert(
  !obscurePassword || loginController != null,
  'loginController is required when obscurePassword is true',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),

        obscurePassword
            ? Obx(() => TextField(
          controller: controller,
          obscureText: loginController!.obscurePassword.value,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.black434343,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                loginController!.obscurePassword.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: AppColors.lightOrange,
              ),
              onPressed: loginController!.togglePasswordVisibility,
            ),
          ),
          cursorColor: AppColors.primaryColor,
        ))
            : TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: AppColors.black434343,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),
          cursorColor: AppColors.primaryColor,
        ),
      ],
    );
  }
}
