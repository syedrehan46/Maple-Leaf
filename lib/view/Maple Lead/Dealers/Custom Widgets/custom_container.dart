import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';

class CustomContainer extends StatelessWidget {
  final String title;
  final String dealerName;
  final String actionLabel;

  const CustomContainer({
    Key? key,
    this.title = "* New Order Generated",
    this.dealerName = "Dealer Name",
    this.actionLabel = "Actions",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      height: 85,
      width: media.width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.greyF7F7F7Color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: AppFonts.styleHarmoniaBold14W600(const Color(0xffFF0000)),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dealerName,
                style: AppFonts.styleHarmoniaBold14W600(Colors.black),
              ),
              Text(
                actionLabel,
                style: AppFonts.styleHarmoniaBold14W600(Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
