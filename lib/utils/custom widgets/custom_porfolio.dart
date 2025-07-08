import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/auth_controller.dart';
import 'package:mapleleaf/model/LM/Lead%20Converted/lead_converted_model.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_image_picker.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Job%20Detail/custom_confirmation.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Job%20Detail/custom_textfiledd.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Job%20Detail/custom_toast.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Job%20Detail/job_controller.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/custom_button1.dart';
import '../../controller/LM/lead_generated_controller.dart';
import '../../view/Maple Lead/Dealers/Cash Management/custom_image_picker.dart';
import 'calender.dart';
import 'custom_dropdown1.dart';
import 'custom_textfiled.dart';

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
  File? selectedImage;
  final MyController controller = Get.put(MyController());
  final controllers = Get.find<LeadGeneratedController>();
  final authController = Get.find<AuthController>();


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
  final TextEditingController controllerFiveKgBags = TextEditingController();
  final TextEditingController controllerFiveKgTotal = TextEditingController();

  // 20 KG Putty
  final TextEditingController controllerTwentyKgBags = TextEditingController();
  final TextEditingController controllerTwentyKgTotal = TextEditingController();

  // 20 KG Regular
  final TextEditingController controllerRegularBags = TextEditingController();
  final TextEditingController controllerRegularTotal = TextEditingController();

  // 20 KG EXP
  final TextEditingController controllerExpBags = TextEditingController();
  final TextEditingController controllerExpTotal = TextEditingController();

  // 20 KG Regu
  final TextEditingController controllerReguBags = TextEditingController();
  final TextEditingController controllerReguTotal = TextEditingController();
  final TextEditingController showDateController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  @override
  void initState() {
    super.initState();
    customerNameController = TextEditingController(text: widget.lead.customerName ?? "");
    customerContactNoController = TextEditingController(text: widget.lead.customerPhone ?? "");
    secondPersontypeController = TextEditingController(text: "PAINTER");
    secondPersonNoController = TextEditingController(text: "03214338421");
    thirdPersonTypeController = TextEditingController(text: "ATTENDANT");
    thirdPersonNoController = TextEditingController(text: "03214758980");
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

    fiveKgPuttyController.addListener(() => _updateKgTotal(fiveKgPuttyController, fiveKgTotalController, 5));
    twentyKgPuttyController.addListener(() => _updateKgTotal(twentyKgPuttyController, twentyKgTotalController, 20));
    twentyKgRegularController.addListener(() => _updateKgTotal(twentyKgRegularController, twentyKgRegularTotalController, 20));
    twentyKgExpController.addListener(() => _updateKgTotal(twentyKgExpController, twentyKgExpTotalController, 20));
    twentyKgReguController.addListener(() => _updateKgTotal(twentyKgReguController, twentyKgReguTotalController, 20));
    controllerFiveKgBags.addListener(() => _updateKgTotal(controllerFiveKgBags, controllerFiveKgTotal, 5));
    controllerTwentyKgBags.addListener(() => _updateKgTotal(controllerTwentyKgBags, controllerTwentyKgTotal, 20));
    controllerRegularBags.addListener(() => _updateKgTotal(controllerRegularBags, controllerRegularTotal, 20));
    controllerExpBags.addListener(() => _updateKgTotal(controllerExpBags, controllerExpTotal, 20));
    controllerReguBags.addListener(() => _updateKgTotal(controllerReguBags, controllerReguTotal, 20));
  }

  void _updateKgTotal(TextEditingController bagsController, TextEditingController kgController, int multiplier) {
    int bags = int.tryParse(bagsController.text) ?? 0;
    kgController.text = (bags * multiplier).toStringAsFixed(1);
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
            CustomTextFieldS(
                controller: customerNameController,
                title: "Customer Name and Address",
                isAddborder: true,
                readOnly: false),
            const SizedBox(height: 10),
            CustomTextFieldS(
                controller: customerContactNoController,
                title: "Customer Contact No",
                keyboardType: TextInputType.number,
                isAddborder: true,
                readOnly: false),
            const SizedBox(height: 10),
            CustomTextFieldS(
                controller: secondPersontypeController,
                title: "Second Person Type",
                isAddborder: true),
            const SizedBox(height: 10),
            CustomTextFieldS(
                controller: secondPersonNoController,
                title: "Second Person Number",
                keyboardType: TextInputType.number,
                isAddborder: true,
                readOnly: false),
            const SizedBox(height: 10),
            CustomTextFieldS(
                controller: thirdPersonTypeController,
                title: "Third Person Type",
                readOnly: true,
                isAddborder: true),
            const SizedBox(height: 10),
            CustomTextFieldS(
                controller: thirdPersonNoController,
                title: "Third Person Number",
                keyboardType: TextInputType.number,
                isAddborder: true),
            const SizedBox(height: 10),
            CustomTextFieldS(
                controller: leadFromController,
                title: "Lead From",
                isAddborder: true),
            const SizedBox(height: 10),
            CustomTextFieldS(
                controller: viaController,
                title: "Via",
                isAddborder: true,
                readOnly: false),
            const SizedBox(height: 6),

            if (!widget.isremovedFields)
              Column(
                children: [
                  CustomDropdown1(
                    label: 'Second Person Type',
                    items: controller.secondTypePersonList,
                    selectedValue: controller.selectedSecondTypePerson,
                    parentContext: context,
                    width: double.infinity,
                    height: 80,
                    titleColor: AppColors.lightOrange,
                    ontap: () {},
                  ),
                  const SizedBox(height: 12),
                  CustomDropdown1(
                    label: 'Third Person Type',
                    items: controller.thirdTypePersonList,
                    selectedValue: controller.selectedthirdTypePerson,
                    parentContext: context,
                    width: double.infinity,
                    height: 80,
                    titleColor: AppColors.lightOrange,
                    ontap: () {},
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  CustomButtons(
                    height: 0.05,
                    bc_color: AppColors.primaryColor,
                    padding: 0,
                    title: "UPDATE INFORMATION",
                    onPressed: () {
                      controllers.updateGeneralCustomer(
                        generalCustomerId: widget.lead.generalCustomerId?.toString() ?? "",
                        customerName: customerNameController.toString()?? "",
                        phone: customerContactNoController.toString()?? "",
                        painterNumber: widget.lead.painterName ?? "",                  // might be null
                        walletNumber: widget.lead.cardNumber ?? "",                    // might be null
                        newPainterNumber: widget.lead.painterId?.toString() ?? "",     // might be null
                        updatedBy: widget.lead.salesForceId ?? "",                                 // static or from auth/session
                        winningDateOfSTW: "",                                   // not available, pass empty
                        dateOfMktLead: widget.lead.leadCreationDate ?? "",             // present
                        retailerId: widget.lead.retailerId?.toString() ?? "",          // might be null
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  /// Painter Token Provided
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
                          child: Text(
                            "Painter Token Provided",
                            style: AppFonts.styleHarmoniaBold14W600(AppColors.lightOrange),
                          ),
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
                  const SizedBox(height: 10),
                  if (selectedValue == "YES")
                    CustomTextFieldS(
                      isAddborder: true,
                      controller: tokenNumberController,
                      title: "* Enter Token Number",
                      readOnly: false,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                    ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  /// Dropdowns
                  CustomDropdown1(
                    label: '* Sample Applied ',
                    items: controller.selectedSampledList,
                    selectedValue: controller.selectedSampleApplied,
                    parentContext: context,
                    width: double.infinity,
                    height: 80,
                    titleColor: AppColors.lightOrange,
                    ontap: () {},
                  ),
                  const SizedBox(height: 12),
                  CustomDropdown1(
                    label: '* Converted To Sale',
                    items: controller.selectedConvertedToSaleList,
                    selectedValue: controller.selectedConvertedToSale,
                    parentContext: context,
                    width: double.infinity,
                    height: 80,
                    titleColor: AppColors.lightOrange,
                    ontap: () {},
                  ),
                  const SizedBox(height: 12),
                  CustomDropdown1(
                    label: '*  Project Stage',
                    items: controller.selectedProjectToSaleList,
                    selectedValue: controller.selectedProjectToSale,
                    parentContext: context,
                    width: double.infinity,
                    height: 80,
                    titleColor: AppColors.lightOrange,
                    ontap: () {},
                  ),
                  const SizedBox(height: 12),
                  CustomDropdown1(
                    label: '* Painter Obliged',
                    items: controller.selectedPainterObligedList,
                    selectedValue: controller.selectedPainterObliged,
                    parentContext: context,
                    width: double.infinity,
                    height: 80,
                    titleColor: AppColors.lightOrange,
                    ontap: () {},
                  ),
                  const SizedBox(height: 12),

                  /// Number Fields Section
                  Obx(() {
                    if (controller.selectedConvertedToSale.value == "YES") {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: CustomNumberInputField(
                                  controller: controllerFiveKgBags,
                                  hintText: "No of Bags 5 KG Putty",
                                  readonly: false,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: CustomNumberInputField(
                                  controller: controllerFiveKgTotal,
                                  hintText: "KG'S:",
                                  readonly: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomNumberInputField(
                                  controller: controllerTwentyKgBags,
                                  hintText: "No of Bags 20 KG Putty",
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: CustomNumberInputField(
                                  controller: controllerTwentyKgTotal,
                                  hintText: "KG'S:",
                                  readonly: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomNumberInputField(
                                  controller: controllerRegularBags,
                                  hintText: "No of Bags 20 KG Regular",
                                  readonly: false,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: CustomNumberInputField(
                                  controller: controllerRegularTotal,
                                  hintText: "KG'S:",
                                  readonly: false,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomNumberInputField(
                                  controller: controllerExpBags,
                                  hintText: "No of Bags 20 KG EXP...",
                                  readonly: false,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: CustomNumberInputField(
                                  controller: controllerExpTotal,
                                  hintText: "KG'S:",
                                  readonly: true,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: CustomNumberInputField(
                                  controller: controllerReguBags,
                                  hintText: "No of Bags 20 KG Regu...",
                                  readonly: false,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: CustomNumberInputField(
                                  controller: controllerReguTotal,
                                  hintText: "KG'S:",
                                  readonly: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox(); // Hide block when not selected "YES"
                    }
                  }),

                  const SizedBox(height: 12),
                  Obx(() {
                    if (controller.selectedConvertedToSale.value == "IN PROCESS") {
                      return Row(
                        children: [
                          Expanded(
                            child: CustomNumberInputField(
                              controller: showDateController,
                              hintText: "Select Plan Date Visit",
                              readonly: true,
                            ),
                          ),
                          IntrinsicWidth(
                            child: ElevatedButton(
                              onPressed: () {
                                showCustomDatePicker(
                                  context: context,
                                  onDateSelected: (selectedDate) {
                                    final formattedDate = _formatFullDate(selectedDate);
                                    showDateController.text = formattedDate;
                                  },
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.activeColor,
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                visualDensity: VisualDensity.compact,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                minimumSize: Size.zero,
                              ),
                              child: Text(
                                "* Visit Date",
                                style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox(); // Empty widget if condition is not met
                    }
                  }),

                  Obx(() {
                    if (controller.selectedConvertedToSale.value == "YES" || controller.selectedConvertedToSale.value == "NO") {
                      return CustomNumberInputField(
                        controller: remarksController,
                        hintText: "Enter Remarks",
                        keyboardType: TextInputType.text,
                      );
                    } else {
                      return const SizedBox(); // hide when "YES"
                    }
                  }),

                  /// Image Upload Section
                  const SizedBox(height: 12),

                  Obx(() {
                    final isSampleAppliedYes = controller.selectedSampleApplied.value == "YES";
                    final convertedToSale = controller.selectedConvertedToSale.value;
                    final isConvertedValid = convertedToSale == "YES" || convertedToSale == "NO" || convertedToSale == "IN PROCESS";

                    if (isSampleAppliedYes || isConvertedValid) {
                      return Column(
                        children: [
                          Text(
                            "Please ensure sample picture will be shown\nalong painter with uniform",
                            style: AppFonts.styleHarmoniaBold14W600(Colors.black)
                                .copyWith(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          ImagePickerRow(
                            height: 75,
                            width: 75,
                            isShowGallery: false,
                            onImageSelected: (File imageFile) {
                              setState(() {
                                selectedImage = imageFile;
                              });
                            },
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox(); // don't show anything if condition not met
                    }
                  }),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  CustomButtons(
                    bc_color: AppColors.primaryColor,
                    height: 0.05,
                    padding: 0,
                    title: "PROCEED FEEDBACK",
    onPressed: () async {
    if (feedbackProceed(context)) {
    // 🚀 Call the POST method here after validation
    await controllers.leadFeedBackAndIntimationD2CUpdated(
    generalCustomerId: widget.lead.generalCustomerId?.toString() ?? "",
    createdBy: authController.salesForceId ?? "",
    salesForceId: widget.lead.salesForceId ?? "",
    convertedToSale: controller.selectedConvertedToSale.value,
    sampleApplied: controller.selectedSampleApplied.value,
    remarks: remarksController.text.trim(),
    assignToSalesForceId: widget.lead.salesForceId ?? "",
    createdBySalesForceId: widget.lead.salesForceId ?? "",
    tokenNumber: selectedValue == "YES" ? tokenNumberController.text.trim() : "",
    noOfBags5Kg: controllerFiveKgBags.text.trim(),
    noOfBags20Kg: controllerTwentyKgBags.text.trim(),
    sampleAppliedStatus: controller.selectedSampleApplied.value,
    nextPlannedVisitDate: controller.selectedConvertedToSale.value == "IN PROCESS"
    ? showDateController.text.trim()
        : "",
    giftId: "", // If giftId is not used, leave it empty
    deliveredYesNo: "NO", // You can make this dynamic based on your UI logic
    projectStage: controller.selectedProjectToSale.value,
    jobId: "",
    laborPainterType: controller.selectedSecondTypePerson.value,
    lpName: secondPersontypeController.text.trim(),
    lpPhoneNumber: secondPersonNoController.text.trim(),
    permanentContractual: controller.selectedthirdTypePerson.value,
    );
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
    // Optionally show confirmation
    // Get.dialog(
    // ConfirmationPopup(label: "FEED BACK"),
    // barrierDismissible: false,
    // );
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

    bool updateInformation() {
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

  bool feedbackProceed(BuildContext context) {
    if (selectedValue == "YES" && tokenNumberController.text.trim().isEmpty) {
      CustomToast('Please Enter Token Number', context: context);
      return false;
    }

    if (controller.selectedSampleApplied.value.isEmpty) {
      CustomToast("Please select Sample Applied", context: context);
      return false;
    }

    if (controller.selectedConvertedToSale.value.isEmpty) {
      CustomToast("Please select Converted To Sale", context: context);
      return false;
    }

    if (controller.selectedProjectToSale.value.isEmpty) {
      CustomToast("Please select Project Stage", context: context);
      return false;
    }

    if (controller.selectedPainterObliged.value.isEmpty) {
      CustomToast("Please select Painter Obliged", context: context);
      return false;
    }

    // ⛳ Validation when Converted To Sale == "YES"
    if (controller.selectedConvertedToSale.value == "YES") {
      if (controllerFiveKgBags.text.trim().isEmpty) {
        CustomToast("Please enter No of Bags 5 KG Putty", context: context);
        return false;
      }
      if (controllerTwentyKgBags.text.trim().isEmpty) {
        CustomToast("Please enter No of Bags 20 KG Putty", context: context);
        return false;
      }
      if (controllerRegularBags.text.trim().isEmpty) {
        CustomToast("Please enter No of Bags 20 KG Regular", context: context);
        return false;
      }
      if (controllerExpBags.text.trim().isEmpty) {
        CustomToast("Please enter No of Bags 20 KG EXP...", context: context);
        return false;
      }
      if (controllerReguBags.text.trim().isEmpty) {
        CustomToast("Please enter No of Bags 20 KG Regu...", context: context);
        return false;
      }
    }

    // ✅ Check remarks if Converted to Sale is YES or NO
    if ((controller.selectedConvertedToSale.value == "YES" ||
        controller.selectedConvertedToSale.value == "NO") &&
        remarksController.text.trim().isEmpty) {
      CustomToast("Please enter remarks", context: context);
      return false;
    }

    // ⛳ Validation when Converted To Sale == "IN PROCESS"
    if (controller.selectedConvertedToSale.value == "IN PROCESS") {
      if (showDateController.text.trim().isEmpty) {
        CustomToast("Please select Visit Plan Date", context: context);
        return false;
      }
    }

    // ✅ Check image upload
    if (controller.selectedSampleApplied.value == "YES" ||
        controller.selectedConvertedToSale.value == "YES" ||
        controller.selectedConvertedToSale.value == "NO" ||
        controller.selectedConvertedToSale.value == "IN PROCESS") {
      if (selectedImage == null) {
        CustomToast("Please upload the sample picture", context: context);
        return false;
      }
    }

    return true;
  }

  Widget _buildTextfield(String title, TextEditingController controller, {bool isNumber = false, bool readOnly = false}) {
    return CustomTextFieldS(
      title: title,
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      readOnly: readOnly,
      isAddborder: true,
    );
  }

  String _formatFullDate(DateTime date) {
    const months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    final day = date.day.toString().padLeft(2, '0'); // Ensures leading 0
    final month = months[date.month];
    final year = date.year;
    return '$day-$month-$year';
  }
}