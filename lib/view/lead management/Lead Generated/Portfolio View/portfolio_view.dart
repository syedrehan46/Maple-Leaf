import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import '../../../../controller/LM/lead_generated_controller.dart';
import '../../../../controller/auth_controller.dart';
import '../../../../model/LM/Lead Converted/lead_converted_model.dart';

class PorfolioView extends StatefulWidget {
  final LeadConvertedModel lead;

  const PorfolioView({super.key, required this.lead});

  @override
  State<PorfolioView> createState() => _PorfolioViewState();
}

class _PorfolioViewState extends State<PorfolioView> {
  late TextEditingController painterPhoneController;
  late TextEditingController painterNameController;
  late TextEditingController customerPhoneController;
  late TextEditingController customerNameController;
  late TextEditingController planTypeController;
  late TextEditingController expectedKgsController;

  String followUpDate = " * Follow up date";

  String? siteVisitDropdown;
  String? specialIncentiveDropdown;
  String? painterAutoConversionDropdown;
  String? sampleAppliedDropdown;
  String? convertedToSaleDropdown;

  @override
  void initState() {
    super.initState();

    final lead = widget.lead;

    painterPhoneController = TextEditingController(text: lead.phoneNumber ?? '');
    painterNameController = TextEditingController(text: lead.painterName ?? '');
    customerPhoneController = TextEditingController(text: lead.customerPhone ?? '');
    customerNameController = TextEditingController(text: lead.customerName ?? '');
    planTypeController = TextEditingController(text: lead.engagementPlanType ?? 'INDIVIDUAL MEETUP PAINTER');
    expectedKgsController = TextEditingController();

    followUpDate = lead.followUpDate != null && lead.followUpDate!.isNotEmpty
        ? lead.followUpDate!
        : " * Follow up date";

    siteVisitDropdown = "Please select Site Visit";
    specialIncentiveDropdown = "Please select Special Incentive";
    painterAutoConversionDropdown = "Please select Painter auto Conversion";
    sampleAppliedDropdown = "Please select Sample Applied";
    convertedToSaleDropdown = "Please select Converted to Sale";
  }

  bool validateForm() {
    if (siteVisitDropdown == "Please select Site Visit") {
      CustomToast("Please select Site Visit", context: context);
      return false;
    }
    if (specialIncentiveDropdown == "Please select Special Incentive") {
      CustomToast("Please select Special Incentive", context: context);
      return false;
    }
    if (painterAutoConversionDropdown == "Please select Painter auto Conversion") {
      CustomToast("Please select Painter Auto Conversion", context: context);
      return false;
    }
    if (sampleAppliedDropdown == "Please select Sample Applied") {
      CustomToast("Please select Sample Applied", context: context);
      return false;
    }
    if (convertedToSaleDropdown == "Please select Converted to Sale") {
      CustomToast("Please select Converted To Sale", context: context);
      return false;
    }
    if (convertedToSaleDropdown == "Yes" && expectedKgsController.text.trim().isEmpty) {
      CustomToast("Please enter Expected KGS", context: context);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LeadGeneratedController());
    final authController = Get.put(AuthController());
    final String createdBy = authController.employeeName;

    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(title: 'PORTFOLIO'),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextField("Painter Phone", painterPhoneController),
                    buildTextField("Painter Name", painterNameController),
                    buildTextField("Customer Contact No", customerPhoneController),
                    buildTextField("Customer Name and Address", customerNameController),
                    buildTextField("Plan Type", planTypeController),
                    buildDropdown("Site Visit", [
                      "Please select Site Visit", "Yes", "No"
                    ], siteVisitDropdown, (value) {
                      setState(() => siteVisitDropdown = value);
                    }),
                    buildDropdown("Special Incentive", [
                      "Please select Special Incentive", "YES", "NO"
                    ], specialIncentiveDropdown, (value) {
                      setState(() => specialIncentiveDropdown = value);
                    }),
                    buildDropdown("Painter Auto Conversion", [
                      "Please select Painter auto Conversion", "YES", "NO"
                    ], painterAutoConversionDropdown, (value) {
                      setState(() => painterAutoConversionDropdown = value);
                    }),
                    buildDropdown("Sample Applied", [
                      "Please select Sample Applied", "Yes", "No"
                    ], sampleAppliedDropdown, (value) {
                      setState(() => sampleAppliedDropdown = value);
                    }),
                    buildDropdown("Converted To Sale", [
                      "Please select Converted to Sale", "Yes", "No"
                    ], convertedToSaleDropdown, (value) {
                      setState(() => convertedToSaleDropdown = value);
                    }),
                    if (convertedToSaleDropdown == "Yes")
                      buildTextField("Expected KGS", expectedKgsController),
                    const SizedBox(height: 16),
                    Text("Further Follow Up", style: TextStyle(fontWeight: FontWeight.bold)),
                    TextButton(
                      onPressed: () => _selectDate(context),
                      child: Text(followUpDate),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (!validateForm()) return;
                        controller.UpdateInformation(
                          siteVisit: siteVisitDropdown ?? '',
                          productSold: '',
                          specialIncentive: specialIncentiveDropdown ?? '',
                          customerName: customerNameController.text.trim(),
                          phone: customerPhoneController.text.trim(),
                          painterAutoConversion: painterAutoConversionDropdown ?? '',
                          retailerId: widget.lead.retailerId ?? '',
                          painterId: '',
                          visitDate: followUpDate != " * Follow up date" ? followUpDate : '',
                          createdBy: createdBy,
                          generalCustomerId: widget.lead.generalCustomerId ?? 0,
                          salesForceId: widget.lead.salesForceId ?? '',
                          sampleApplied: sampleAppliedDropdown ?? '',
                          convertedToSale: convertedToSaleDropdown ?? '',
                          noOfBags5KgPutty: '0',
                          noOfBags20KgPutty: '0',
                          noOfBags20KgRepaint: '0',
                          retailerNotAvailRemarks: '',
                          noConversionReasons: '',
                          retailerStock: '',
                          expectedKg: expectedKgsController.text.trim(),
                          tid: widget.lead.tid?.toString() ?? '0',
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red[700]),
                      child: const Text("UPDATE INFORMATION", style: TextStyle(color: Colors.white)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, String? selectedValue, void Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("* $label", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: onChanged,
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        followUpDate = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  void CustomToast(String message, {required BuildContext context}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}
