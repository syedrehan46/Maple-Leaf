import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/LM/lead_converted_controller.dart';
import 'package:mapleleaf/controller/LM/lead_generated_controller.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom widgets/custom_appbar.dart';
import 'package:mapleleaf/view/Maple Lead/Dealers/Job Detail/custom_toast.dart';
import '../../../model/LM/Lead Converted/lead_converted_model.dart';
import '../../../utils/custom widgets/custom_dropdown_for _feedback.dart';
import '../../Maple Lead/Dealers/custom_button1.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class FeedbackScreen extends StatefulWidget {
  final LeadConvertedModel lead;
  final bool isShowDropdown;
  final bool isShowButton;
  final bool isShowPlanType;
  final bool isShowFiveFields;
  final bool moveSalesSectionToBottom;
  final bool moveExpectedKgsBelowRetailer;
  final bool showFollowUpDate;
  final bool showExpectedKgsAfterPlanType;
  final bool isShowShopName;
  final bool isShowexpectedkgsbeforeshopname;
  final bool showExpectedKgsBeforeRetailer;
  final bool showShopNameAfterPlanType;
  final String title;

  const FeedbackScreen({
    Key? key,
    required this.lead,
    this.isShowDropdown = true,
    this.isShowButton = true,
    this.isShowPlanType = false,
    this.isShowFiveFields = true,
    this.moveSalesSectionToBottom = false,
    this.moveExpectedKgsBelowRetailer = false,
    this.showFollowUpDate = false,
    this.showExpectedKgsAfterPlanType = false,
    this.isShowShopName = true,
    this.isShowexpectedkgsbeforeshopname = false,
    this.showExpectedKgsBeforeRetailer = false,
    this.showShopNameAfterPlanType = false,
    this.title = "FEEDBACK",
  }) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final controllers=Get.put(LeadGeneratedController());
  final LeadConvertedController controller =
  Get.isRegistered<LeadConvertedController>()
      ? Get.find<LeadConvertedController>()
      : Get.put(LeadConvertedController());

  final RxString selectRetailer = "Select Retailer".obs;
  final RxString selectProductSold = "Yes".obs; // ✅ Fixed default value

  final TextEditingController painterController = TextEditingController();
  final TextEditingController painterNameController = TextEditingController();
  final TextEditingController customerContactController = TextEditingController();
  final TextEditingController customerNameAddressController = TextEditingController();
  final TextEditingController planTypeController = TextEditingController();
  final TextEditingController siteVisitController = TextEditingController();
  final TextEditingController productSoldController = TextEditingController();
  final TextEditingController sampleController = TextEditingController();
  final TextEditingController convertedToSaleController = TextEditingController();
  final TextEditingController painterConversionController = TextEditingController();
  final TextEditingController specialIncentivesController = TextEditingController();
  final TextEditingController expectedKgsController = TextEditingController();
  final TextEditingController followUpDateController = TextEditingController();
  final TextEditingController shopNameController = TextEditingController();

  final TextEditingController fiveController = TextEditingController();
  final TextEditingController twentyController = TextEditingController();
  final TextEditingController twentyRegController = TextEditingController();
  final TextEditingController twentyExpController = TextEditingController();
  final TextEditingController twentyReguController = TextEditingController();

  final TextEditingController kGSController = TextEditingController();
  final TextEditingController kgstwoController = TextEditingController();
  final TextEditingController kgsthreeController = TextEditingController();
  final TextEditingController kgExpController = TextEditingController();
  final TextEditingController kgReguController = TextEditingController();

  final TextEditingController kgsfourController = TextEditingController();
  final TextEditingController kgsfiveController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _assignLeadDataToControllers();
    fiveController.addListener(() =>
        _updateKgTotal(fiveController, kGSController, 5));
    twentyController.addListener(() =>
        _updateKgTotal(twentyController, kgstwoController, 20));
    twentyRegController.addListener(() =>
        _updateKgTotal(twentyRegController, kgsthreeController, 20));
    twentyExpController.addListener(() =>
        _updateKgTotal(twentyExpController, kgsfiveController, 20));
    twentyReguController.addListener(() =>
        _updateKgTotal(twentyReguController, kgsfourController, 20));
  }

  void _assignLeadDataToControllers() {
    painterController.text = widget.lead.phoneNumber ?? "";
    painterNameController.text = widget.lead.painterName ?? "";
    customerContactController.text = widget.lead.customerPhone ?? "";
    customerNameAddressController.text = widget.lead.customerName ?? "";
    planTypeController.text = widget.lead.engagementPlanType ?? "";
    siteVisitController.text = widget.lead.siteVisit ?? "";
    productSoldController.text = widget.lead.productSold ?? "YES";
    sampleController.text = widget.lead.sampleApplied ?? "";
    convertedToSaleController.text = widget.lead.convertedToSale ?? "";
    painterConversionController.text = widget.lead.painterAutoConversion ?? "";
    specialIncentivesController.text = widget.lead.specialIncentive ?? "";
    expectedKgsController.text = widget.lead.expectedKgs?.toString() ?? "";
    followUpDateController.text = widget.lead.followUpDate ?? "";
    shopNameController.text = widget.lead.retailerName ?? "";

    fiveController.text = widget.lead.noOfBags5Kg?.toString() ?? "";
    twentyController.text = widget.lead.noOfBags20Kg?.toString() ?? "";
    twentyRegController.text =
        widget.lead.noOfBags20KgRepaint?.toString() ?? "";
    twentyExpController.text = "null";
    twentyReguController.text = "null";

    kGSController.text = widget.lead.total5Kgs?.toString() ?? "";
    kgstwoController.text = widget.lead.total20Kgs?.toString() ?? "";
    kgsthreeController.text = widget.lead.total20KgRepaint?.toString() ?? "";

    kgsfourController.text = "null";
    kgsfiveController.text = "null";
  }

  void _updateKgTotal(TextEditingController bagsController,
      TextEditingController kgController, int multiplier) {
    int bags = int.tryParse(bagsController.text) ?? 0;
    kgController.text = (bags * multiplier).toString();
  }

  @override
  void dispose() {
    painterController.dispose();
    painterNameController.dispose();
    customerContactController.dispose();
    customerNameAddressController.dispose();
    planTypeController.dispose();
    siteVisitController.dispose();
    productSoldController.dispose();
    sampleController.dispose();
    convertedToSaleController.dispose();
    painterConversionController.dispose();
    specialIncentivesController.dispose();
    expectedKgsController.dispose();
    followUpDateController.dispose();
    shopNameController.dispose();
    fiveController.dispose();
    twentyController.dispose();
    twentyRegController.dispose();
    twentyExpController.dispose();
    twentyReguController.dispose();
    kGSController.dispose();
    kgstwoController.dispose();
    kgsthreeController.dispose();
    kgExpController.dispose();
    kgReguController.dispose();
    kgsfourController.dispose();
    kgsfiveController.dispose();
    super.dispose();
  }
  bool validateForm() {
    // 🟢 Validate top-most bag field first
    if (fiveController.text.trim().isEmpty) {
      CustomToast("Please enter No of Bags 5 KG Putty", context: context);
      return false;
    }

    if (twentyController.text.trim().isEmpty) {
      CustomToast("Please enter No of Bags 20 KG Putty", context: context);
      return false;
    }

    if (twentyRegController.text.trim().isEmpty) {
      CustomToast("Please enter No of Bags 20 KG Regular", context: context);
      return false;
    }

    if (twentyExpController.text.trim().isEmpty) {
      CustomToast("Please enter No of Bags 20 KG EXP...", context: context);
      return false;
    }

    if (twentyReguController.text.trim().isEmpty) {
      CustomToast("Please enter No of Bags 20 KG Regu...", context: context);
      return false;
    }


    if (selectProductSold.value == "* Product Sold" || selectProductSold.value == "Select Product Sold") {
      CustomToast("Please select Product Sold", context: context);
      return false;
    }

    return true;
  }

  Widget buildSalesInfoFields() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildTextfield(
                "Site Visit", siteVisitController, readOnly: true)),
            const SizedBox(width: 6),
            Expanded(child: _buildTextfield(
                "Product Sold", productSoldController, readOnly: true)),
          ],
        ),
        Row(
          children: [
            Expanded(child: _buildTextfield(
                "Sample Applied", sampleController, readOnly: true)),
            const SizedBox(width: 6),
            Expanded(child: _buildTextfield(
                "Converted To Sale", convertedToSaleController,
                readOnly: true)),
          ],
        ),
        Row(
          children: [
            Expanded(child: _buildTextfield(
                "Painter Conversion", painterConversionController,
                readOnly: true)),
            const SizedBox(width: 6),
            Expanded(child: _buildTextfield(
                "Special Incentives", specialIncentivesController,
                readOnly: true)),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(title: widget.title, timeLocationIsVisible: false),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned.fill(child: Image.asset(
                      "assets/images/menu_bg.png", fit: BoxFit.cover)),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      children: [
                        _buildTextfield(
                            "Painter Phone", painterController, readOnly: true),
                        _buildTextfield("Painter Name", painterNameController,
                            readOnly: true),
                        _buildTextfield(
                            "Customer Contact No", customerContactController,
                            readOnly: true),
                        _buildTextfield("Customer Name and Address",
                            customerNameAddressController, readOnly: true),
                        if (widget.isShowPlanType)
                          _buildTextfield(
                              "Plan Type", planTypeController, readOnly: true),
                        if (widget.showShopNameAfterPlanType)
                          _buildTextfield(
                              "Shop Name", shopNameController, readOnly: true),
                        if (!widget
                            .moveSalesSectionToBottom) buildSalesInfoFields(),
                        if (!widget.moveExpectedKgsBelowRetailer) ...[
                          if (widget.showExpectedKgsAfterPlanType)
                            _buildTextfield(
                                "Expected KGS", expectedKgsController,
                                readOnly: true),
                          if (widget.showFollowUpDate)
                            _buildTextfield("Further Follow-up Date",
                                followUpDateController),
                        ],
                        if (widget.showExpectedKgsBeforeRetailer)
                          _buildTextfield("Expected KGS", expectedKgsController,
                              readOnly: true),
                        if (widget.isShowDropdown)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              children: [
                                Text("* Retailer",style: AppFonts.styleHarmoniaBold16W600(Colors.black),),
                                CustomDropdownFieldWidget(
                                  selectedValue: selectRetailer,
                                  items: controller.retailerList,
                                  parentContext: context,
                                ),
                              ],
                            ),
                          ),
                        if (widget.isShowexpectedkgsbeforeshopname)
                          _buildTextfield("Expected KGS", expectedKgsController,
                              readOnly: true),
                        if (widget.isShowShopName &&
                            !widget.showShopNameAfterPlanType)
                          _buildTextfield(
                              "Shop Name", shopNameController, readOnly: true),
                        if (widget.moveExpectedKgsBelowRetailer) ...[
                          if (widget.showExpectedKgsAfterPlanType)
                            _buildTextfield(
                                "Expected KGS", expectedKgsController,
                                readOnly: true),
                          if (widget.showFollowUpDate)
                            _buildTextfield("Further Follow-up Date",
                                followUpDateController),
                        ],
                        if (widget.isShowFiveFields) ...[
                          Row(
                            children: [
                              Expanded(child: _buildTextfield(
                                  "No of Bags 5 KG Putty", fiveController,
                                  isNumber: true)),
                              const SizedBox(width: 6),
                              Expanded(child: _buildTextfield(
                                  "KG'S", kGSController, readOnly: true)),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: _buildTextfield(
                                  "No of Bags 20 KG Putty", twentyController,
                                  isNumber: true)),
                              const SizedBox(width: 6),
                              Expanded(child: _buildTextfield(
                                  "KG'S", kgstwoController, readOnly: true)),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: _buildTextfield(
                                  "No of Bags 20 KG Regular",
                                  twentyRegController, isNumber: true)),
                              const SizedBox(width: 6),
                              Expanded(child: _buildTextfield(
                                  "KG'S", kgsthreeController, readOnly: true)),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: _buildTextfield(
                                  "No of Bags 20 KG EXP...",
                                  twentyExpController, isNumber: true)),
                              const SizedBox(width: 6),
                              Expanded(child: _buildTextfield(
                                  "KG'S", kgsfiveController)),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(child: _buildTextfield(
                                  "No of Bags 20 KG Regu...",
                                  twentyReguController, isNumber: true)),
                              const SizedBox(width: 6),
                              Expanded(child: _buildTextfield(
                                  "KG'S", kgsfourController)),
                            ],
                          ),
                        ],
                        SizedBox(height: 6,),
                        if (widget.isShowDropdown)
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("* Product Sold ",style: AppFonts.styleHarmoniaBold16W600(Colors.black),),
          CustomDropdownFieldWidget(
          selectedValue: selectProductSold,
          items: ['YES', 'NO'],
          parentContext: context,
          ),
        ],
      ),
    ),
                        const SizedBox(height: 20),
                        if (widget
                            .moveSalesSectionToBottom) buildSalesInfoFields(),
                        if (widget.isShowButton)
                          CustomButtons(
                            padding: 12,
                            circular: 50,
                            bc_color: AppColors.primaryColor,
                            title: "UPDATE INFORMATION",
                            onPressed: () {
                              if (!validateForm()) return;

                              controllers.UpdateInformation(
                                siteVisit: siteVisitController.text,
                                productSold: productSoldController.text,
                                specialIncentive: specialIncentivesController.text,
                                customerName: customerNameAddressController.text,
                                phone: customerContactController.text,
                                painterAutoConversion: painterConversionController.text,
                                retailerId: widget.lead.retailerId.toString(),
                                painterId: widget.lead.painterId.toString(),
                                visitDate: widget.lead.followUpDate ?? "",
                                createdBy: widget.lead.salesForceId ?? "",
                                generalCustomerId: widget.lead.generalCustomerId?? 0,
                                salesForceId: widget.lead.salesForceId.toString(),
                                sampleApplied: sampleController.text,
                                convertedToSale: convertedToSaleController.text,
                                noOfBags5KgPutty: fiveController.text,
                                noOfBags20KgPutty: twentyController.text,
                                noOfBags20KgRepaint: twentyRegController.text,
                                retailerNotAvailRemarks: "",
                                noConversionReasons: "",
                                retailerStock: "",
                                expectedKg: expectedKgsController.text,
                                tid: widget.lead.tid.toString(),
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextfield(String label, TextEditingController controller,
      {bool readOnly = false, bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        focusNode: readOnly ? AlwaysDisabledFocusNode() : null,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 12, vertical: 10),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(6)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }




}
