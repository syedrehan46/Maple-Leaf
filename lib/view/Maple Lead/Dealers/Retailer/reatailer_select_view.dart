import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

import '../Custom Widgets/custom_apbar_view.dart';
import '../custom_button1.dart';

class ReatailerSelectView extends StatelessWidget {
  const ReatailerSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "RETAILER INDUCTIONS"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButtons(title: "ADD RETAILER",bc_color: AppColors.primaryColor,),
          SizedBox(height: 12,),
          CustomButtons(title: "UPDATE RETAILER",bc_color: AppColors.activeColor,),
          SizedBox(height: 12,),
          CustomButtons(title: "UPDATE ASSOCIATION DEALERS",bc_color: AppColors.blue0094D6Color,),
        ],
      ),
    );
  }
}
