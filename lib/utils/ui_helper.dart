import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart'; // Added for Obx and Rx usage
import 'app_colors.dart';
import 'app_fonts.dart';
import 'app_images.dart';

class UiHelper {
  // ========== Your Previous Code ==========

  static customContainer({
    required Color color,
    required double radius,
    required Widget child,
    double pH = 10,
    double pV = 15,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: pH.w, vertical: pV.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          width: 1,
          color: const Color(0xffA4A4A433).withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackShadow.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }

  static customButton({
    required double height,
    required String btnText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            btnText,
            style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),
          ),
        ),
      ),
    );
  }

  static customButtonWithCounter({
    required double height,
    required String btnText,
    required String countText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnText,
              style: AppFonts.styleHarmoniaBold18W600(),
            ),
            SizedBox(width: 6.w),
            CircleAvatar(
              radius: 15.r,
              backgroundColor: AppColors.whiteColor,
              child: Center(
                child: Text(
                  countText,
                  style:
                  AppFonts.styleHarmoniaBold16W600(AppColors.primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget customListItem({
    required String title,
    required String phoneNumber,
    required String location,
    required String date,
    required double padding,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: padding, left: 12, right: 12),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    children: [
                      Text(
                        phoneNumber,
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Icon(Icons.arrow_forward_ios,
                          size:20, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                location,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                date,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  static String getImagePath({required String name, String format = "png"}) {
    return "assets/images/$name.$format";
  }

  static Widget customButtonFill({
    required Color color,
    required Color fontColor,
    required String btnText,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          elevation: 3,
        ),
        child: Text(
          btnText,
          style: AppFonts.styleHarmoniaBold14W600(fontColor),
        ),
      ),
    );
  }

  static customButtonOutline({
    required Color fontColor,
    required String btnText,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Center(
          child: Text(
            btnText,
            style: AppFonts.styleHarmoniaBold14W600(fontColor),
          ),
        ),
      ),
    );
  }

  static customPassTextField({
    required TextEditingController controller,
    required bool obscureText,
    required bool isPasswordVisible,
    required VoidCallback onPress,
    String hintText = "Password",
    FormFieldValidator<String>? validator,
  }) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      cursorColor: AppColors.primaryColor,
      style: AppFonts.styleHarmoniaRegular13W400(AppColors.greyA4A4A4Color),
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(hintText),
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: AppFonts.styleHarmoniaRegular13W400(AppColors.black434343),
        suffixIcon: GestureDetector(
          onTap: onPress,
          child: isPasswordVisible
              ? SvgPicture.asset(AppImages.unHideIcon,
              fit: BoxFit.scaleDown, color: Colors.black)
              : SvgPicture.asset(AppImages.hideIcon, fit: BoxFit.scaleDown),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
          const BorderSide(color: AppColors.greyA4A4A4Color, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
      validator: validator,
    );
  }

  static customTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      textCapitalization: TextCapitalization.words,
      style: AppFonts.styleHarmoniaRegular13W400(AppColors.blackColor),
      decoration: InputDecoration(
        hintText: labelText,
        label: Text(labelText),
        labelStyle: const TextStyle(color: Colors.black),
        hintStyle: AppFonts.styleHarmoniaRegular13W400(AppColors.greyA4A4A4Color),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
          const BorderSide(color: AppColors.greyA4A4A4Color, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
          const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
          const BorderSide(color: AppColors.primaryColor, width: 2),
        ),
      ),
    );
  }

  // ============================
  // NEW: buildDropdown method
  // ============================
  static Widget buildDropdown(String label, List<String> items, RxString selectedValue) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " $label",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FBFB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: Obx(() => DropdownButton<String>(
                value: selectedValue.value.isNotEmpty
                    ? selectedValue.value
                    : items.first,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    selectedValue.value = newValue;
                  }
                },
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: value == items.first
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              )),
            ),
          ),
        ],
      ),
    );
  }

  // ============================
  // NEW: showCustomFilterDialog method
  // ============================
  static void showCustomFilterDialog(
      BuildContext context, {
        required RxInt selectedIndex,
        required RxString selectedCity,
        required RxString selectedStatus,
      }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.whiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Month",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(Icons.close,
                              color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: List.generate(3, (index) {
                      final labels = [
                        "This Month",
                        "Since Last Month",
                        "Since Last Two Month"
                      ];
                      return Obx(() => ElevatedButton(
                        onPressed: () => selectedIndex.value = index,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedIndex.value == index
                                ? Colors.red
                                : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 0),
                        ),
                        child: Text(labels[index]),
                      ));
                    }),
                  ),
                  const SizedBox(height: 20),
                  buildDropdown("City", [
                    "Please Select City",
                    "CHARHOI",
                    "DANDI DARA",
                    "DINA",
                    "JHEUM",
                    "KHARIAN",
                    "KOTLA",
                    "SARAI ALAMGIR",
                  ], selectedCity),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          onPressed: () => Navigator.pop(context),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text("SHOW RESULT",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                                color: AppColors.primaryColor, width: 2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          onPressed: () {
                            selectedIndex.value = -1;
                            selectedCity.value = '';
                            selectedStatus.value = '';
                          },
                          child: const Text("CLEAR",
                              style:
                              TextStyle(color: AppColors.primaryColor)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
