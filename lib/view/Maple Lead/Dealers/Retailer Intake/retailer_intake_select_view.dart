import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Custom%20Widgets/custom_apbar_view.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Retailer%20Intake/gc_invester_sales_view.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Retailer%20Intake/invester_sales_view.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Retailer%20Intake/secondary_sales_view.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Retailer/reatailer_select_view.dart';

import '../../../../utils/app_colors.dart';

class RetailerIntakeSelectView extends StatelessWidget {
  const RetailerIntakeSelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "SALES",showBack: false,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton1(text: "SECONDARY SALES", onPressed: (){Get.to(SecondarySalesView());}),
            SizedBox(height: 12,),
            CustomButton1(text: "INVESTER SALES", onPressed: (){Get.to(InvesterSalesView());}),
            SizedBox(height: 12,),
            CustomButton1(text: "GC INVESTER SALES", onPressed: (){Get.to(GcInvesterSalesView());}),
          ],
        ),
      ),
    );
  }
}
