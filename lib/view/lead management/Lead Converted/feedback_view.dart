import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/LM/lead_converted_controller.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom widgets/custom_appbar.dart';
import '../../../model/LM/Lead Converted/lead_converted_model.dart';
import '../../Maple Lead/Dealers/custom_button1.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class FeedbackScreen extends StatefulWidget {
  final LeadConvertedModel lead;
  final bool isShowDropdown;
  final bool isShowButton;

  const FeedbackScreen({
    Key? key,
    required this.lead,
    this.isShowDropdown = true,
    this.isShowButton = true,
  }) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final LeadConvertedController controller = Get.find<LeadConvertedController>();

  final RxString selectedCity = "Select Retailer".obs;
  final RxString selectProductSold = "Select Product Sold".obs;

  final TextEditingController painterController = TextEditingController();
  final TextEditingController painterNameController = TextEditingController();
  final TextEditingController customerContactController = TextEditingController();
  final TextEditingController customerNameAddressController = TextEditingController();
  final TextEditingController siteVisitController = TextEditingController();
  final TextEditingController productSoldController = TextEditingController();
  final TextEditingController sampleController = TextEditingController();
  final TextEditingController convertedToSaleController = TextEditingController();
  final TextEditingController painterConversionController = TextEditingController();
  final TextEditingController specialIncentivesController = TextEditingController();
  final TextEditingController expectedKgsController = TextEditingController();
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

  @override
  void initState() {
    super.initState();
    _assignLeadDataToControllers();

    fiveController.addListener(() => _updateKgTotal(fiveController, kGSController, 5));
    twentyController.addListener(() => _updateKgTotal(twentyController, kgstwoController, 20));
    twentyRegController.addListener(() => _updateKgTotal(twentyRegController, kgsthreeController, 20));
    twentyExpController.addListener(() => _updateKgTotal(twentyExpController, kgExpController, 20));
    twentyReguController.addListener(() => _updateKgTotal(twentyReguController, kgReguController, 20));
  }

  void _assignLeadDataToControllers() {
    painterController.text = widget.lead.phoneNumber ?? "";
    painterNameController.text = widget.lead.painterName ?? "";
    customerContactController.text = widget.lead.customerPhone ?? "";
    customerNameAddressController.text =
    "${widget.lead.customerName ?? ""} - ${widget.lead.customerAreaName ?? ""}";
    siteVisitController.text = widget.lead.siteVisit ?? "";
    productSoldController.text = widget.lead.productSold ?? "YES";
    sampleController.text = widget.lead.sampleApplied ?? "";
    convertedToSaleController.text = widget.lead.convertedToSale ?? "";
    painterConversionController.text = widget.lead.painterAutoConversion ?? "";
    specialIncentivesController.text = widget.lead.specialIncentive ?? "";
    expectedKgsController.text = widget.lead.expectedKgs?.toString() ?? "";
    shopNameController.text = widget.lead.retailerName ?? "";

    fiveController.text = widget.lead.noOfBags5Kg?.toString() ?? "";
    twentyController.text = widget.lead.noOfBags20Kg?.toString() ?? "";
    twentyRegController.text = widget.lead.noOfBags20KgRepaint?.toString() ?? "";
    twentyExpController.text = widget.lead.noOfBags20KgExtPutty?.toString() ?? "";
    twentyReguController.text = widget.lead.total20KgRepaint?.toString() ?? "";

    kGSController.text = widget.lead.total5Kgs?.toString() ?? "";
    kgstwoController.text = widget.lead.total20Kgs?.toString() ?? "";
    kgsthreeController.text = widget.lead.total20KgRepaint?.toString() ?? "";
  }

  void _updateKgTotal(
      TextEditingController bagsController, TextEditingController kgController, int multiplier) {
    int bags = int.tryParse(bagsController.text) ?? 0;
    kgController.text = (bags * multiplier).toString();
  }

  @override
  void dispose() {
    painterController.dispose();
    painterNameController.dispose();
    customerContactController.dispose();
    customerNameAddressController.dispose();
    siteVisitController.dispose();
    productSoldController.dispose();
    sampleController.dispose();
    convertedToSaleController.dispose();
    painterConversionController.dispose();
    specialIncentivesController.dispose();
    expectedKgsController.dispose();
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

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(title: 'FEEDBACK', timeLocationIsVisible: false),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset("assets/images/menu_bg.png", fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        _buildTextfield("Painter Phone", painterController, readOnly: true),
                        _buildTextfield("Painter Name", painterNameController, readOnly: true),
                        _buildTextfield("Customer Contact No", customerContactController, readOnly: true),
                        _buildTextfield("Customer Name and Address", customerNameAddressController, readOnly: true),
                        Row(
                          children: [
                            Expanded(child: _buildTextfield("Site Visit", siteVisitController, readOnly: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("Product Sold", productSoldController, readOnly: true)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: _buildTextfield("Sample Applied", sampleController, readOnly: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("Converted To Sale", convertedToSaleController, readOnly: true)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: _buildTextfield("Painter Conversion", painterConversionController, readOnly: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("Special Incentives", specialIncentivesController, readOnly: true)),
                          ],
                        ),
                        _buildTextfield("Expected KGS", expectedKgsController, readOnly: true),
                        const SizedBox(height: 6),

                        if (widget.isShowDropdown)
                          Obx(() => buildDropdown("* Retailer", controller.retailerList, selectedCity)),

                        SizedBox(height: 10.h),

                        _buildTextfield("Shop Name", shopNameController, readOnly: true),

                        Row(
                          children: [
                            Expanded(child: _buildTextfield("No of Bags 5 KG Putty", fiveController, isNumber: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("KG'S", kGSController, readOnly: true)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: _buildTextfield("No of Bags 20 KG Putty", twentyController, isNumber: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("KG'S", kgstwoController, readOnly: true)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: _buildTextfield("No of Bags 20 KG Regular", twentyRegController, isNumber: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("KG'S", kgsthreeController, readOnly: true)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: _buildTextfield("No of Bags 20 KG EXP...", twentyExpController, isNumber: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("KG'S", kgExpController, readOnly: true)),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(child: _buildTextfield("No of Bags 20 KG Regu...", twentyReguController, isNumber: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("KG'S", kgReguController, readOnly: true)),
                          ],
                        ),

                        const SizedBox(height: 6),

                        if (widget.isShowDropdown)
                          Obx(() => buildDropdown("* Product Sold", controller.productList, selectProductSold)),

                        SizedBox(height: 10.h),

                        if (widget.isShowButton)
                          CustomButtons(
                            padding: 12,
                            circular: 50,
                            bc_color: AppColors.primaryColor,
                            title: "UPDATE INFORMATION",
                            onPressed: () {
                              // Your update logic
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
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, RxString selectedValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(" $label", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.grey9E9EA2Color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue.value,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                dropdownColor: AppColors.whiteColor,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    selectedValue.value = newValue;
                  }
                },
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: value == items.first ? AppColors.redColor : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
