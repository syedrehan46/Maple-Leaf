import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

import '../../utils/custom widgets/custom_appbar.dart';

class GroupManagementView extends StatelessWidget {
  const GroupManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomAppbar(title: 'GROUP MANAGEMENT',timeLocationIsVisible: true,),
    );
  }
}
