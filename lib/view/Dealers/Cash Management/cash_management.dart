import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/view/Dealers/Cash%20Management/custom_image_picker.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/job_controller.dart';
import 'package:mapleleaf/view/Dealers/custom_button1.dart';
import '../../../utils/custom widgets/Custom_Toaste.dart';
import '../Dealer Induction/Add Dealer/custom_datepicker_button.dart';
import '../Job Detail/custom_dropdown_view.dart';
import '../Job Detail/custom_textfiledd.dart';
import '../Job Detail/custom_toast.dart';

class CashManagement extends StatefulWidget {
  const CashManagement({super.key});

  @override
  State<CashManagement> createState() => _CashManagementState();
}

class _CashManagementState extends State<CashManagement> {
  final MyController controller = Get.put(MyController());
  String iconPath="assets/images/ic_launcher.png";

  final bankNameController = TextEditingController();
  final bankBranchController = TextEditingController();
  final receiptNumberController = TextEditingController();
  final amountController = TextEditingController();
  final dobController = TextEditingController();
  File? _selectedImage;


  @override
  void dispose() {
    bankNameController.dispose();
    bankBranchController.dispose();
    receiptNumberController.dispose();
    amountController.dispose();
    dobController.dispose();
    super.dispose();
  }

  void handleSubmit() {
    print('Submit Pressed');

    if (controller.selectCity=='' || controller.selectCity=='Please select City') {
      CustomToast('Please select City',context: context);
      return;
    }

    if (controller.selectDealerrType == '' ||controller.selectDealerrType == 'Please select Dealer' ) {
      CustomToast('Please select Dealer',context: context);
      return;
    }

    if (controller.selectRecieptType=='' || controller.selectRecieptType == 'Please select Receipt Type') {
      CustomToastText('Please select Receipt Type',context: context);
      return;
    }

    if (controller.selectMinor=='' ||controller.selectMinor=='Please select Minor' ) {
      CustomToastText('Please select Minor',context: context);
      return;
    }

    if (bankNameController.text.trim().isEmpty) {
      CustomToastText('Please enter Bank Name',context: context);
      return;
    }

    if (bankBranchController.text.trim().isEmpty) {
      CustomToastText('Please enter Bank Branch',context: context);
      return;
    }

    if (receiptNumberController.text.trim().isEmpty) {
      CustomToastText('Please enter Receipt Number',context: context);
      return;
    }

    if (amountController.text.trim().isEmpty) {
      CustomToastText('Please enter Amount',context: context);
      return;
    }

    if (dobController.text.trim().isEmpty) {
      CustomToastText('Please select Date',context: context);
      return;
    }

    // You can add the image check here if needed

    CustomToastText("Form Submitted Successfully",context: context);
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "Cash Management",
          style: AppFonts.styleHarmoniaBold18W600(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),

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

              CustomDropdownField(
                label: '* Reciept Type',
                selectedValue: controller.selectRecieptType,
                items: controller.selectRecieptTypeList,
                parentContext: context,
              ),
              const SizedBox(height: 12),

              CustomDropdownField(
                label: '* Minor',
                selectedValue: controller.selectMinor,
                items: controller.selectMinorList,
                parentContext: context,
              ),
              const SizedBox(height: 12),

              CustomTextFieldS(
                title: "Enter Bank Name",
                controller: bankNameController,
                readOnly: false,
                keyboardType: TextInputType.text,
              ),
              CustomTextFieldS(
                title: "Enter Bank Branch",
                controller: bankBranchController,
                readOnly: false,
                keyboardType: TextInputType.text,
              ),
              CustomTextFieldS(
                title: "Enter Reciept Number 2",
                controller: receiptNumberController,
                readOnly: false,
                keyboardType: TextInputType.number,
              ),
              CustomTextFieldS(
                title: "Enter Amount",
                controller: amountController,
                readOnly: false,
                keyboardType: TextInputType.number,
              ),

              Row(
                children: [
                  Expanded(
                    child: CustomTextFieldS(
                      title: "Select lNS DATE",
                      controller: dobController,
                      readOnly: false,
                    ),
                  ),
                  CustomDatePickerButton(
                    title: "SELECT DATE",
                    controller: dobController,
                  ),
                ],
              ),

              SizedBox(height: media.height * 0.08),


              ImagePickerRow(
                onImageSelected: (File image) {
                  setState(() {
                    _selectedImage = image;
                  });
                },
              ),

              SizedBox(height: media.height * 0.12),

              CustomButtons(
                padding: 2,
                bc_color: AppColors.primaryColor,
                title: "SUBMIT",
                onPressed: handleSubmit,
              ),

              SizedBox(height: media.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
