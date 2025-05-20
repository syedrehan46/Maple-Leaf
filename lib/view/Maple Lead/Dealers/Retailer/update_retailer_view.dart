import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Retailer/retailer_custom_design.dart';
import '../Custom Widgets/custom_apbar_view.dart';
import '../Dealer Induction/Add Dealer/custom_datepicker_button.dart';
import '../Job Detail/custom_dropdown_view.dart';
import '../Job Detail/custom_textfiledd.dart';

class UpdateRetailerView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: CustomAppBar(title: "EDIT RETAILER"),
      body:SafeArea(child:  SingleChildScrollView(
        child: Column(
          children: [
            RetailerCustomDesign(isShowContainer: true,isShowDropdown: true,isShowButton: false,isShowRetailer: true,
              )
          ],
        ),
      ),)
    );

  }
}
