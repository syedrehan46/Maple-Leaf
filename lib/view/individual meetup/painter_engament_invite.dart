import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/painter_controller.dart';
import 'package:mapleleaf/utils/custom%20widgets/background_image.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';
import 'package:mapleleaf/view/individual%20meetup/painter_engagement_invite1.dart';
import '../../controller/IM/Individual Painter/individual_painter_controller.dart';
import '../../model/IM/indivdual_painter_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom widgets/Custom_Toaste.dart';
import '../../utils/custom widgets/custom_textfeild.dart';
import 'individual_meeting_painters.dart';

class PainterEngamentInvite extends StatefulWidget {
  final String location;
  final String giveaway;

  PainterEngamentInvite({
    super.key,
    required this.location,
    required this.giveaway,

  });

  @override
  State<PainterEngamentInvite> createState() => _PainterEngamentInviteState();
}

class _PainterEngamentInviteState extends State<PainterEngamentInvite> {
  final painterDataController = Get.find<PainterDataController>();
  final controller = Get.find<IndividualPainterController>();

  final TextEditingController phoneNumberEditingController = TextEditingController();
  final TextEditingController painterNameEditingController = TextEditingController();
  final TextEditingController cardNumberEditingController = TextEditingController();

  late FToast fToast;

  bool showAdditionalFields = false;
  String? Type;
  String? Area;
  int? AreaId;

  List<String> type = [
    'Please Select Type',
    'PAINTER',
    'LAB CONTRACTOR'
  ];

  @override
  void initState() {
    super.initState();
    fToast = FToast();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      fToast.init(context);
      CustomToastText('Add Detail Successful', context: context);
      controller.fetchAllAreas(); // fetch area list from API
    });
  }

  void handleSearch() {
    String cardNumber = cardNumberEditingController.text.trim();
    String phoneNumber = phoneNumberEditingController.text.trim();

    if ((cardNumber.isEmpty || cardNumber.length < 16) &&
        (phoneNumber.isEmpty || phoneNumber.length != 11 || !phoneNumber.startsWith('03'))) {
      CustomToastText('Please enter a valid card number or phone number', context: context);
      return;
    }

    if (phoneNumber.isNotEmpty &&
        (phoneNumber.length != 11 || !phoneNumber.startsWith('03'))) {
      CustomToastText('Please Enter Painter Number 03210089760 (11 Digit)', context: context);
      return;
    }

    setState(() {
      CustomToastText(
        'This number is not exist in system please fill the fields',
        context: context,
      );
      showAdditionalFields = true;
    });
  }

  void handleAddPainter() {
    String phoneNumber = phoneNumberEditingController.text.trim();
    String painterName = painterNameEditingController.text.trim();

    if (phoneNumber.isEmpty || phoneNumber.length != 11 || !phoneNumber.startsWith('03')) {
      CustomToastText('Please enter a valid phone number', context: context);
      return;
    }

    if (painterName.isEmpty) {
      CustomToastText('Please enter painter name', context: context);
      return;
    }

    if (Type != 'PAINTER' && Type != 'LAB CONTRACTOR') {
      CustomToastText('Please select Type', context: context);
      return;
    }

    if (Area == null || Area == 'Please Select Area' || AreaId == null) {
      CustomToastText('Please select Area', context: context);
      return;
    }

    painterDataController.cardNumber.value = cardNumberEditingController.text.trim();
    painterDataController.phoneNumber.value = phoneNumberEditingController.text.trim();
    painterDataController.painterName.value = painterName;
    painterDataController.type.value = Type!;
    painterDataController.areaId.value = AreaId.toString();

    Get.to(PainterEngagementInvite1(
      painterName: painterName,
      phoneNumber: phoneNumber,
      cardNumber: cardNumberEditingController.text.trim(),
      type: Type!,
      areaId: AreaId.toString(),
      location: widget.location,
      giveaway: widget.giveaway,

    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          BackgroundImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                CustomAppbar(
                  title: 'painter engagement',
                  onPreesed: () {
                    Get.offAll(IndividualMeetingPainters());
                  },
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    "${painterDataController.city.value} (${painterDataController.city.value})",
                    style: const TextStyle(
                      color: AppColors.redColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: CustomTextField1(
                              keyboardType: TextInputType.phone,
                              maxLength: 16,
                              label: " Card Number",
                              controller: cardNumberEditingController,
                            ),
                          ),
                          InkWell(
                            onTap: handleSearch,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 7),
                              child: Icon(
                                Icons.search_rounded,
                                size: 28,
                                color: AppColors.redColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      CustomTextField1(
                        keyboardType: TextInputType.phone,
                        maxLength: 11,
                        showCharCount: true,
                        label: " Phone Number",
                        controller: phoneNumberEditingController,
                      ),
                      const SizedBox(height: 20),
                      CustomTextField1(
                        keyboardType: TextInputType.name,
                        maxLength: 20,
                        showCharCount: false,
                        label: " Painter Name",
                        controller: painterNameEditingController,
                      ),
                      if (showAdditionalFields) ...[
                        const SizedBox(height: 10),
                        CustomDropdownFeild(
                          title: 'Type',
                          width: MediaQuery.of(context).size.width * 0.8,
                          items: type,
                          onChanged: (s) {
                            if (s != null) {
                              setState(() {
                                Type = s;
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        Obx(() {
                          final areaList = controller.allAreaList;
                          final dropdownItems = ['Please Select Area', ...areaList.map((e) => e.areaName ?? '').toList()];

                          return CustomDropdownFeild(
                            title: '* Area',
                            width: MediaQuery.of(context).size.width * 0.8,
                            items: dropdownItems,
                            onChanged: (s) {
                              if (s != null && s != 'Please Select Area') {
                                setState(() {
                                  Area = s;
                                  AreaId = areaList.firstWhere((element) => element.areaName == s).areaId;
                                });
                              }
                            },
                          );
                        }),
                        const SizedBox(height: 15),
                        CustomButton1(
                          text: 'ADD PAINTER',
                          onPressed: handleAddPainter,
                        ),
                      ],
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
