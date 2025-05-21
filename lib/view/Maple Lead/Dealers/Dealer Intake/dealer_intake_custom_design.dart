import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../Custom Widgets/custom_apbar_view.dart';
import '../Dealer Induction/Add Dealer/custom_datepicker_button.dart';
import '../Job Detail/custom_dropdown_view.dart';
import '../Job Detail/custom_textfiledd.dart';
import '../Job Detail/job_controller.dart';

class DealerIntakeCustomDesign extends StatelessWidget {
  final shipmentController = TextEditingController();
  final dobController = TextEditingController();
  final amountController = TextEditingController();
  final blankController = TextEditingController();

  final MyController controller = Get.put(MyController());

  final bool isShowOrderType;
  final bool isShowSubZone;
  final bool isShowRetailerType;

  DealerIntakeCustomDesign({
    super.key,
    this.isShowOrderType = false,
    this.isShowSubZone = false,
    this.isShowRetailerType = false,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
      child: Column(
        children: [
          CustomDropdownField(
            label: '* City',
            selectedValue: controller.selectCity,
            items: controller.selectCityList,
            parentContext: context,
          ),
          SizedBox(height: 12),
          CustomDropdownField(
            label: '* Dealer',
            selectedValue: controller.selectDealerrType,
            items: controller.selectDealerList,
            parentContext: context,
          ),
          SizedBox(height: 12),
          Container(
            height: 80,
            width: media.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.grey9E9EA2Color,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Text(
                  "Your Outstanding Balance",
                  style: AppFonts.styleHarmoniaBold16W600(AppColors.redColor),
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          CustomDropdownField(
            label: '* Distribution City',
            selectedValue: controller.selectDistributionCity,
            items: controller.selectDistributionCityList,
            parentContext: context,
          ),
          SizedBox(height: 12),
          if (isShowOrderType)
            CustomDropdownField(
              label: '* Order Type',
              selectedValue: controller.selectOrderType,
              items: controller.selectOrderTypeList,
              parentContext: context,
            ),
          SizedBox(height: 12),
          if (isShowSubZone)

            CustomDropdownField(
              label: '* Sub Zone',
              selectedValue: controller.selectSubZone,
              items: controller.selectSubZoneList,
              parentContext: context,
            ),

          if (isShowRetailerType)

            CustomDropdownField(
              label: '* Linked Retailer',
              selectedValue: controller.selectLinkedReailer,
              items: controller.selectLinkedReatailerList,
              parentContext: context,
            ),
          SizedBox(height: 12,),
          CustomDropdownField(
            label: '* Brand',
            selectedValue: controller.selectBrand,
            items: controller.selectBrandList,
            parentContext: context,
          ),
          SizedBox(height: 12),
          CustomDropdownField(
            label: '* Delivery Date',
            selectedValue: controller.selectDeliveryDate,
            items: controller.selectDelievrDateList,
            parentContext: context,
          ),
          SizedBox(height: 12),
          CustomDropdownField(
            label: '* Dispatch Type',
            selectedValue: controller.selectDispatchType,
            items: controller.selectDispatchList,
            parentContext: context,
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CustomTextFieldS(
                  title: "* Shipment Date",
                  controller: dobController,
                  readOnly: true,
                ),
              ),
              const SizedBox(width: 12),
              CustomDatePickerButton(
                title: "Shipment Date",
                controller: dobController,
              ),
            ],
          ),
          CustomTextFieldS(
            title: "",
            controller: blankController,
            readOnly: false,
          ),
          SizedBox(height: 12),
          CustomTextFieldS(
            title: "Amount",
            controller: amountController,
            readOnly: true,
          ),
        ],
      ),
    );
  }
}
