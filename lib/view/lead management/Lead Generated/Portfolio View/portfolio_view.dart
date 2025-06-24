import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
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

    painterPhoneController =
        TextEditingController(text: lead.phoneNumber ?? '');
    painterNameController =
        TextEditingController(text: lead.painterName ?? '');
    customerPhoneController =
        TextEditingController(text: lead.customerPhone ?? '');
    customerNameController =
        TextEditingController(text: lead.customerName ?? '');
    planTypeController =
        TextEditingController(text: lead.engagementPlanType ?? 'INDIVIDUAL MEETUP PAINTER');

    followUpDate = lead.followUpDate != null && lead.followUpDate!.isNotEmpty
        ? lead.followUpDate!
        : " * Follow up date";

    siteVisitDropdown = lead.siteVisit ?? "Please select Site Visit";
    specialIncentiveDropdown =
        lead.specialIncentive ?? "Please select Special Incentive";
    painterAutoConversionDropdown =
        lead.painterAutoConversion ?? "Please select Painter auto Conversion";
    sampleAppliedDropdown =
        lead.sampleApplied ?? "Please select Sample Applied";
    convertedToSaleDropdown =
        lead.convertedToSale ?? "Please select Converted to Sale";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(title: 'PORTFOLIO'),
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/menu_bg.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildTextField("Painter Phone", painterPhoneController),
                        buildTextField("Painter Name", painterNameController),
                        buildTextField("Customer Contact No", customerPhoneController),
                        buildTextField("Customer Name and Address", customerNameController),
                        buildTextField("Plan Type", planTypeController),
                        buildDropdown("Site Visit", [
                          "Please select Site Visit",
                          "Yes",
                          "No"
                        ], siteVisitDropdown, (value) {
                          setState(() => siteVisitDropdown = value);
                        }),
                        buildDropdown("Special Incentive", [
                          "Please select Special Incentive",
                          "YES",
                          "NO"
                        ], specialIncentiveDropdown, (value) {
                          setState(() => specialIncentiveDropdown = value);
                        }),
                        buildDropdown("Painter Auto Conversion", [
                          "Please select Painter auto Conversion",
                          "YES",
                          "NO"
                        ], painterAutoConversionDropdown, (value) {
                          setState(() => painterAutoConversionDropdown = value);
                        }),
                        buildDropdown("Sample Applied", [
                          "Please select Sample Applied",
                          "Yes",
                          "No"
                        ], sampleAppliedDropdown, (value) {
                          setState(() => sampleAppliedDropdown = value);
                        }),
                        buildDropdown("Converted To Sale", [
                          "Please select Converted to Sale",
                          "Yes",
                          "No"
                        ], convertedToSaleDropdown, (value) {
                          setState(() => convertedToSaleDropdown = value);
                        }),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 16),
                          child: Row(
                            children: [
                              const Text("Further Follow Up", style: TextStyle(fontWeight: FontWeight.w500)),
                              const Spacer(),
                              TextButton(
                                onPressed: () => _selectDate(context),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red[700],
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(followUpDate),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // TODO: Submit updated values
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[700],
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                "UPDATE INFORMATION",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
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

  Widget buildTextField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, String? selectedValue,
      void Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("* $label", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                value: selectedValue,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: onChanged,
                items: items.map<DropdownMenuItem<String>>((String value) {
                  int index = items.indexOf(value);
                  Color bg = index == 0 ? AppColors.redColor : Colors.white;
                  Color textColor = index == 0 ? Colors.white : Colors.black;
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      color: bg,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                      child: Text(value, style: TextStyle(color: textColor)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
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
}
