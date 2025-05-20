import 'package:flutter/material.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Dealer%20Intake/dealer_intake_custom_design.dart';

import '../Custom Widgets/custom_apbar_view.dart';
class DistributeIntakeView extends StatelessWidget {
  const DistributeIntakeView({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:CustomAppBar(title: "EDIT INTAKE"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              DealerIntakeCustomDesign(isShowOrderType: true,isShowRetailerType: true,)
            ],
          ),
        ),
      );
  }
}
