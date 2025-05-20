import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_mapping_design.dart';

class MappingView extends StatelessWidget {
  const MappingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MappingCustomDesign(title: "MAPPING"),
    );
  }
}
