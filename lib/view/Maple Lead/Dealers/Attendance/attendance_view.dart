import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/Custom_Toaste.dart';


import '../Cash Management/custom_image_picker.dart';
import '../custom_button1.dart';
import '../Job Detail/custom_toast.dart';
import '../Job Detail/job_view.dart';

class AttendanceView extends StatefulWidget {
  const AttendanceView({super.key});

  @override
  State<AttendanceView> createState() => _AddImageViewState();
}

class _AddImageViewState extends State<AttendanceView> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/menu_bg.png", fit: BoxFit.cover)),
          Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Center(
                child: Text(
                  "START YOUR DAY",
                  style: AppFonts.styleHarmoniaBold31W600(Colors.black).copyWith(fontSize: 24),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),

              /// Use custom ImagePickerRow
              ImagePickerRow(isShowGallery: false,
                onImageSelected: (File image) {
                  setState(() {
                    _selectedImage = image;
                  });
                },
              ),

              if (_selectedImage != null) ...[
                const SizedBox(height: 20),
                Image.file(_selectedImage!, height: 120),
              ],

              SizedBox(height: MediaQuery.of(context).size.height * 0.08),

              CustomButtons(
                bc_color: AppColors.primaryColor,
                padding: 8,
                title: "SUBMIT",
                onPressed: () {
                  if (_selectedImage == null) {
                    CustomToast("Image is Mandatory", context: context);
                  } else {
                    Get.to(() => JobView());
                  }
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButtons(
                padding: 8,
                bc_color: AppColors.blue0094D6Color,
                title: "NOT NOW",
                onPressed: () {
                  CustomToast('Login Successful', context: context);
                  Future.delayed(const Duration(seconds: 3), () {
                    Get.to(() => JobView());
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
