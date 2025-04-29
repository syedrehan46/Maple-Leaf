import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Converted/lead_converted_view.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Generated/lead_generated_view.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Processing/lead_processing_view.dart';

class LeadManagementView extends StatelessWidget {
  const LeadManagementView({super.key});

  @override
  Widget build(BuildContext context) {
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor,
                              side: const BorderSide(color: Color(0xff2DA94F), width: 2),
                            ),
                            onPressed: () {
                              Get.to(LeadGeneratedView());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/leaf_ic.png',
                                  height: 30,  // Adjust the size of the image
                                  width: 30,
                                ),
                                const SizedBox(width: 10),  // Space between the image and the text
                                const Text(
                                  "LEAD GENERATED",
                                  style: TextStyle(
                                    color: Color(0xff232323),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor,
                              side: const BorderSide(color: Color(0xff2DA94F), width: 2),
                            ),
                            onPressed: () {
                              Get.to(LeadConvertedView());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/leaf_ic.png',
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "LEAD CONVERTED",
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.whiteColor,
                              side: const BorderSide(color: Color(0xff2DA94F), width: 2),
                            ),
                            onPressed: () {
                              Get.to(LeadProcessingView());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/leaf_ic.png',
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  "LEAD PROCESSING",
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
