import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/view/Dealers/custom_button1.dart';

class ReatailerSelectView extends StatelessWidget {
  const ReatailerSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,backgroundColor:AppColors.primaryColor,title: Text("RETAILER INDUCTIONS",style: AppFonts.styleHarmoniaBold18W600()),),
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
