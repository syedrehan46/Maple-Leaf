import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/ui_helper.dart';

class CustomTwoInputForm extends StatefulWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String labelText1;
  final String labelText2;
  final String buttonText;
  final VoidCallback onTap;

  const CustomTwoInputForm({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.labelText1,
    required this.labelText2,
    required this.buttonText,
    required this.onTap,
  });

  @override
  State<CustomTwoInputForm> createState() => _CustomTwoInputFormState();
}

class _CustomTwoInputFormState extends State<CustomTwoInputForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UiHelper.customTextField(
          controller: widget.controller1,
          labelText: widget.labelText1,
        ),
        SizedBox(height: 20.h),
        UiHelper.customTextField(
          controller: widget.controller2,
          labelText: widget.labelText2,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: UiHelper.customButtonFill(
            color: AppColors.primaryColor,
            fontColor: AppColors.whiteColor,
            btnText: widget.buttonText,
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }
}
