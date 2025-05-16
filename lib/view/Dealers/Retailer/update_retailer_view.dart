import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/job_controller.dart';
import 'package:mapleleaf/view/Dealers/Retailer/retailer_custom_design.dart';
import 'package:mapleleaf/view/Dealers/custom_button1.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../Dealer Induction/Add Dealer/custom_datepicker_button.dart';
import '../Job Detail/custom_dropdown_view.dart';
import '../Job Detail/custom_textfiledd.dart';

class UpdateRetailerView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("UPDATE RETAILER",style: AppFonts.styleHarmoniaBold18W600()),backgroundColor: AppColors.primaryColor,),
      body:SafeArea(child:  SingleChildScrollView(
        child: Column(
          children: [
            RetailerCustomDesign(isShowContainer: true,)
          ],
        ),
      ),)
    );

  }
}
