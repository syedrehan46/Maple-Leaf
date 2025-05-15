import 'package:flutter/material.dart';
import 'package:mapleleaf/view/Dealers/Dealer%20Induction/Add%20Dealer/custom_dealer.dart';
import 'package:mapleleaf/view/Dealers/dealer_custom_design.dart';

class AddDealerView extends StatelessWidget {
  const AddDealerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DealerDesign()
        ],
      ),
    );
  }
}
