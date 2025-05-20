import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Cash%20Management/custom_image_picker.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Custom%20Widgets/custom_apbar_view.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Job%20Detail/job_controller.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/QR%20Code/qr_scanner.dart';

import '../Job Detail/custom_textfiledd.dart';

class QrCodeView extends StatefulWidget {

   QrCodeView({super.key});

  @override
  State<QrCodeView> createState() => _QrCodeViewState();
}

class _QrCodeViewState extends State<QrCodeView> {
  final markController=TextEditingController();

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    // final MyController controller = Get.put(MyController());
    final media=MediaQuery.of(context).size;


    return Scaffold(
     appBar: CustomAppBar(title: "QR CODE SCANS",showBack: false,),
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
                    SizedBox(height: 12,),
                    Center(child: Text("Please Scan Code and Unlock The Button",style: AppFonts.styleHarmoniaBold14W600(Colors.black)),),
                    SizedBox(height: 40,),
                    Row(

                      children: [
                    Image.asset("assets/images/qr_scan.png",height: 40,width: 50,),
                        SizedBox(width: media.width*(0.27),),
                        Text("QR CODE",style: AppFonts.styleHarmoniaRegular14W400(Colors.black),)
                      ],
                    ),
                    SizedBox(height: 30,),
                    CustomButton1(
                      text: "SCAN",
                      onPressed: () {
                        Get.to(() => ScannerScreen());
                      },
                    ),

                    SizedBox(height: media.height*(0.05),),
                    Row(
                      children: [
                        Expanded(child: Divider(color: AppColors.blackColor,thickness: 2,)),
                        SizedBox(width: 6,),
                        Text("OR"),
                        SizedBox(width: 6,),
                        Expanded(child: Divider(color: AppColors.blackColor,thickness: 2,)),
                      ],
                    ),

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
