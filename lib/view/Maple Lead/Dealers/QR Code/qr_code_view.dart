import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom widgets/custom_button1.dart';
import 'package:mapleleaf/view/Maple Lead/Dealers/Cash Management/custom_image_picker.dart';
import 'package:mapleleaf/view/Maple Lead/Dealers/Custom Widgets/custom_apbar_view.dart';
import 'package:mapleleaf/view/Maple Lead/Dealers/Job Detail/custom_textfiledd.dart';
import 'package:permission_handler/permission_handler.dart';
import 'qr_scanner.dart';

class QrCodeView extends StatefulWidget {
  const QrCodeView({super.key});

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  final markController = TextEditingController();
  File? _selectedImage;

  Future<void> _checkCameraAndNavigate() async {
    final status = await Permission.camera.request();
    if (status.isGranted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );
      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.of(context).pop(); // remove loading
      Get.to(() =>  ScannerScreen());
    } else {
      Get.snackbar("Permission Denied", "Camera permission is required to scan QR code.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(title: "QR CODE SCANS", showBack: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
        child: Column(
          children: [
            CustomTextFieldS(
              title: "Remarks",
              controller: markController,
              readOnly: false,
              centerLabel: true,
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                "Please Scan Code and Unlock The Button",
                style: AppFonts.styleHarmoniaBold14W600(Colors.black),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Image.asset("assets/images/qr_scan.png", height: 40, width: 50),
                SizedBox(width: media.width * 0.27),
                Text(
                  "QR CODE",
                  style: AppFonts.styleHarmoniaRegular14W400(Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 30),
            CustomButton1(
              text: "SCAN",
              onPressed: _checkCameraAndNavigate,
            ),
            SizedBox(height: media.height * 0.05),
            Row(
              children: [
                const Expanded(child: Divider(color: AppColors.blackColor, thickness: 1)),
                const SizedBox(width: 6),
                const Text("OR"),
                const SizedBox(width: 6),
                const Expanded(child: Divider(color: AppColors.blackColor, thickness: 1)),
              ],
            ),
            const SizedBox(height: 16),
            ImagePickerRow(
              onImageSelected: (File image) {
                setState(() {
                  _selectedImage = image;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
