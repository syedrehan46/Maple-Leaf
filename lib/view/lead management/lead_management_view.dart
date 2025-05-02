import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Converted/lead_converted_view.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Generated/lead_generated_view.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Processing/lead_processing_view.dart';

class LeadManagementView extends StatelessWidget {
  const LeadManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    final media=MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover, // Make sure the image covers the entire space
            ),
          ),
          // Main content
          Column(
            children: [
              // App Bar
              CustomAppbar(title: 'LEAD MANAGEMENT'),
              // Buttons
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                     CustomButton(title: "LEAD GENERATED", color: AppColors.blackColor, navigateTo: LeadGeneratedView()),
                      const SizedBox(height: 20),
                      CustomButton(title: "LEAD CONVERTED", color:AppColors.pendingColor , navigateTo: LeadConvertedView()),
                      const SizedBox(height: 20),
                      CustomButton(title: "LEAD PROCESSING", color:AppColors.readyForCollectionColor , navigateTo: LeadProcessingView()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
