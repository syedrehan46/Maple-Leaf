import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/custom_textfiledd.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/job_controller.dart';
import 'package:mapleleaf/view/Dealers/Job%20Detail/job_view.dart';
import 'package:mapleleaf/view/Dealers/custom_button1.dart';
import 'package:mapleleaf/view/Dealers/custom_textfield.dart';

import 'custom_dropdown_view.dart';

class GeneralCustomerView extends StatefulWidget {

  final String customerNo;
  final String jobName;
  final String via;
  final String createdby;

  const GeneralCustomerView({
    Key? key,
    required this.customerNo,
    required this.jobName,
    required this.via,
    required this.createdby,
  }) : super(key: key);

  @override
  State<GeneralCustomerView> createState() => _GeneralCustomerViewState();
}

class _GeneralCustomerViewState extends State<GeneralCustomerView> {
  String selectedValue="";
  // TextControllers with initial values from parameters
  final TextEditingController customerNameController = TextEditingController();
  final TextEditingController customerContactNoController = TextEditingController();
  final TextEditingController secondPersontypeController = TextEditingController();
  final TextEditingController secondPersonNoController = TextEditingController();
  final TextEditingController thirdPersonTypeController = TextEditingController();
  final TextEditingController thirdPersonNoController = TextEditingController();
  final TextEditingController leadFromController = TextEditingController();
  final TextEditingController viaController = TextEditingController();
  final TextEditingController tokenNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize controllers with values passed as parameters (if available)
    customerNameController.text = widget.jobName ?? '';
    customerContactNoController.text = widget.customerNo ?? '';
    viaController.text = widget.via ?? '';
    leadFromController.text = widget.createdby ?? '';
    secondPersonNoController.text = "03214546737";
    secondPersontypeController.text = "SUB CONTRACTOR";
  }

  @override
  void dispose() {
    // Dispose the controllers when no longer needed
    customerNameController.dispose();
    customerContactNoController.dispose();
    secondPersontypeController.dispose();
    secondPersonNoController.dispose();
    thirdPersonTypeController.dispose();
    thirdPersonNoController.dispose();
    leadFromController.dispose();
    viaController.dispose();
    tokenNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<String>options=["YES","NO"];
    final MyController controller=Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text(
          "General Customer",
          style: AppFonts.styleHarmoniaBold18W600(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: customerNameController,
              title: "Customer Name and Address",
              readOnly: false,
            ),
            CustomTextField(
              controller: customerContactNoController,
              title: "Customer Contact No",
              keyboardType: TextInputType.number,
              readOnly: false,
            ),
            CustomTextField(
              controller: secondPersontypeController,
              title: "Second Person Type",
            ),
            CustomTextField(
              controller: secondPersonNoController,
              title: "Second Person Number",
              keyboardType: TextInputType.number,
              readOnly: false,
            ),
            CustomTextField(
              controller: thirdPersonTypeController,
              title: "Third Person Type",
              readOnly: true,
            ),
            CustomTextField(
              controller: thirdPersonNoController,
              title: "Third Person Number",
              keyboardType: TextInputType.number,
              readOnly: false,
            ),
            CustomTextField(
              controller: leadFromController,
              title: "Lead From",
            ),
            CustomTextField(
              controller: viaController,
              title: "Via",
            ),
            SizedBox(height: 6,),
            CustomDropdownField(
              label: 'Second Person Type',
              selectedValue: controller.selectedSecondTypePerson,
              items: controller.secondTypePersonList,
              parentContext: context,
            ),
            SizedBox(height: 6),
            CustomDropdownField(
              label: 'Third Person Type',
              selectedValue: controller.selectedthirdTypePerson,
              items: controller.thirdTypePersonList,
              parentContext: context,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*(0.02)),
            GestureDetector(onTap: (){},
                child: CustomButton(bc_color: AppColors.primaryColor, title: "UPDATE INFORMATION", ToNavigate: JobView())),
            SizedBox(height: MediaQuery.of(context).size.height*(0.06)),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: AppColors.grey9E9EA2Color,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Painter Token Provided", style: AppFonts.styleHarmoniaBold14W600(Color(0xFFB31D1E))),
                  ),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: AppColors.primaryColor,
                            value: "YES",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                          Text("YES"),
                        ],
                      ),
                      SizedBox(width: 10),
                      Row(
                        children: [
                          Radio(
                            activeColor: AppColors.primaryColor,
                            value: "NO",
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                          Text("NO"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 6,),
            selectedValue == "YES"
                ? CustomTextField(
              controller: tokenNumberController,
              title: "Enter Token Number",
              readOnly: false,
              keyboardType: TextInputType.number,
              maxLength: 10,
            )
                : SizedBox(), // or Container()

 SizedBox(height: 6,),
            CustomDropdownField(
              label: 'Sample Applied',
              selectedValue: controller.selectedSampleApplied,
              items: controller.selectedSampledList,
              parentContext: context,
            ),
            SizedBox(height: 6),
            CustomDropdownField(
              label: 'Converted To Sale',
              selectedValue: controller.selectedConvertedToSale,
              items: controller.selectedConvertedToSaleList,
              parentContext: context,
            ),
            SizedBox(height: 6),
            CustomDropdownField(
              label: 'Select Project Stage',
              selectedValue: controller.selectedProjectToSale,
              items: controller.selectedProjectToSaleList,
              parentContext: context,
            ),
            SizedBox(height: 6),
            CustomDropdownField(
              label: 'Painter Obliged',
              selectedValue: controller.selectedPainterObliged,
              items: controller.selectedPainterObligedList,
              parentContext: context,
            ),
            SizedBox(height: MediaQuery.of(context).size.height*(0.03)),
            GestureDetector(onTap: (){},
                child: CustomButton(bc_color: AppColors.primaryColor, title: "PROCEED FEEDBACK", ToNavigate: JobView())),
          ],
        ),
      ),
    );
  }
}
