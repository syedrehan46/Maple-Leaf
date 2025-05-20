import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;


  const CustomAppBar({
    super.key,
    required this.title,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBack
          ? IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
      )
          : null,
      title: Text(
        title,
        style: AppFonts.styleHarmoniaBold18W600(),
      ),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
