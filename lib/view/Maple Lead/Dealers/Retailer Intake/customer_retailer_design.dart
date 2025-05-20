import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Custom%20Widgets/custom_apbar_view.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Custom%20Widgets/custom_container.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Job%20Detail/job_controller.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../Custom Widgets/custom_container2.dart';
import '../Job Detail/custom_dropdown_view.dart';
import '../Job Detail/custom_textfiledd.dart';

class CustomerRetailerDesign extends StatelessWidget {
  final pinCodeController = TextEditingController();
  final qrCodeUrlController = TextEditingController();
  final amountController = TextEditingController();
  final frieghtController = TextEditingController();
  final bool isShowContainer;
  final bool isShowFieldaAndButton;

  CustomerRetailerDesign({
    super.key,
    this.isShowContainer = false,
    this.isShowFieldaAndButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyController());
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
          CustomDropdownField(
            label: '* Shop',
            selectedValue: controller.selectShop,
            items: controller.selectShopList,
            parentContext: context,
          ),
          const SizedBox(height: 12),
          CustomContainer2(title: "Registered Number"),
          const SizedBox(height: 12),
          if (isShowContainer)
            CustomContainer(title: "* New Order Generated", dealerName: "Invester Name"),
          CustomContainer(title: "* New Order Generated"),
          const SizedBox(height: 12),
          CustomContainer(title: "* Previous Order"),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(
                flex: 6,
                child: CustomTextFieldS(
                  controller: pinCodeController,
                  title: "Pin Code",
                  readOnly: false,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 5,
                child: GestureDetector(
                  onTap: () {
                    // Add generate code logic here
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
          CustomButton1(text: "VERIFY PIN", onPressed: () {}),
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
          if (isShowFieldaAndButton)
           Column(
             children: [
               CustomTextFieldS(
                 controller: amountController,
                 title: "Total Amount",
                 readOnly: false,
               ),
               CustomTextFieldS(
                 controller: frieghtController,
                 title: "Enter Frieght",
                 readOnly: false,
               ),
               CustomButton1(text: "SUBMIT", onPressed: () {}),
             ],
           ),
          SizedBox(height: media.height * (0.08)),
        ],
      ),
    );
  }
}
