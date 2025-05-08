import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mapleleaf/utils/custom%20widgets/background_image.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';
import 'package:mapleleaf/view/individual%20meetup/painter_engagement_invite1.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/custom widgets/Custom_Toaste.dart';
import '../../utils/custom widgets/custom_textfeild.dart';
import 'individual_meeting_painters.dart';

class PainterEngamentInvite extends StatefulWidget {
  String? city;
  String? location;
  String? giveaway;
  PainterEngamentInvite({
    super.key,
    this.city,
    this.location,
    this.giveaway
  });
  @override
  State<PainterEngamentInvite> createState() => _PainterEngamentInviteState();
}

class _PainterEngamentInviteState extends State<PainterEngamentInvite> {
  final TextEditingController phoneNumberEditingController = TextEditingController();
  final TextEditingController painterNameEditingController = TextEditingController();
  final TextEditingController cardNumberEditingController = TextEditingController();
  late FToast fToast;
  bool showAdditionalFields = false;
  String? selectedType;
  String? selectedArea;

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

  // Custom toast implementation
  void showCustomToast(String message) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey.shade700,
      ),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(milliseconds: 1200),
    );
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
  // Function to handle ADD PAINTER button press
  void handleAddPainter() {
    // Get values
    String cardNumber = cardNumberEditingController.text.trim();
    String painterNumber = phoneNumberEditingController.text.trim();
    String painterName = painterNameEditingController.text.trim();

    // Validate all together
    if (painterNumber.isEmpty ||
        painterName.isEmpty ||
        selectedType == 'Please Select Type' ||
        selectedArea == 'Please Select Area') {

      // Show appropriate messages based on what’s missing
      if (painterNumber.isEmpty) {
        CustomToastText('Please enter Phone number');
      } else if (painterName.isEmpty) {
        CustomToastText('Please enter Painter name');
      } else if (selectedType == 'Please Select Type') {
        CustomToastText('Please select Type');
      } else if (selectedArea == 'Please Select Area') {
        CustomToastText('Please select Area');
      }
      return;
    }

    // All fields are valid, navigate

      Get.to(PainterEngagementInvite1(
        city: widget.city,
        painterName: painterName,
        painterNumber: painterNumber,
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
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.redColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: (){Get.off(IndividualMeetingPainters());}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,)),
                              Text('PAINTER ENGAGEMENT',style: AppFonts.styleHarmoniaBold18W600()),
                              SizedBox(width: MediaQuery.of(context).size.width*(10/360),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      "${widget.city ?? ''} ${widget.city != null ? '(${widget.city})' : ''}",
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
                                      selectedType = s;
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
                                      selectedArea = s;
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