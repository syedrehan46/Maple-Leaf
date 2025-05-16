import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button.dart';
import 'package:mapleleaf/view/Dealers/Dealer%20Induction/Add%20Dealer/custom_datepicker_button.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/custom_radio_button.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/custom_textfiledd.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/job_controller.dart';
import '../../Job Detail/custom_dropdown_view.dart';
import '../../custom_button1.dart';

class DealerDesign extends StatefulWidget {
  final bool isShowDropdown;
  final bool isShowArea;
  final bool isShowRadio;
  final bool isShowCheckbox;
  final bool isShowDealer;

  const DealerDesign({
    super.key,
    this.isShowDropdown = true,
    this.isShowRadio = true,
    this.isShowCheckbox = true,
    this.isShowDealer = false,
    this.isShowArea = true,

  });

  @override
  State<DealerDesign> createState() => _DealerDesignState();
}

class _DealerDesignState extends State<DealerDesign> {
  final TextEditingController dealerNameController = TextEditingController();
  final TextEditingController proprietorNameController = TextEditingController();
  final TextEditingController cnicNumberController = TextEditingController();
  final TextEditingController cnicExpiryDateController = TextEditingController();
  final TextEditingController rtnController = TextEditingController();
  final TextEditingController strnNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController shopOfficeNumberController = TextEditingController();
  final TextEditingController phoneNumber1Controller = TextEditingController();
  final TextEditingController phoneNumber2Controller = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String dealerRetailerCum = "";

  Set<String> selectedProductSet = {};

  Map<String, bool> selectedProducts = {
    "White Cement": false,
    "Wall Coat": false,
    "Wall Putty": false,
  };

  @override
  void dispose() {
    dealerNameController.dispose();
    proprietorNameController.dispose();
    cnicNumberController.dispose();
    cnicExpiryDateController.dispose();
    rtnController.dispose();
    strnNameController.dispose();
    dobController.dispose();
    shopOfficeNumberController.dispose();
    phoneNumber1Controller.dispose();
    phoneNumber2Controller.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MyController controller = Get.put(MyController());
    final media = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdownField(
              label: '* City',
              selectedValue: controller.selectCity,
              items: controller.selectCityList,
              parentContext: context,
            ),
            const SizedBox(height: 12),
            if (widget.isShowDealer)
              CustomDropdownField(
                label: '* Dealer',
                selectedValue: controller.selectDealerrType,
                items: controller.selectDealerList,
                parentContext: context,
              ),
            if (widget.isShowArea)
            CustomDropdownField(
              label: '* Area',
              selectedValue: controller.selectArea,
              items: controller.selectAreaList,
              parentContext: context,
            ),
            const SizedBox(height: 12),
            if (widget.isShowDropdown)
              CustomDropdownField(
                label: 'Customer Type',
                selectedValue: controller.selectDealerrType,
                items: controller.selectDealerList,
                parentContext: context,
              ),
            const SizedBox(height: 12),
            CustomTextFieldS(title: "Enter Dealer Name", controller: dealerNameController, readOnly: false),
            CustomTextFieldS(title: "Enter Proprietor Name", controller: proprietorNameController, readOnly: false),
            CustomTextFieldS(
              title: "Enter CNIC (35020223239872)",
              controller: cnicNumberController,
              readOnly: false,
              keyboardType: TextInputType.number,
              maxLength: 13,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextFieldS(
                    title: "Select CNIC Expiry Date",
                    controller: cnicExpiryDateController,
                    readOnly: false,
                  ),
                ),
                CustomDatePickerButton(
                  title: "CNIC Expiry",
                  controller: cnicExpiryDateController,
                ),
              ],
            ),
            CustomTextFieldS(
              title: "Enter RTN",
              controller: rtnController,
              readOnly: false,
              keyboardType: TextInputType.number,
            ),
            CustomTextFieldS(title: "Enter STRN Name", controller: strnNameController, readOnly: false),
            Row(
              children: [
                Expanded(
                  child: CustomTextFieldS(
                    title: "Select Date of Birth",
                    controller: dobController,
                    readOnly: false,
                  ),
                ),
                CustomDatePickerButton(
                  title: "DOB",
                  controller: dobController,
                ),
              ],
            ),
            CustomTextFieldS(
              title: "Enter Shop Office Number",
              controller: shopOfficeNumberController,
              readOnly: false,
              keyboardType: TextInputType.number,
            ),
            CustomTextFieldS(
              title: "Enter Phone Number 1",
              controller: phoneNumber1Controller,
              readOnly: false,
              keyboardType: TextInputType.number,
            ),
            CustomTextFieldS(
              title: "Enter Phone Number 2",
              controller: phoneNumber2Controller,
              readOnly: false,
              keyboardType: TextInputType.number,
            ),
            CustomTextFieldS(title: "Enter Address", controller: addressController, readOnly: false),
        if(widget.isShowCheckbox)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 12),
              child: Container(
                color: AppColors.grey9E9EA2Color,
                width: media.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Product",
                              style: AppFonts.styleHarmoniaBold18W600().copyWith(color: AppColors.blackColor),
                            ),
                          ),
                          Text(
                            "Select",
                            style: AppFonts.styleHarmoniaBold18W600().copyWith(color: AppColors.blackColor),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
                    ...selectedProducts.keys.toList().asMap().entries.map((entry) {
                      final index = entry.key;
                      final productName = entry.value;
                      final isLast = index == selectedProducts.length - 1;
                      final isChecked = selectedProductSet.contains(productName);

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(productName, style: const TextStyle(fontSize: 16, color: Colors.black)),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isChecked) {
                                        selectedProductSet.remove(productName);
                                      } else {
                                        if (selectedProductSet.length < 3) {
                                          selectedProductSet.add(productName);
                                        } else {
                                          Get.snackbar(
                                            "Limit reached",
                                            "You can select up to 3 products only.",
                                            snackPosition: SnackPosition.BOTTOM,
                                          );
                                        }
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: AppColors.primaryColor, width: 2),
                                    ),
                                    child: Center(
                                      child: isChecked
                                          ? Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.primaryColor,
                                        ),
                                      )
                                          : const SizedBox.shrink(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (!isLast) const Divider(color: Colors.grey, thickness: 1),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            if (widget.isShowRadio)
              CustomRadioButton(
                title: "Dealer Cum Retailer",
                onChanged: (value) {
                  setState(() {
                    dealerRetailerCum = value;
                  });
                },
                showSecondaryRadio: dealerRetailerCum == "YES",
              ),

            const SizedBox(height: 20),

            CustomButtons(
              title: "ADD",
              padding: 1,
              bc_color: AppColors.primaryColor,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
