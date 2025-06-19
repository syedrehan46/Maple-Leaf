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
  final bool isremovedFields;
  final bool isShowFields;

  const CustomPorfolio({
    required this.lead,
    this.isremovedFields = false,
    this.isShowFields = false,
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

  final TextEditingController fiveKgPuttyController = TextEditingController();
  final TextEditingController fiveKgTotalController = TextEditingController();

  final TextEditingController twentyKgPuttyController = TextEditingController();
  final TextEditingController twentyKgTotalController = TextEditingController();

  final TextEditingController twentyKgRegularController = TextEditingController();
  final TextEditingController twentyKgRegularTotalController = TextEditingController();

  final TextEditingController twentyKgExpController = TextEditingController();
  final TextEditingController twentyKgExpTotalController = TextEditingController();

  final TextEditingController twentyKgReguController = TextEditingController();
  final TextEditingController twentyKgReguTotalController = TextEditingController();

  final TextEditingController sampleAppliedController = TextEditingController();
  final TextEditingController convertedToSaleController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // 📌 Initialize and assign values from model
    customerNameController = TextEditingController(text: widget.lead.customerName ?? "");
    customerContactNoController = TextEditingController(text: widget.lead.customerPhone ?? "");
    secondPersontypeController = TextEditingController();
    secondPersonNoController = TextEditingController();
    thirdPersonTypeController = TextEditingController();
    thirdPersonNoController = TextEditingController();
    leadFromController = TextEditingController(text: widget.lead.leadFrom ?? "");
    viaController = TextEditingController(text: widget.lead.via ?? "");
    tokenNumberController = TextEditingController();

    sampleAppliedController.text = widget.lead.sampleApplied ?? "YES";
    convertedToSaleController.text = widget.lead.convertedToSale ?? "YES";

    fiveKgPuttyController.text = widget.lead.noOfBags5Kg?.toString() ?? "0.0";
    fiveKgTotalController.text = widget.lead.total5Kgs?.toString() ?? "0.0";

    twentyKgPuttyController.text = widget.lead.noOfBags20Kg?.toString() ?? "0.0";
    twentyKgTotalController.text = widget.lead.total20Kgs?.toString() ?? "0.0";

    twentyKgRegularController.text = widget.lead.noOfBags20KgRepaint?.toString() ?? "0.0";
    twentyKgRegularTotalController.text = widget.lead.total20KgRepaint?.toString() ?? "0.0";

    twentyKgExpController.text = widget.lead.noOfBags20KgExtPutty?.toString() ?? "0.0";
    twentyKgExpTotalController.text = widget.lead.total20KgExtPutty?.toString() ?? "0.0";

    twentyKgReguController.text = widget.lead.noOfBags20KgSkimCoat?.toString() ?? "0.0";
    twentyKgReguTotalController.text = widget.lead.total20KgSkimCoat?.toString() ?? "0.0";

    // 🔁 Add listeners to keep total KGs updated when bag count changes
    fiveKgPuttyController.addListener(() => _updateKgTotal(fiveKgPuttyController, fiveKgTotalController, 5));
    twentyKgPuttyController.addListener(() => _updateKgTotal(twentyKgPuttyController, twentyKgTotalController, 20));
    twentyKgRegularController.addListener(() => _updateKgTotal(twentyKgRegularController, twentyKgRegularTotalController, 20));
    twentyKgExpController.addListener(() => _updateKgTotal(twentyKgExpController, twentyKgExpTotalController, 20));
    twentyKgReguController.addListener(() => _updateKgTotal(twentyKgReguController, twentyKgReguTotalController, 20));
  }

  void _updateKgTotal(TextEditingController bagsController, TextEditingController kgController, int multiplier) {
    int bags = int.tryParse(bagsController.text) ?? 0;
    kgController.text = (bags * multiplier).toStringAsFixed(1);
  }

  @override
  void dispose() {
    fiveKgPuttyController.dispose();
    fiveKgTotalController.dispose();
    twentyKgPuttyController.dispose();
    twentyKgTotalController.dispose();
    twentyKgRegularController.dispose();
    twentyKgRegularTotalController.dispose();
    twentyKgExpController.dispose();
    twentyKgExpTotalController.dispose();
    twentyKgReguController.dispose();
    twentyKgReguTotalController.dispose();
    sampleAppliedController.dispose();
    convertedToSaleController.dispose();
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
    if (controller.selectedthirdTypePerson.isEmpty ||
        controller.selectedthirdTypePerson == "Please Select Third Person Type") {
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
    if (controller.selectedSampleApplied.isEmpty ||
        controller.selectedSampleApplied == "Please Select Sample Applied") {
      CustomToast('Please Select Sample Applied', context: context);
      return false;
    }
    if (controller.selectedConvertedToSale.isEmpty ||
        controller.selectedConvertedToSale == "Please Select Converted To Sale") {
      CustomToast('Please Select Converted To Sale', context: context);
      return false;
    }
    if (controller.selectedProjectToSale.isEmpty ||
        controller.selectedProjectToSale == "Please Select Project Stage") {
      CustomToast('Please Select Project Stage', context: context);
      return false;
    }
    if (controller.selectedPainterObliged.isEmpty ||
        controller.selectedPainterObliged == "Please Select Painter Obliged") {
      CustomToast('Please Select Painter Obliged', context: context);
      return false;
    }
    return true;
  }

  Widget _buildTextfield(String title, TextEditingController controller,
      {bool isNumber = false, bool readOnly = false}) {
    return CustomTextFieldS(
      title: title,
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      readOnly: readOnly,
      isAddborder: true,
    );
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
            CustomTextFieldS(controller: customerNameController, title: "Customer Name and Address", isAddborder: true),
            CustomTextFieldS(controller: customerContactNoController, title: "Customer Contact No", keyboardType: TextInputType.number, isAddborder: true),
            CustomTextFieldS(controller: secondPersontypeController, title: "Second Person Type", isAddborder: true),
            CustomTextFieldS(controller: secondPersonNoController, title: "Second Person Number", keyboardType: TextInputType.number, isAddborder: true),
            CustomTextFieldS(controller: thirdPersonTypeController, title: "Third Person Type", readOnly: true, isAddborder: true),
            CustomTextFieldS(controller: thirdPersonNoController, title: "Third Person Number", keyboardType: TextInputType.number, isAddborder: true),
            CustomTextFieldS(controller: leadFromController, title: "Lead From", isAddborder: true),
            CustomTextFieldS(controller: viaController, title: "Via", isAddborder: true),
            const SizedBox(height: 6),

            if (!widget.isremovedFields)
              Column(
                children: [
                  CustomDropdownField(
                    label: 'Second Person Type',
                    selectedValue: controller.selectedSecondTypePerson,
                    items: controller.secondTypePersonList,
                    parentContext: context,
                  ),
                  const SizedBox(height: 6),
                  CustomDropdownField(
                    label: 'Third Person Type',
                    selectedValue: controller.selectedthirdTypePerson,
                    items: controller.thirdTypePersonList,
                    parentContext: context,
                  ),
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
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text("Painter Token Provided", style: AppFonts.styleHarmoniaBold14W600(AppColors.lightOrange)),
                        ),
                        const SizedBox(width: 10),
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
                                const SizedBox(width: 6),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  if (selectedValue == "YES")
                    CustomTextFieldS(
                      isAddborder: true,
                      controller: tokenNumberController,
                      title: "* Enter Token Number",
                      readOnly: false,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),
                  const SizedBox(height: 6),
                  CustomDropdownField(label: 'Sample Applied', selectedValue: controller.selectedSampleApplied, items: controller.selectedSampledList, parentContext: context),
                  const SizedBox(height: 6),
                  CustomDropdownField(label: 'Converted To Sale', selectedValue: controller.selectedConvertedToSale, items: controller.selectedConvertedToSaleList, parentContext: context),
                  const SizedBox(height: 6),
                  CustomDropdownField(label: 'Project Stage', selectedValue: controller.selectedProjectToSale, items: controller.selectedProjectToSaleList, parentContext: context),
                  const SizedBox(height: 6),
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

            if (widget.isShowFields)
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: _buildTextfield("Sample Applied", sampleAppliedController)),
                      const SizedBox(width: 6),
                      Expanded(child: _buildTextfield("Converted To Sale", convertedToSaleController, readOnly: true)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildTextfield("No of Bags 5 KG Putty", fiveKgPuttyController)),
                      const SizedBox(width: 6),
                      Expanded(child: _buildTextfield("KG'S", fiveKgTotalController, readOnly: true)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildTextfield("No of Bags 20 KG Putty", twentyKgPuttyController)),
                      const SizedBox(width: 6),
                      Expanded(child: _buildTextfield("KG'S", twentyKgTotalController, readOnly: true)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildTextfield("No of Bags 20 KG Regular", twentyKgRegularController)),
                      const SizedBox(width: 6),
                      Expanded(child: _buildTextfield("KG'S", twentyKgRegularTotalController, readOnly: true)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildTextfield("No of Bags 20 KG EXP...", twentyKgExpController)),
                      const SizedBox(width: 6),
                      Expanded(child: _buildTextfield("KG'S", twentyKgExpTotalController, readOnly: true)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildTextfield("No of Bags 20 KG Regu...", twentyKgReguController)),
                      const SizedBox(width: 6),
                      Expanded(child: _buildTextfield("KG'S", twentyKgReguTotalController, readOnly: true)),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
