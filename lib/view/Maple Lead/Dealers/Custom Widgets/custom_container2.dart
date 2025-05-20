import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';

class CustomContainer2 extends StatelessWidget {
  final String title;


   CustomContainer2({
    Key? key,
    required this.title,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      height: 80,
      width: media.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.greyF7F7F7Color,
      ),
      child: Center(
        child: Text(
          title,
          style: AppFonts.styleHarmoniaBold16W600(AppColors.primaryColor),
        ),
      ),
    );
  }
}
