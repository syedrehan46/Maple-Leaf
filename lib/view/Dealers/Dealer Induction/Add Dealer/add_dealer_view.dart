import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/view/Dealers/Dealer%20Induction/Add%20Dealer/custom_dealer.dart';
import 'package:mapleleaf/view/Dealers/dealer_custom_design.dart';

class AddDealerView extends StatelessWidget {
  const AddDealerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,color: AppColors.whiteColor,)),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "ADD DEALER",
          style: AppFonts.styleHarmoniaBold18W600(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: DealerDesign(),
        ),
      ),
    );
  }
}
