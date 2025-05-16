import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/custom_confirmation.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/custom_textfiledd.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/custom_toast.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/job_controller.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/job_view.dart';
import 'package:mapleleaf/view/Dealers/custom_button1.dart';
import 'package:mapleleaf/view/Dealers/custom_textfield.dart';

import 'custom_dropdown_view.dart';

class GeneralCustomerView extends StatefulWidget {

  final String customerNo;
  final String jobName;
  final String via;
  final String createdby;

  const GeneralCustomerView({
    Key? key,
    required this.customerNo,
    required this.jobName,
    required this.via,
    required this.createdby,
  }) : super(key: key);

  @override
  State<GeneralCustomerView> createState() => _GeneralCustomerViewState();
}

class _GeneralCustomerViewState extends State<GeneralCustomerView> {
  String selectedValue="";
  final MyController controller=Get.put(MyController());
  // TextControllers with initial values from parameters
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerContactNoController = TextEditingController();
  final TextEditingController secondPersontypeController = TextEditingController();
  final TextEditingController secondPersonNoController = TextEditingController();
  final TextEditingController thirdPersonTypeController = TextEditingController();
  final TextEditingController thirdPersonNoController = TextEditingController();
  final TextEditingController leadFromController = TextEditingController();
  final TextEditingController viaController = TextEditingController();
  final TextEditingController tokenNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with values passed as parameters (if available)
    customerNameController.text = widget.jobName ?? '';
    customerContactNoController.text = widget.customerNo ?? '';
    viaController.text = widget.via ?? '';
    leadFromController.text = widget.createdby ?? '';
    secondPersonNoController.text = "03214546737";
    secondPersontypeController.text = "SUB CONTRACTOR";
  }


  @override
  void dispose() {
    // Dispose the controllers when no longer needed
    customerNameController.dispose();
    customerContactNoController.dispose();
    secondPersontypeController.dispose();
    secondPersonNoController.dispose();
    thirdPersonTypeController.dispose();
    thirdPersonNoController.dispose();
    leadFromController.dispose();
    viaController.dispose();
    tokenNumberController.dispose();
    super.dispose();
  }
  bool updateInformation() {
    print('Submit Pressed');

    if (thirdPersonNoController.text.trim().isEmpty) {
      CustomToast('Please Enter Third Person Number', context: context);
      return false;
    }
    if (controller.selectedSecondTypePerson == '' || controller.selectedSecondTypePerson == "") {
      CustomToast('Please Select Second Person Type', context: context);
      return false;
    }
    if (controller.selectedthirdTypePerson == '' || controller.selectedthirdTypePerson == "Please Select Third Person Type") {
      CustomToast('Please Select Third Person Type', context: context);
      return false;
    }

    // You can add the image check here if needed

    return true;  // add this return true when validation passes
  }
  bool feedbackProceed() {
    print('Submit Pressed');

    if (selectedValue == "YES" && tokenNumberController.text.trim().isEmpty) {
      CustomToast('Please Enter Token Number', context: context);
      return false;
    }

    if (controller.selectedSampleApplied == '' || controller.selectedSampleApplied == "Please Select Sample Applied") {
      CustomToast('Please Select Sample Applied', context: context);
      return false;
    }
    if (controller.selectedConvertedToSale == '' || controller.selectedConvertedToSale == "Please Select Converted To Sale") {
      CustomToast('Please Select Converted To Sale', context: context);
      return false;
    }
    if (controller.selectedProjectToSale == '' || controller.selectedProjectToSale == "Please Select Project Stage") {
      CustomToast('Please Select Project Stage', context: context);
      return false;
    }
    if (controller.selectedPainterObliged == '' || controller.selectedPainterObliged == "Please Select Painter Obliged") {
      CustomToast('Please Select Painter Obliged', context: context);
      return false;
    }

    // You can add the image check here if needed

    return true;  // add this return true when validation passes
  }

  @override
  Widget build(BuildContext context) {

    List<String>options=["YES","NO"];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20, color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "General Customer",
          style: AppFonts.styleHarmoniaBold18W600(),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextFieldS(
              controller: customerNameController,
              title: "Customer Name and Address",
              readOnly: false,
            ),
            CustomTextFieldS(
              controller: customerContactNoController,
              title: "Customer Contact No",
              keyboardType: TextInputType.number,
              readOnly: false,
            ),
            CustomTextFieldS(
              controller: secondPersontypeController,
              title: "Second Person Type",
            ),
            CustomTextFieldS(
              controller: secondPersonNoController,
              title: "Second Person Number",
              keyboardType: TextInputType.number,
              readOnly: false,
            ),
            CustomTextFieldS(
              controller: thirdPersonTypeController,
              title: "Third Person Type",
              readOnly: true,
            ),
            CustomTextFieldS(
              controller: thirdPersonNoController,
              title: "Third Person Number",
              keyboardType: TextInputType.number,
              readOnly: false,
            ),
            CustomTextFieldS(
              controller: leadFromController,
              title: "Lead From",
            ),
            CustomTextFieldS(
              controller: viaController,
              title: "Via",
            ),
            SizedBox(height: 6,),
            CustomDropdownField(
              label: 'Second Person Type',
              selectedValue: controller.selectedSecondTypePerson,
              items: controller.secondTypePersonList,
              parentContext: context,
            ),
            SizedBox(height: 6),
            CustomDropdownField(
              label: 'Third Person Type',
              selectedValue: controller.selectedthirdTypePerson,
              items: controller.thirdTypePersonList,
              parentContext: context,
            ),
      SizedBox(height: MediaQuery.of(context).size.height*(0.03),),
            CustomButtons(
              bc_color: AppColors.primaryColor,
              title: "UPDATE INFORMATION",
              onPressed: () {
                if (updateInformation()) {
                  Get.dialog(
                    ConfirmationPopup(label: "UPDATE INFORMATION"),
                    barrierDismissible: false,
                  );
                }
              },
            ),




            SizedBox(height: MediaQuery.of(context).size.height*(0.06)),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: AppColors.grey9E9EA2Color,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Painter Token Provided", style: AppFonts.styleHarmoniaBold14W600(Color(0xFFB31D1E))),
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: AppColors.primaryColor,
                            value: "YES",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                          Text("YES"),
                        ],
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Radio(
                            activeColor: AppColors.primaryColor,
                            value: "NO",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                          Text("NO"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6,),
            selectedValue == "YES"
                ? CustomTextFieldS(
              controller: tokenNumberController,
              title: "Enter Token Number",
              readOnly: false,
              keyboardType: TextInputType.number,
              maxLength: 10,
            )
                : SizedBox(), // or Container()

 SizedBox(height: 6,),
            CustomDropdownField(
              label: 'Sample Applied',
              selectedValue: controller.selectedSampleApplied,
              items: controller.selectedSampledList,
              parentContext: context,
            ),
            SizedBox(height: 6),
            CustomDropdownField(
              label: 'Converted To Sale',
              selectedValue: controller.selectedConvertedToSale,
              items: controller.selectedConvertedToSaleList,
              parentContext: context,
            ),
            SizedBox(height: 6),
            CustomDropdownField(
              label: 'Project Stage',
              selectedValue: controller.selectedProjectToSale,
              items: controller.selectedProjectToSaleList,
              parentContext: context,
            ),
            SizedBox(height: 6),
            CustomDropdownField(
              label: 'Painter Obliged',
              selectedValue: controller.selectedPainterObliged,
              items: controller.selectedPainterObligedList,
              parentContext: context,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*(0.03)),
            CustomButtons(
              bc_color: AppColors.primaryColor,
              title: "PROCEED FEEDBACK",
              onPressed: () {
                if(feedbackProceed())
                Get.dialog(
                  ConfirmationPopup(label: "FEED BACK"),
                  barrierDismissible: false, // optional: prevent closing on outside tap
                );
              },

            ),
          ],
        ),
      ),
    );
  }
}
