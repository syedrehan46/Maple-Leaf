import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/custom%20widgets/Custom_Toaste.dart';
import 'package:mapleleaf/utils/custom%20widgets/background_image.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../controller/painter_controller.dart';
import '../../utils/app_colors.dart';

class PainterEngagementInvite1 extends StatelessWidget {
  PainterEngagementInvite1({super.key});

  final painterDataController = Get.find<PainterDataController>();
  final ImagePicker _picker = ImagePicker();

  // Move the image state to the controller
  Future<void> _takePicture(bool isPainterAttachment) async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

      if (photo != null) {
        if (isPainterAttachment) {
          painterDataController.painterAttachmentImage.value = File(photo.path);
        } else {
          painterDataController.attachmentImage.value = File(photo.path);
        }
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void showCompleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: AppColors.approvedColor, size: 48),
              SizedBox(height: 12),
              Text(
                'Complete',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Finalised Engagement',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // No need to set values here as they're already in the controller
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.redColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23),
                    ),
                  ),
                  child: Text(
                    'OK',
                    style: TextStyle(color: AppColors.whiteColor, fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showKpiDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero)
          ),
          backgroundColor: Colors.white,
          title: Text(
            'KPI..!!!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: SizedBox(
            height: 50,
            child: Text(
              'Are you sure to want to finalised engagement?',
              style: TextStyle(fontSize: 16),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (painterDataController.painterAttachmentImage.value == null) {
                  CustomToastText('IM Painter Image is Mandatory');
                  Navigator.of(context).pop();
                } else {
                  Navigator.of(context).pop();
                  showCompleteDialog(context);
                }
              },
              child: Text(
                'Yes',
                style: TextStyle(color: AppColors.redColor),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text(
                'No',
                style: TextStyle(color: AppColors.redColor),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background Image
          BackgroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppbar(title: 'Painter Engagement'),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Obx(() => Text(
                  "${painterDataController.city.value} (${painterDataController.city.value})",
                  style: TextStyle(
                    color: AppColors.redColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 45,
                width: media.width * (0.8),
                decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                        "${painterDataController.painterName.value}",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      Obx(() => Text(
                        "${painterDataController.phoneNumber.value}",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              // First camera container - Attachments
              InkWell(
                onTap: () => _takePicture(false),
                child: Obx(() => Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.blackColor, width: 3),
                    image: painterDataController.attachmentImage.value != null
                        ? DecorationImage(
                      image: FileImage(painterDataController.attachmentImage.value!),
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),
                  child: painterDataController.attachmentImage.value == null
                      ? Center(child: Icon(Icons.camera_alt))
                      : null,
                )),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  "Attachments",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Second camera container - I am Painter Attachments
              InkWell(
                onTap: () => _takePicture(true),
                child: Obx(() => Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.blackColor, width: 3),
                    image: painterDataController.painterAttachmentImage.value != null
                        ? DecorationImage(
                      image: FileImage(painterDataController.painterAttachmentImage.value!),
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),
                  child: painterDataController.painterAttachmentImage.value == null
                      ? Center(child: Icon(Icons.camera_alt))
                      : null,
                )),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  "I am Painter Attachments",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 30,
                width: media.width * (0.5),
                decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                child: InkWell(
                  onTap: () {
                    showKpiDialog(context);
                  },
                  child: Center(
                    child: Text(
                      "FINALISED",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}