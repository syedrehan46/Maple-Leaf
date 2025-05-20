import 'package:flutter/material.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Dealer%20Intake/dealer_intake_custom_design.dart';

import '../Custom Widgets/custom_apbar_view.dart';
class DealerOrdersView extends StatelessWidget {
  const DealerOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:CustomAppBar(title: "ORDER INTAKE"),
    body: SingleChildScrollView(
      child: Column(
        children: [
          DealerIntakeCustomDesign(isShowSubZone:true ,)
        ],
      ),
    ),
      );
  }
}
