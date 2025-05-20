import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import '../custom_button1.dart';
import 'Add Dealer/add_dealer_view.dart';
import 'Update Dealer/update_dealer_view.dart';


class DealerSelectView extends StatelessWidget {
  const DealerSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: const Text(
          'DEALER INDUCTION',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtons(
              bc_color: AppColors.primaryColor,
              title: "ADD DEALER",
              onPressed: () => Get.to(() => const AddDealerView()),
            ),
            const SizedBox(height: 16),
            CustomButtons(
              bc_color: AppColors.primaryColor,
              title: "UPDATE DEALER",
              onPressed: () => Get.to(() => const UpdateDealerView()),
            ),
          ],
        ),
      ),
    );
  }
}


