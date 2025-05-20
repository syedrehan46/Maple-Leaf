import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_mapping_design.dart';

class ReMappingView extends StatelessWidget {
  const ReMappingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MappingCustomDesign(title: "REMAPPING"),
    );
  }
}
