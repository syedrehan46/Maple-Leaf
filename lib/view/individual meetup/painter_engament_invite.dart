import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mapleleaf/controller/painter_controller.dart';
import 'package:mapleleaf/utils/custom%20widgets/background_image.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';
import 'package:mapleleaf/view/individual%20meetup/painter_engagement_invite1.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/custom widgets/Custom_Toaste.dart';
import '../../utils/custom widgets/custom_textfeild.dart';
import 'individual_meeting_painters.dart';

class PainterEngamentInvite extends StatefulWidget {
  PainterEngamentInvite({
    super.key,
  });
  @override
  State<PainterEngamentInvite> createState() => _PainterEngamentInviteState();
}

class _PainterEngamentInviteState extends State<PainterEngamentInvite> {
  final painterDataController = Get.find<PainterDataController>();
  final TextEditingController phoneNumberEditingController = TextEditingController();
  final TextEditingController painterNameEditingController = TextEditingController();
  final TextEditingController cardNumberEditingController = TextEditingController();
  late FToast fToast;
  bool showAdditionalFields = false;
  String? Type;
  String? Area;

  @override
  void initState() {
    super.initState();
    fToast = FToast();

    // Show success toast when this screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fToast.init(context);

      // Show the "Add Detail Successful" toast
      CustomToastText('Add Detail Successful');
    });
  }

  // Function to handle search button press
  void handleSearch() {
    String cardNumber = cardNumberEditingController.text.trim();
    String phoneNumber = phoneNumberEditingController.text.trim();
    if ((cardNumber.isEmpty && phoneNumber.isEmpty) ||
        (cardNumber.length < 16 && phoneNumber.length < 11)) {
      // Case 1 & 2: Both are empty OR both are incomplete
      CustomToastText('Please enter a valid card number or phone number');
    } else if (phoneNumber.isNotEmpty && phoneNumber.length == 11 && !phoneNumber.startsWith('03')) {
      // Case 3: Phone number does NOT start with 03
      CustomToastText('Please Enter Painter Number 03210089760 (11 Digit)');
    } else if ((phoneNumber.length == 11 && phoneNumber.startsWith('03')) ||
        cardNumber.length == 16) {
      // Case 4 & 5: Phone number is valid OR card number is complete
      setState(() {
        CustomToastText('This number is not exist in system please fill the fields');
        showAdditionalFields = true;
      });
    }
  }
  void handleAddPainter() {
    String phoneNumber = phoneNumberEditingController.text.trim();
    String painterName = painterNameEditingController.text.trim();

    // Validate phone number
    if (phoneNumber.isEmpty || phoneNumber.length != 11 || !phoneNumber.startsWith('03')) {
      CustomToastText('Please enter a valid phone number (e.g., 03210089760 - 11 digits)');
      return;
    }

    // Validate painter name
    if (painterName.isEmpty) {
      CustomToastText('Please enter painter name');
      return;
    }

    // Validate type
    if (Type != 'PAINTER' && Type != 'LAB CONTRACTOR') {
      CustomToastText('Please select Type');
      return;
    }

    // Validate area
    if (Area == null || Area == 'Please Select Area') {
      CustomToastText('Please select Area');
      return;
    }

    // All validations passed, navigate
    painterDataController.cardNumber.value=cardNumberEditingController.text.trim();
    painterDataController.phoneNumber.value=phoneNumberEditingController.text.trim();
    painterDataController.painterName.value=painterNameEditingController.text.trim();
    painterDataController.cardNumber.value=cardNumberEditingController.text.trim();
    painterDataController.type.value=Type!;
    painterDataController.cardNumber.value=Area!;

    Get.to(PainterEngagementInvite1(
    ));
  }



  List<String> type = [
    'Please Select Type',
    'PAINTER',
    'LAB CONTRACTOR'
  ];
  List<String> area = [
    'Please Select Area',
    'AREA 1',
    'AREA 2',
    'AREA 3',
    'AREA 4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background Image
          BackgroundImage(),
          // Content layer
          SingleChildScrollView(
            child: Positioned(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // App Bar
                  CustomAppbar(title: 'painter engagement',onPreesed: () {
    Get.offAll(IndividualMeetingPainters());
                  }),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      "${painterDataController.city.value} (${painterDataController.city.value})",
                      style: TextStyle(
                        color: AppColors.redColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
            
                  // Main form content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Card Number with Search icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * (0.7),
                                child: CustomTextField(
                                  keyboardType: TextInputType.phone,
                                  maxLength: 16,
                                  label: " Card Number",
                                  controller: cardNumberEditingController,
                                ),
                              ),
                            ),
                            // Search button
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
            
                        // Phone Number field
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomTextField(
                            keyboardType: TextInputType.phone,
                            maxLength: 11,
                            showCharCount: true,
                            label: " Phone Number",
                            controller: phoneNumberEditingController,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CustomTextField(
                            keyboardType: TextInputType.name,
                            maxLength: 20,
                            showCharCount: false,
                            label: " Painter Name",
                            controller: painterNameEditingController,
                          ),
                        ),
                        // These fields only show after search
                        if (showAdditionalFields) ...[
                          // Painter Name field
            
                          SizedBox(height: 10),
            
                          // Type dropdown
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CustomDropdownFeild(
                                title: 'Type',
                                width: MediaQuery.of(context).size.width*(0.8),
                                items: type,
                                onChanged: (s){
                                  if (s != null) {
                                    setState(() {
                                      Type = s;
                                    });
                                  }
                                }
                            ),
                          ),
                          SizedBox(height: 10),
            
                          // Area dropdown
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CustomDropdownFeild(
                                title: '* Area',
                                width: MediaQuery.of(context).size.width*(0.8),
                                items: area,
                                onChanged: (s){
                                  if (s != null) {
                                    setState(() {
                                      Area = s;
                                    });
                                  }
                                }
                            ),
                          ),
                          SizedBox(height: 15),
            
                          // Add Painter button
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: CustomButton1(
                                text: 'ADD PAINTER',
                                onPressed: handleAddPainter
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
