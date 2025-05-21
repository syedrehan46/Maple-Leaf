import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Retailer/add_retailer_view.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Retailer/update_association_dealers.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Retailer/update_retailer_view.dart';

import '../Custom Widgets/custom_apbar_view.dart';
import '../custom_button1.dart';

class ReatailerSelectView extends StatelessWidget {
  const ReatailerSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "RETAILER INDUCTIONS"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton1(text: "ADD RETAILERR", onPressed: (){Get.to(AddRetailerView());}),
            SizedBox(height: 12,),
        CustomButton1(text: "UPDATE RETAILERR",  onPressed: (){Get.to(UpdateRetailerView());}),
            SizedBox(height: 12,),
            CustomButton1(text: "UPDATE ASSOCIATION DEALER",  onPressed: (){Get.to(UpdateAssociationDealers());}),
          ],
        ),
      ),
    );
  }
}
