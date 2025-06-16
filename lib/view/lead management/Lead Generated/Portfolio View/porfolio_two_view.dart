import 'package:flutter/material.dart'; // adjust as needed
import '../../../../model/LM/Lead Generated/lead_generated_model.dart';
import '../../../../utils/custom widgets/custom_porfolio.dart';

class PorfolioTwoView extends StatelessWidget {
  final LeadGeneratedModel lead;

  const PorfolioTwoView({Key? key, required this.lead}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPorfolio(lead: lead), // ✅ works now
    );
  }
}
