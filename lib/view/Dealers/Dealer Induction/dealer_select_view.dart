import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/view/Dealers/custom_button1.dart';

class DealerSelectView extends StatelessWidget {
  const DealerSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          title: Text(
            'Dealer INDUCTION',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      body:  Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButtons(bc_color: AppColors.primaryColor, title: "ADD DEALER"),
        SizedBox(height: 16),
        CustomButtons(bc_color: AppColors.primaryColor, title: "UPDATE DEALER"),
      ],
    ),
    ),

    );
  }
}
