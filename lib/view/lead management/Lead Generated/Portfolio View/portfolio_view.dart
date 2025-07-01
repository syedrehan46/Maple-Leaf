import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import '../../../../controller/LM/lead_generated_controller.dart';
import '../../../../controller/auth_controller.dart';
import '../../../../model/LM/Lead Converted/lead_converted_model.dart';
import '../../../../utils/custom widgets/custom_button1.dart';
import '../../../../utils/custom widgets/custom_calender.dart';
import '../../../../utils/custom widgets/custom_textfeild.dart';
import '../../../Maple Lead/Dealers/Job Detail/custom_toast.dart';

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

  String followUpDate = " Further Follow Up";

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
    final String createdBy = authController.salesForceId;

    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(title: 'PORTFOLIO'),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    CustomTextField1(label: "Painter Phone", controller: painterPhoneController, keyboardType: TextInputType.phone,isIgnorePointer: true,),
                    const SizedBox(height: 12),
                    CustomTextField1(label: "Painter Name", controller: painterNameController,isIgnorePointer: true,),
                    const SizedBox(height: 12),
                    CustomTextField1(label: "Customer Contact No", controller: customerPhoneController, keyboardType: TextInputType.phone),
                    const SizedBox(height: 12),
                    CustomTextField1(label: "Customer Name and Address", controller: customerNameController),
                    const SizedBox(height: 12),
                    CustomTextField1(label: "Plan Type", controller: planTypeController,isIgnorePointer: true,),

                    buildDropdown("Site Visit", ["Please select Site Visit", "Yes", "No"], siteVisitDropdown, (value) {
                      setState(() => siteVisitDropdown = value);
                    }),

                    buildDropdown("Special Incentive", ["Please select Special Incentive", "YES", "NO"], specialIncentiveDropdown, (value) {
                      setState(() => specialIncentiveDropdown = value);
                    }),

                    buildDropdown("Painter Auto Conversion", ["Please select Painter auto Conversion", "YES", "NO"], painterAutoConversionDropdown, (value) {
                      setState(() => painterAutoConversionDropdown = value);
                    }),

                    buildDropdown("Sample Applied", ["Please select Sample Applied", "Yes", "No"], sampleAppliedDropdown, (value) {
                      setState(() => sampleAppliedDropdown = value);
                    }),

                    buildDropdown("Converted To Sale", ["Please select Converted to Sale", "Yes", "No"], convertedToSaleDropdown, (value) {
                      setState(() => convertedToSaleDropdown = value);
                    }),

                    if (convertedToSaleDropdown == "Yes")
                      const SizedBox(height: 8),
                    if (convertedToSaleDropdown == "Yes")
                      CustomTextField1(label: "Expected KGS", controller: expectedKgsController, keyboardType: TextInputType.number),

                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          followUpDate != "Select Date" ? followUpDate : "",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        Container(
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2, color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(26),
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              showCustomDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                onDateSelected: (date) {
                                  setState(() {
                                    followUpDate = "${date.day}-${date.month}-${date.year}";
                                  });
                                },
                              );
                            },
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: const Text(
                              "* Further Follow Up",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    CustomButton1(
                      text: "UPDATE INFORMATION",
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
                      isEnabled: true,
                      backgroundColor: AppColors.redColor,
                      width: 0.9,
                      height: 50,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, String? selectedValue, void Function(String?) onChanged) {
    final LayerLink _layerLink = LayerLink();
    OverlayEntry? _overlayEntry;
    bool isDropdownOpen = false;

    final GlobalKey _dropdownKey = GlobalKey();

    final String headerTitle = items.first;
    final List<String> dropdownValues = items.sublist(1);

    void _removeDropdown() {
      _overlayEntry?.remove();
      _overlayEntry = null;
      isDropdownOpen = false;
    }

    void _showDropdown(BuildContext context) {
      final RenderBox renderBox = _dropdownKey.currentContext?.findRenderObject() as RenderBox;
      final Offset position = renderBox.localToGlobal(Offset.zero);
      final Size size = renderBox.size;

      _overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _removeDropdown,
                behavior: HitTestBehavior.translucent,
                child: Container(),
              ),
            ),
            Positioned(
              left: position.dx,
              top: position.dy + size.height + 4,
              width: size.width,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, 0),
                child: Material(
                  elevation: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 50,
                        color: AppColors.primaryColor,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          headerTitle,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: dropdownValues.map((item) {
                            return ListTile(
                              title: Text(item),
                              onTap: () {
                                onChanged(item);
                                _removeDropdown();
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      Overlay.of(context).insert(_overlayEntry!);
      isDropdownOpen = true;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("* $label", style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          CompositedTransformTarget(
            link: _layerLink,
            child: GestureDetector(
              key: _dropdownKey,
              onTap: () {
                if (!isDropdownOpen) {
                  _showDropdown(context);
                }
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedValue ?? headerTitle,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  }

