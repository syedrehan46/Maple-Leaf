import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/job_controller.dart';
import 'package:mapleleaf/view/Dealers/custom_button1.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../Dealer Induction/Add Dealer/custom_datepicker_button.dart';
import '../Job Detail/custom_dropdown_view.dart';
import '../Job Detail/custom_textfiledd.dart';

class RetailerCustomDesign extends StatefulWidget {
  final bool isShowZone;
  final bool isShowContainer;
  const RetailerCustomDesign({super.key,this.isShowZone=false,this.isShowContainer=false});

  @override
  State<RetailerCustomDesign> createState() => _AddRetailerViewState();
}

class _AddRetailerViewState extends State<RetailerCustomDesign> {
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController personNameController = TextEditingController();
  final TextEditingController cnicNumberController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phone1Controller = TextEditingController();
  final TextEditingController phone2Controller = TextEditingController();
  final TextEditingController wallPuttyCapacityController = TextEditingController();
  final TextEditingController wallCoatCapacityController = TextEditingController();
  final TextEditingController whiteCapacityController = TextEditingController();
  final TextEditingController kgController = TextEditingController();
  final TextEditingController tonController = TextEditingController();


  @override
  void dispose() {
    shopNameController.dispose();
    personNameController.dispose();
    cnicNumberController.dispose();
    dobController.dispose();
    emailController.dispose();
    phone1Controller.dispose();
    phone2Controller.dispose();
    wallPuttyCapacityController.dispose();
    wallCoatCapacityController.dispose();
    whiteCapacityController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final MyController controller = Get.put(MyController());
    final media = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDropdownField(
          label: '* City',
          selectedValue: controller.selectCity,
          items: controller.selectCityList,
          parentContext: context,
        ),
        const SizedBox(height: 12),
        CustomDropdownField(
          label: '* Dealer',
          selectedValue: controller.selectDealerrType,
          items: controller.selectDealerList,
          parentContext: context,
        ),
        const SizedBox(height: 12),
        if (widget.isShowZone)
          CustomDropdownField(
            label: '* Zone',
            selectedValue: controller.selectZone,
            items: controller.selectZoneList,
            parentContext: context,
          ),
        if (widget.isShowContainer)
          Container(
            height: 80,
            width: media.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.grey9E9EA2Color,
            ),
            child: Center(
              child: Text(
                "Sales Target",
                style: AppFonts.styleHarmoniaBold16W600(AppColors.primaryColor),
              ),
            ),
          ),
        const SizedBox(height: 12),
        CustomTextFieldS(
          controller: shopNameController,
          title: "Shop Name",
          readOnly: false,
        ),
        const SizedBox(height: 12),
        CustomTextFieldS(
          controller: personNameController,
          title: "Person Name",
          readOnly: false,
        ),
        const SizedBox(height: 12),
        CustomTextFieldS(
          title: "Enter CNIC (35020223239872)",
          controller: cnicNumberController,
          readOnly: false,
          keyboardType: TextInputType.number,
          maxLength: 13,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CustomTextFieldS(
                title: "Select Date Of Birth",
                controller: dobController,
                readOnly: true,
              ),
            ),
            const SizedBox(width: 12),
            CustomDatePickerButton(
              title: "DOB",
              controller: dobController,
            ),
          ],
        ),
        const SizedBox(height: 12),
        CustomTextFieldS(
          title: "Enter Adress",
          controller: emailController,
          readOnly: false,
          maxLength: 255,
        ),
        const SizedBox(height: 12),
        CustomTextFieldS(
          title: "Enter Phone 1",
          controller: phone1Controller,
          readOnly: false,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),
        CustomTextFieldS(
          title: "Enter Phone 2",
          controller: phone2Controller,
          readOnly: false,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              flex: 9,
              child: CustomTextFieldS(
                title: "WallPutty Capacity",
                controller: wallPuttyCapacityController,
                readOnly: false,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: CustomTextFieldS(
                title: "KG",
                controller: kgController,
                readOnly: true,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 9,
              child: CustomTextFieldS(
                title: "Wallcoat Capacity",
                controller: wallCoatCapacityController,
                readOnly: false,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: CustomTextFieldS(
                title: "KG",
                controller: kgController,
                readOnly: true,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 9,
              child: CustomTextFieldS(
                title: "White Capacity",
                controller: whiteCapacityController,
                readOnly: false,
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 3,
              child: CustomTextFieldS(
                title: "TON",
                controller: tonController,
                readOnly: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        CustomButtons(title: "SUBMIT", padding: 6),
      ],
    );
  }

}
