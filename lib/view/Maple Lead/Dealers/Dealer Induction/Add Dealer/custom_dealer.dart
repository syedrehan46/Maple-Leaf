import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button.dart';
import '../../../../../utils/custom widgets/Custom_Toaste.dart';
import '../../Job Detail/custom_dropdown_view.dart';
import '../../Job Detail/custom_radio_button.dart';
import '../../Job Detail/custom_textfiledd.dart';
import '../../Job Detail/custom_toast.dart';
import '../../Job Detail/job_controller.dart';
import '../../custom_button1.dart';
import 'custom_datepicker_button.dart';

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

  bool showAdditionalFields = false; // for your handleSearch result

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


  void handleAdd() {
    print("Function is working properly");

    final controller = Get.find<MyController>();

    String city = controller.selectCity.value.trim();
    String area = controller.selectArea.value.trim();
    String dealer = controller.selectDealerrType.value.trim();
    String customerType = controller.selectCustomerType.value.trim();

    String dealerName = dealerNameController.text.trim();
    String proprietorName = proprietorNameController.text.trim();
    String cnicNumber = cnicNumberController.text.trim();
    String cnicExpiryDate = cnicExpiryDateController.text.trim();
    String rtn = rtnController.text.trim();
    String strnName = strnNameController.text.trim();
    String dob = dobController.text.trim();
    String shopOfficeNumber = shopOfficeNumberController.text.trim();
    String phoneNumber1 = phoneNumber1Controller.text.trim();
    String phoneNumber2 = phoneNumber2Controller.text.trim();
    String address = addressController.text.trim();

    // 1. City
    if (city.isEmpty || city == "Please Select * City") {
      CustomToast('Please select a City', context: context);
      return;
    }

    // 2. Dealer Type (only if applicable)
    if (widget.isShowDealer) {
      if (dealer.isEmpty || dealer == "Please Select * Dealer") {
        CustomToast('Please select a Dealer type', context: context);
        return;
      }
    }

    // 3. Area
    if (area.isEmpty || area == "Please Select * Area") {
      CustomToast('Please select an Area', context: context);
      return;
    }

    // 4. Customer Type
    if (customerType.isEmpty || customerType == "Please Select * Custom Type") {
      CustomToast('Please select a Customer Type', context: context);
      return;
    }

    // 5. Dealer Name
    if (dealerName.isEmpty) {
      CustomToast('Please enter Dealer Name', context: context);
      return;
    }

    // 6. Proprietor Name
    if (proprietorName.isEmpty) {
      CustomToast('Please enter Proprietor Name', context: context);
      return;
    }

    // 7. CNIC
    if (cnicNumber.isEmpty) {
      CustomToast('Please enter CNIC number', context: context);
      return;
    }
    if (!cnicNumber.startsWith("36") || cnicNumber.length != 13) {
      CustomToast('CNIC must start with 36 and be 13 digits', context: context);
      return;
    }

    // 8. CNIC Expiry Date
    if (cnicExpiryDate.isEmpty) {
      CustomToast('Please enter CNIC Expiry Date', context: context);
      return;
    }

    // 9. RTN
    if (rtn.isEmpty) {
      CustomToast('Please enter RTN', context: context);
      return;
    }

    // 10. STRN Name
    if (strnName.isEmpty) {
      CustomToast('Please enter STRN Name', context: context);
      return;
    }

    // 11. Date of Birth
    if (dob.isEmpty) {
      CustomToast('Please enter Date of Birth', context: context);
      return;
    }

    // 12. Shop/Office Number
    if (shopOfficeNumber.isEmpty) {
      CustomToast('Please enter Shop/Office Number', context: context);
      return;
    }

    // 13. Phone Number 1
    if (phoneNumber1.isEmpty) {
      CustomToast('Please enter Phone Number 1', context: context);
      return;
    }
    if (!phoneNumber1.startsWith("03") || phoneNumber1.length != 11) {
      CustomToast('Phone Number 1 must start with 03 and be 11 digits', context: context);
      return;
    }

    // 14. Phone Number 2
    if (phoneNumber2.isEmpty) {
      CustomToast('Please enter Phone Number 2', context: context);
      return;
    }
    if (phoneNumber2.length != 11) {
      CustomToast('Phone Number 2 must be 11 digits', context: context);
      return;
    }

    // 15. Address
    if (address.isEmpty) {
      CustomToast('Please enter Address', context: context);
      return;
    }

    // NEW: Check if any product is selected
    if (selectedProductSet.isEmpty) {
      CustomToast('Please Select a Product', context: context);
      return;
    }

    // All validations passed
    bool userExistsInSystem = false; // Replace with your real logic

    if (!userExistsInSystem) {
      setState(() {
        showAdditionalFields = true;
      });
      if (dealerRetailerCum.isEmpty) {
        CustomToast('Please select Dealer Cum Retailer option', context: context);
        return;
      }
      CustomToast('Form is Added Successfully ', context: context);
    } else {
      CustomToastText('Dealer added successfully!', context: context);

      // Clear form if needed
    }
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
                selectedValue: controller.selectCustomerType,
                items: controller.selectCustomerTypeList,
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
                    readOnly: true,
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
                    readOnly: true,
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
            CustomTextFieldS(title: "Enter Address", controller: addressController, readOnly: false, maxLength: 250),
            const SizedBox(height: 12),
            if (widget.isShowCheckbox)
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
                                  StatefulBuilder(
                                    builder: (context, localSetState) {
                                      final checked = selectedProductSet.contains(productName);
                                      return GestureDetector(
                                        onTap: () {
                                          if (checked) {
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
                                          localSetState(() {});
                                          setState(() {});
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 12.0),
                                          child: Container(
                                            width: 24,
                                            height: 24,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: AppColors.primaryColor, width: 2),
                                            ),
                                            child: Center(
                                              child: checked
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
                                      );
                                    },
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
              onPressed: () {
                handleAdd();
              },
            ),
          ],
        ),
      ),
    );
  }
}
