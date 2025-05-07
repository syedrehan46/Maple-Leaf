import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';
import 'package:mapleleaf/view/individual%20meetup/painter_engament_invite.dart';

class IndividualMeetup extends StatefulWidget {
  String? city;
  IndividualMeetup({super.key, this.city});

  @override
  State<IndividualMeetup> createState() => _IndividualMeetupState();
}

class _IndividualMeetupState extends State<IndividualMeetup> {
  String? selectedLocation;
  String? selectedGiveaway;
  bool isFormValid = false;

  final List<String> locations = [
    'Please Select Location',
    'CAFE',
    'SPOT',
    'SITE',
    'SHOP'
  ];

  final List<String> giveaways = [
    'Please Select Giveaway',
    'NONE',
    'FOOD AND GIVEAWAY',
    'FOOD AND FREE BAGS',
    'FOOD'
  ];

  // Validate form based on dropdown selections
  void validateForm() {
    // Check if both dropdowns have valid selections (not the first option)
    setState(() {
      isFormValid = selectedLocation != null &&
          selectedLocation != 'Please Select Location' &&
          selectedGiveaway != null &&
          selectedGiveaway != 'Please Select Giveaway';
    });
  }

  // Show message to select options
  void showSelectOptionsMessage() {
    // Check which options need to be selected
    String message = "";

    if (selectedLocation == null || selectedLocation == 'Please Select Location') {
      message += "Please select a location";
    }

    if (selectedGiveaway == null || selectedGiveaway == 'Please Select Giveaway') {
      if (message.isNotEmpty) {
        message += " and ";
      }
      message += "Please select a giveaway";
    }

    // Show message
    Get.snackbar(
      '',
      message,
      titleText: Container(), // Hide the title
      backgroundColor: Colors.transparent,
      colorText: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(100),
      duration: Duration(seconds: 1),
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
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/menu_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content layer
          Column(

            children: [
              // App bar at the top
              CustomAppbar(title: 'INDIVIDUAL MEETUPS'),
              // Main content
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "${widget.city} (${widget.city})",
                          style: TextStyle(
                            color: AppColors.redColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Location dropdown
                      CustomDropdownFeild(
                        title: '* Location',
                        items: locations,
                        onChanged: (value) {
                          setState(() {
                            selectedLocation = value;
                            validateForm();
                          });
                        },
                        hintText: '',
                        width: media.width * 0.8,
                      ),

                      SizedBox(height: 20),

                      // Giveaways dropdown
                      CustomDropdownFeild(
                        title: '* Giveaways',
                        items: giveaways,
                        onChanged: (value) {
                          setState(() {
                            selectedGiveaway = value;
                            validateForm();
                          });
                        },
                        hintText: '',
                        width: media.width * 0.8,
                      ),

                      SizedBox(height: 25),

                      // NEW Button - Always red, check validation on press
                      SizedBox(
                        width: media.width * 0.9,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.redColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            // Check if form is valid
                            if (isFormValid) {
                              // Navigate to next screen with selected values
                              Get.to(
                                PainterEngamentInvite(
                                  city: widget.city,
                                  location: selectedLocation,
                                  giveaway: selectedGiveaway,
                                ),
                              );
                            } else {
                              // Show message to select options
                              showSelectOptionsMessage();
                            }
                          },
                          child: const Text(
                            "NEW",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
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