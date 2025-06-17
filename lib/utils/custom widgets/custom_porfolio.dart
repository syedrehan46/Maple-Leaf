import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/model/LM/Lead%20Converted/lead_converted_model.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom widgets/custom_dropdownfeild.dart';

import '../../model/LM/Lead Generated/lead_generated_model.dart';
import '../../view/Maple Lead/Dealers/Job Detail/custom_confirmation.dart';
import '../../view/Maple Lead/Dealers/Job Detail/custom_dropdown_view.dart';
import '../../view/Maple Lead/Dealers/Job Detail/custom_textfiledd.dart';
import '../../view/Maple Lead/Dealers/Job Detail/custom_toast.dart';
import '../../view/Maple Lead/Dealers/Job Detail/job_controller.dart';
import '../../view/Maple Lead/Dealers/custom_button1.dart';

class CustomPorfolio extends StatefulWidget {
  final LeadConvertedModel lead;

  const CustomPorfolio({
    required this.lead,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomPorfolio> createState() => _CustomPorfolioState();
}

class _CustomPorfolioState extends State<CustomPorfolio> {
  String selectedValue = "";
  final MyController controller = Get.put(MyController());

  late TextEditingController customerNameController;
  late TextEditingController customerContactNoController;
  late TextEditingController secondPersontypeController;
  late TextEditingController secondPersonNoController;
  late TextEditingController thirdPersonTypeController;
  late TextEditingController thirdPersonNoController;
  late TextEditingController leadFromController;
  late TextEditingController viaController;
  late TextEditingController tokenNumberController;

  @override
  void initState() {
    super.initState();

    customerNameController = TextEditingController(text: widget.lead.customerName ?? "");
    customerContactNoController = TextEditingController(text: widget.lead.customerPhone ?? "");
    secondPersontypeController = TextEditingController(text: "SUB CONTRACTOR");
    secondPersonNoController = TextEditingController(text: "03214546737");
    thirdPersonTypeController = TextEditingController();
    thirdPersonNoController = TextEditingController();
    leadFromController = TextEditingController(text: widget.lead.leadFrom ?? "");
    viaController = TextEditingController(text: widget.lead.via ?? "");
    tokenNumberController = TextEditingController();
  }

  @override
  void dispose() {
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
    if (thirdPersonNoController.text.trim().isEmpty) {
      CustomToast('Please Enter Third Person Number', context: context);
      return false;
    }
    if (controller.selectedSecondTypePerson.isEmpty) {
      CustomToast('Please Select Second Person Type', context: context);
      return false;
    }
    if (controller.selectedthirdTypePerson.isEmpty || controller.selectedthirdTypePerson == "Please Select Third Person Type") {
      CustomToast('Please Select Third Person Type', context: context);
      return false;
    }
    return true;
  }

  bool feedbackProceed() {
    if (selectedValue == "YES" && tokenNumberController.text.trim().isEmpty) {
      CustomToast('Please Enter Token Number', context: context);
      return false;
    }
    if (controller.selectedSampleApplied.isEmpty || controller.selectedSampleApplied == "Please Select Sample Applied") {
      CustomToast('Please Select Sample Applied', context: context);
      return false;
    }
    if (controller.selectedConvertedToSale.isEmpty || controller.selectedConvertedToSale == "Please Select Converted To Sale") {
      CustomToast('Please Select Converted To Sale', context: context);
      return false;
    }
    if (controller.selectedProjectToSale.isEmpty || controller.selectedProjectToSale == "Please Select Project Stage") {
      CustomToast('Please Select Project Stage', context: context);
      return false;
    }
    if (controller.selectedPainterObliged.isEmpty || controller.selectedPainterObliged == "Please Select Painter Obliged") {
      CustomToast('Please Select Painter Obliged', context: context);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, size: 20, color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text("LEAD GENERATION", style: AppFonts.styleHarmoniaBold18W600()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextFieldS(controller: customerNameController, title: "Customer Name and Address",isAddborder: true,),
            CustomTextFieldS(controller: customerContactNoController, title: "Customer Contact No", keyboardType: TextInputType.number,isAddborder: true,),
            CustomTextFieldS(controller: secondPersontypeController, title: "Second Person Type",isAddborder: true),
            CustomTextFieldS(controller: secondPersonNoController, title: "Second Person Number", keyboardType: TextInputType.number,isAddborder: true),
            CustomTextFieldS(controller: thirdPersonTypeController, title: "Third Person Type", readOnly: true,isAddborder: true),
            CustomTextFieldS(controller: thirdPersonNoController, title: "Third Person Number", keyboardType: TextInputType.number,isAddborder: true),
            CustomTextFieldS(controller: leadFromController, title: "Lead From",isAddborder: true),
            CustomTextFieldS(controller: viaController, title: "Via",isAddborder: true),
            SizedBox(height: 6),
            CustomDropdownField(label: 'Second Person Type', selectedValue: controller.selectedSecondTypePerson, items: controller.secondTypePersonList, parentContext: context),
            SizedBox(height: 6),
            CustomDropdownField(label: 'Third Person Type', selectedValue: controller.selectedthirdTypePerson, items: controller.thirdTypePersonList, parentContext: context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            CustomButtons(
              bc_color: AppColors.primaryColor,
              padding: 2,
              title: "UPDATE INFORMATION",
              onPressed: () {
                if (updateInformation()) {
                  Get.dialog(ConfirmationPopup(label: "UPDATE INFORMATION"), barrierDismissible: false);
                }
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0, // 👈 This is correct
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      "Painter Token Provided",
                      style: AppFonts.styleHarmoniaBold14W600(AppColors.lightOrange),
                    ),
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: ["YES", "NO"].map((value) {
                      return Row(
                        children: [
                          Radio<String>(
                            activeColor: AppColors.primaryColor,
                            value: value,
                            groupValue: selectedValue,
                            onChanged: (val) => setState(() => selectedValue = val!),
                          ),
                          Text(value),
                          SizedBox(width: 6),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            if (selectedValue == "YES")
              CustomTextFieldS(
                isAddborder: true,
                controller: tokenNumberController,
                title: "* Enter Token Number",
                readOnly: false,
                keyboardType: TextInputType.number,
                maxLength: 10,
              ),
            SizedBox(height: 6),
            CustomDropdownField(label: 'Sample Applied', selectedValue: controller.selectedSampleApplied, items: controller.selectedSampledList, parentContext: context),
            SizedBox(height: 6),
            CustomDropdownField(label: 'Converted To Sale', selectedValue: controller.selectedConvertedToSale, items: controller.selectedConvertedToSaleList, parentContext: context),
            SizedBox(height: 6),
            CustomDropdownField(label: 'Project Stage', selectedValue: controller.selectedProjectToSale, items: controller.selectedProjectToSaleList, parentContext: context),
            SizedBox(height: 6),
            CustomDropdownField(label: 'Painter Obliged', selectedValue: controller.selectedPainterObliged, items: controller.selectedPainterObligedList, parentContext: context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            CustomButtons(
              bc_color: AppColors.primaryColor,
              padding: 2,
              title: "PROCEED FEEDBACK",
              onPressed: () {
                if (feedbackProceed()) {
                  Get.dialog(ConfirmationPopup(label: "FEED BACK"), barrierDismissible: false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
