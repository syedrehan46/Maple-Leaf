import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Custom%20Widgets/custom_apbar_view.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Custom%20Widgets/custom_container.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Job%20Detail/custom_toast.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Job%20Detail/job_controller.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../Custom Widgets/custom_container2.dart';
import '../Job Detail/custom_dropdown_view.dart';
import '../Job Detail/custom_textfiledd.dart';

class CustomerRetaileIntakerDesign extends StatelessWidget {
  CustomerRetaileIntakerDesign({
    super.key,
    this.isShowContainer = true,
    this.isShowFieldAndButton = false,
    this.isShowpreviouOrder = false,
    this.isShowPinCodeButton = false,
    this.isShowFields = false,
    this.isShowShops = true,
    this.isShowRegisteredNumber = true,
  });

  final pinCodeController = TextEditingController();
  final qrCodeUrlController = TextEditingController();
  final amountController = TextEditingController();
  final frieghtController = TextEditingController();
  final generalCustomerNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final bool isShowContainer;
  final bool isShowpreviouOrder;
  final bool isShowFieldAndButton;
  final bool isShowPinCodeButton;
  final bool isShowFields;
  final bool isShowShops;
  final bool isShowRegisteredNumber;
  final MyController controller = Get.put(MyController());

  void handlePin(BuildContext context) {
    if (controller.selectCity.isEmpty || controller.selectCity == "Please Select * City") {
      CustomToast("Please Select * City", context: context);
      return;
    }

    if (isShowShops &&(controller.selectShop.isEmpty || controller.selectShop == "Please Select * Shop")) {
      CustomToast("Please Select * Shop", context: context);
      return;
    }

    if (isShowPinCodeButton && pinCodeController.text.isEmpty) {
      CustomToast("Please Enter Pin Code", context: context);
      return;
    }
    if (isShowFields && (generalCustomerNameController.text.isEmpty || generalCustomerNameController.text == "General Customer Name")) {
      CustomToast("Please Enter General Customer Name", context: context);
      return;
    }
    if (isShowFields && (phoneNumberController.text.isEmpty || phoneNumberController.text == "Phone Number")) {
      CustomToast("Please Enter Phone Number", context: context);
      return;
    }

    if (isShowFields && (addressController.text.isEmpty || addressController.text == "Address")) {
      CustomToast("Please Address", context: context);
      return;
    }
    if (isShowFieldAndButton && (amountController.text.isEmpty || amountController.text == "Total Amount")) {
      CustomToast("Please Enter Amount", context: context);
      return;
    }


    if (isShowFieldAndButton && (amountController.text.isEmpty || amountController.text == "Total Amount")) {
      CustomToast("Please Enter Amount", context: context);
      return;
    }

    if (isShowFieldAndButton && (frieghtController.text.isEmpty || frieghtController.text == "Total Frieght")) {
      CustomToast("Please Enter Frieght", context: context);
      return;
    }

    if (isShowFieldAndButton) {
      CustomToast("Form is Submitted Successfully", context: context);
      return;
    } else {
      CustomToast("Pin Verified Successfully", context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
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
          if (isShowFields)
            Column(
              children: [
                CustomTextFieldS(
                  controller: generalCustomerNameController,
                  title: "Enter General Customer Name",
                  readOnly: false,
                ),
                CustomTextFieldS(
                  controller: phoneNumberController,
                  title: "Phone Number",
                  readOnly: false,
                  keyboardType: TextInputType.number,
                ),
                CustomTextFieldS(
                  controller: addressController,
                  title: "Address",
                  readOnly: false,
                ),
              ],
            ),
          if (isShowShops)
            CustomDropdownField(
              label: '* Shop',
              selectedValue: controller.selectShop,
              items: controller.selectShopList,
              parentContext: context,
            ),
          const SizedBox(height: 12),
          if (isShowRegisteredNumber) CustomContainer2(title: "Registered Number"),
          const SizedBox(height: 12),
          CustomContainer(title: "* New Order Generated", dealerName: "Invester Name"),
          if (isShowpreviouOrder)
            Column(
              children: [
                const SizedBox(height: 12),
                CustomContainer(title: "* Previous Order"),
              ],
            ),
          const SizedBox(height: 12),
          if (isShowPinCodeButton)
            Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: CustomTextFieldS(
                        controller: pinCodeController,
                        title: "Pin Code",
                        readOnly: false,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      flex: 5,
                      child: GestureDetector(
                        onTap: () {
                          // Generate code logic
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.activeColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                "GENERATE CODE",
                                style: AppFonts.styleHarmoniaBold16W600(Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CustomButton1(
                  text: "VERIFY PIN",
                  onPressed: () => handlePin(context),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/qr_scan.png",
                      height: 40,
                      width: 50,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomTextFieldS(
                        controller: qrCodeUrlController,
                        title: "QR CODE URL",
                        readOnly: false,
                        centerLabel: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          if (isShowFieldAndButton)
            Column(
              children: [
                CustomTextFieldS(
                  controller: amountController,
                  title: "Total Amount",
                  readOnly: false,
                  keyboardType: TextInputType.number,
                ),
                CustomTextFieldS(
                  controller: frieghtController,
                  title: "Enter Frieght",
                  readOnly: false,
                ),
                const SizedBox(height: 16),
                CustomButton1(text: "SUBMIT", onPressed: () {handlePin(context);}),
              ],
            ),
          SizedBox(height: media.height * 0.08),
        ],
      ),
    );
  }
}
