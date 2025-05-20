import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../Cash Management/custom_image_picker.dart';
import '../Custom Widgets/custom_apbar_view.dart';
import '../Job Detail/custom_dropdown_view.dart';
import '../Job Detail/custom_textfiledd.dart';
import '../Job Detail/job_controller.dart';


class MarketingActivityView extends StatefulWidget {
  const MarketingActivityView({super.key});

  @override
  State<MarketingActivityView> createState() => _MarketingActivityViewState();
}

class _MarketingActivityViewState extends State<MarketingActivityView> {
  final markController = TextEditingController();
  final MyController controller = Get.put(MyController());
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
     appBar: CustomAppBar(title: "Marketing Activity"),
      body: Container(
        height: media.height,
        width: media.width,
        color: AppColors.grey9E9EA2Color,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'DEALER',
                      style: AppFonts.styleHarmoniaBold18W600()
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(width: 12),
                    SvgPicture.asset(
                      'assets/images/refresh.svg',
                      height: 25,
                      width: 25,
                      colorFilter: ColorFilter.mode(
                        AppColors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
              CustomDropdownField(
                label: "City",
                selectedValue: controller.selectCity,
                items: controller.selectCityList,
                parentContext: context,
              ),
              const SizedBox(height: 16),
              CustomDropdownField(
                label: "Dealer",
                selectedValue: controller.selectDealerrType,
                items: controller.selectDealerList,
                parentContext: context,
              ),
              CustomTextFieldS(
                title: "Mark",
                controller: markController,
                readOnly: false,
                centerLabel: true, // Make sure this param exists in your widget
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 20),
              ImagePickerRow(
                onImageSelected: (File image) {
                  setState(() {
                    _selectedImage = image;
                  });
                },
              ),
              SizedBox(height: 26,),
              CustomButton1(text: "SUBMIT", onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
