import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../Dealer Induction/Add Dealer/custom_datepicker_button.dart';
import '../Job Detail/custom_dropdown_view.dart';
import '../Job Detail/custom_textfiledd.dart';
import '../Job Detail/job_controller.dart';

class RetailerCustomDesign extends StatefulWidget {
  final bool isShowZone;
  final bool isShowContainer;
  final bool isShowDropdown;
  final bool isShowButton;
  final bool isShowArea;
  final bool isShowRetailer;
  // final bool isShowProductDetail;

  const RetailerCustomDesign({
    super.key,
    this.isShowZone = false,

    this.isShowContainer = false,
    // this.isShowProductDetail = false,
    this.isShowButton = false,
    this.isShowDropdown = false,
    this.isShowArea = false,
    this.isShowRetailer = false,
  });

  @override
  State<RetailerCustomDesign> createState() => _AddRetailerViewState();
}

class _AddRetailerViewState extends State<RetailerCustomDesign> {
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController personNameController = TextEditingController();
  final TextEditingController cnicNumberController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phone1Controller = TextEditingController();
  final TextEditingController phone2Controller = TextEditingController();
  final TextEditingController wallPuttyCapacityController = TextEditingController();
  final TextEditingController wallCoatCapacityController = TextEditingController();
  final TextEditingController whiteCapacityController = TextEditingController();
  final TextEditingController kgController = TextEditingController();
  final TextEditingController tonController = TextEditingController();

  @override
  void dispose() {
    shopNameController.dispose();
    personNameController.dispose();
    cnicNumberController.dispose();
    dobController.dispose();
    emailController.dispose();
    phone1Controller.dispose();
    phone2Controller.dispose();
    wallPuttyCapacityController.dispose();
    wallCoatCapacityController.dispose();
    whiteCapacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MyController controller = Get.put(MyController());
    final media = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            CustomDropdownField(
              label: '* City',
              selectedValue: controller.selectCity,
              items: controller.selectCityList,
              parentContext: context,
            ),
            const SizedBox(height: 12),
            if (widget.isShowRetailer)
              CustomDropdownField(
                label: '* Retailer',
                selectedValue: controller.selectReailer,
                items: controller.selectRetailerList,
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
            if (widget.isShowZone)
              CustomDropdownField(
                label: '* Zone',
                selectedValue: controller.selectZone,
                items: controller.selectZoneList,
                parentContext: context,
              ),
            if (widget.isShowContainer)
              Container(
                height: 80,
                width: media.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.greyF7F7F7Color,
                ),
                child: Center(
                  child: Text(
                    "Sales Target",
                    style: AppFonts.styleHarmoniaBold16W600(AppColors.primaryColor),
                  ),
                ),
              ),
            const SizedBox(height: 12),
            CustomTextFieldS(controller: shopNameController, title: "Shop Name", readOnly: false),
            const SizedBox(height: 12),
            CustomTextFieldS(controller: personNameController, title: "Person Name", readOnly: false),
            const SizedBox(height: 12),
            CustomTextFieldS(
              title: "Enter CNIC (35020223239872)",
              controller: cnicNumberController,
              readOnly: false,
              keyboardType: TextInputType.number,
              maxLength: 13,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: CustomTextFieldS(
                    title: "Select Date Of Birth",
                    controller: dobController,
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 12),
                CustomDatePickerButton(title: "DOB", controller: dobController),
              ],
            ),
            const SizedBox(height: 12),
            CustomTextFieldS(
              title: "Enter Address",
              controller: emailController,
              readOnly: false,
              maxLength: 255,
            ),
            const SizedBox(height: 12),
            CustomTextFieldS(
              title: "Enter Phone 1",
              controller: phone1Controller,
              readOnly: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            CustomTextFieldS(
              title: "Enter Phone 2",
              controller: phone2Controller,
              readOnly: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  flex: 9,
                  child: CustomTextFieldS(
                    title: "WallPutty Capacity",
                    controller: wallPuttyCapacityController,
                    readOnly: false,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: CustomTextFieldS(title: "KG", controller: kgController, readOnly: true),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 9,
                  child: CustomTextFieldS(
                    title: "Wallcoat Capacity",
                    controller: wallCoatCapacityController,
                    readOnly: false,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: CustomTextFieldS(title: "KG", controller: kgController, readOnly: true),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 9,
                  child: CustomTextFieldS(
                    title: "White Capacity",
                    controller: whiteCapacityController,
                    readOnly: false,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: CustomTextFieldS(title: "TON", controller: tonController, readOnly: true),
                ),
              ],
            ),
            if (widget.isShowButton)
              Column(
                children: [
                  const SizedBox(height: 12),
                  CustomButton1(text: "SUBMIT",backgroundColor: AppColors.primaryColor, onPressed: () {  },),
                  const SizedBox(height: 20),
                ],
              ),
            SizedBox(height: 12,),
            if (widget.isShowDropdown) ...[
              Center(
                child: Text(
                  "Dealer Association ",
                  style: AppFonts.styleHarmoniaBold18W600().copyWith(color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(height: 4),
              CustomDropdownField(
                label: '* Dealer',
                selectedValue: controller.selectDealerrType,
                items: controller.selectDealerList,
                parentContext: context,
              ),
            ],
            const SizedBox(height: 10),

            Obx(() {
              if (controller.selectDealerrType.value.isNotEmpty &&
                  controller.selectDealerrType.value != "Please Select * Dealer") {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        "AVAILABLE PRODUCT",
                        style: AppFonts.styleHarmoniaBold18W600().copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 36),
                    Container(
                      decoration: BoxDecoration(color: AppColors.greyF7F7F7Color),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(4),
                        itemCount: 1,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Container(
                              height: 80,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(0, 4),
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  controller.selectDealerrType.value,
                                  style:AppFonts.styleHarmoniaBold16W600(Colors.black)
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomButton1(text: "ADD DEALER",backgroundColor: AppColors.primaryColor, onPressed: () {  },),
                    const SizedBox(height: 30),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            }),
          ],
        ),
      ),
    );
  }
}
