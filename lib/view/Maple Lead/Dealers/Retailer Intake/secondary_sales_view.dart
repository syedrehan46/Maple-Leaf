import 'package:flutter/material.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Custom%20Widgets/custom_apbar_view.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Retailer%20Intake/customer_retaile_intaker_design.dart';

class SecondarySalesView extends StatelessWidget {
  const SecondarySalesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "RETAILER INTAKE",showBack: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomerRetaileIntakerDesign(isShowPinCodeButton: true,isShowpreviouOrder: true,)
          ],
        ),
      ),
    );
  }
}
