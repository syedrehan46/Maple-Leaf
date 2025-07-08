import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mapleleaf/utils/custom%20widgets/Custom_Toaste.dart';
import 'package:mapleleaf/utils/custom%20widgets/background_image.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';

import '../../controller/painter_controller.dart';
import '../../controller/IM/Individual Painter/individual_painter_controller.dart';
import '../../utils/app_colors.dart';
import 'individual_meeting_painters.dart';

class PainterEngagementInvite1 extends StatelessWidget {
  final String? painterName;
  final String? phoneNumber;
  final String? cardNumber;
  final String? type;
  final String? areaId;
  final String location;
  final String giveaway;

  final ImagePicker _picker = ImagePicker();
  final painterDataController = Get.find<PainterDataController>();
  final controller = Get.find<IndividualPainterController>();
  final controllers = Get.find<IndividualPainterController>();

  PainterEngagementInvite1({
    super.key,
    this.painterName,
    this.phoneNumber,
    this.cardNumber,
    this.type,
    this.areaId,
    required this.location,
    required this.giveaway,
  });

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

  void showKpiDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: Colors.white,
          title: const Text('KPI..!!!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          content: const SizedBox(
            height: 50,
            child: Text('Are you sure you want to finalise engagement?', style: TextStyle(fontSize: 16)),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                if (painterDataController.painterAttachmentImage.value == null) {
                  CustomToastText('IM Painter Image is Mandatory', context: context);
                  Navigator.of(context).pop();
                  return;
                }

                Navigator.of(context).pop();

                final imageFile = painterDataController.painterAttachmentImage.value!;
                await controller.addPainter(
                  planId: controllers.planId.toString() ?? "0",
                  location: location,
                  giveAways: giveaway,
                  createdBy: "11665",
                  salesForceId: "001519",
                  imagePath: imageFile.path,
                );

                Get.to(() => IndividualMeetingPainters());
              },
              child: const Text('Yes', style: TextStyle(color: AppColors.redColor)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No', style: TextStyle(color: AppColors.redColor)),
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackgroundImage(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppbar(
                  title: 'Painter Engagement',
                  onPreesed: () => Get.offAll(IndividualMeetingPainters()),
                ),
                const SizedBox(height: 10),
                Obx(() => Text(
                  "${painterDataController.city.value} (${painterDataController.city.value})",
                  style: const TextStyle(
                    color: AppColors.redColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                const SizedBox(height: 60),

                Container(
                  height: 45,
                  width: media.width * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          painterName ?? 'N/A',
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          phoneNumber ?? 'N/A',
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                // Attachments
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
                        ? const Center(child: Icon(Icons.camera_alt))
                        : null,
                  )),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Attachments",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

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
                        ? const Center(child: Icon(Icons.camera_alt))
                        : null,
                  )),
                ),
                const SizedBox(height: 5),
                const Text(
                  "I am Painter Attachments",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // Finalise Button
                Container(
                  height: 30,
                  width: media.width * 0.5,
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: const BorderRadius.all(Radius.circular(22)),
                  ),
                  child: InkWell(
                    onTap: () => showKpiDialog(context),
                    child: const Center(
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

                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
