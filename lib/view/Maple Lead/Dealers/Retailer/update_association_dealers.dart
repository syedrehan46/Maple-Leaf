import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';
import '../Custom Widgets/custom_apbar_view.dart';
import '../Job Detail/custom_dropdown_view.dart';
import '../Job Detail/job_controller.dart';

class UpdateAssociationDealers extends StatelessWidget {
  const UpdateAssociationDealers({super.key});

  @override
  Widget build(BuildContext context) {
    final MyController controller = Get.put(MyController());
    final media =MediaQuery.of(context).size;


    return Scaffold(
      appBar: CustomAppBar(title: "ASSOCIATE DEALER"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Column(
          children: [


            Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.greyF7F7F7Color,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Center(
                  child: Column(
                    children: [
                      CustomDropdownField(
                        label: '* Dealer',
                        selectedValue: controller.selectCity,
                        items: controller.selectCityList,
                        parentContext: context,
                      ),
                      const SizedBox(height: 12),
                      CustomDropdownField(
                        label: '* Receipt Type',
                        selectedValue: controller.selectRecieptType,
                        items: controller.selectRecieptTypeList,
                        parentContext: context,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            Container(
              height: 50,
              width: media.width,
              color: AppColors.greyF7F7F7Color, // Optional: Change or remove color

            ),
          ],
        ),
      ),
    );
  }
}
