import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';

import '../Custom Widgets/custom_apbar_view.dart';
import 'dealer_orders_view.dart';
import 'distribute_intake_view.dart';

class IntakeSelectView extends StatelessWidget {
  const IntakeSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "ORDER INTAKE"),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Center vertically
          children: [
            CustomButton1(
              text: "DEALER ORDER",
              onPressed: () {
                Get.to(DealerOrdersView());
              },
            ),
            const SizedBox(height: 20), // Add spacing between buttons
            CustomButton1(
              text: "DISTRIBUTE INTAKE",
              onPressed: () {
                Get.to(DistributeIntakeView());
              },
            ),

          ],
        ),
      ),
    );
  }
}
