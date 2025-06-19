import 'package:flutter/material.dart'; // adjust as needed
import 'package:mapleleaf/model/LM/Lead%20Converted/lead_converted_model.dart';
import '../../../../model/LM/Lead Generated/lead_generated_model.dart';
import '../../../../utils/custom widgets/custom_porfolio.dart';

class PorfolioTwoView extends StatelessWidget {
  final LeadConvertedModel lead;
  final bool isremovedFields;
  final bool isShowFields;

  const PorfolioTwoView({Key? key, required this.lead,this.isShowFields=false,this.isremovedFields=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPorfolio(lead: lead), // ✅ works now
    );
  }
}
