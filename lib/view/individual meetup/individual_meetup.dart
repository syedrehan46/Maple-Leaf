import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';

class IndividualMeetup extends StatefulWidget {
  const IndividualMeetup({super.key});

  @override
  State<IndividualMeetup> createState() => _IndividualMeetupState();
}

class _IndividualMeetupState extends State<IndividualMeetup> {
  String? selectedLocation;
  String? selectedGiveaway;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(title: 'INDIVIDUAL MEETUPS'),
          Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/menu_bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "DANDI DARA (DANDI DARA)",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Location Dropdown
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "* Location",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.black434343,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffD2F6F9FB),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonFormField<String>(

                        isDense: true,

                        decoration: const InputDecoration.collapsed(hintText: ""),
                        value: selectedLocation ?? locations.first,
                        dropdownColor: AppColors.whiteColor,
                        onChanged: (value) {
                          setState(() {
                            selectedLocation = value;
                          });
                        },
                        items: locations.map((location) {
                          return DropdownMenuItem<String>(
                            value: location,
                            child: Text(
                              location,
                              style: TextStyle(
                                color: location == locations.first ? Colors.red : Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        selectedItemBuilder: (BuildContext context) {
                          return locations.map((location) {
                            return Text(
                              location,
                              style: const TextStyle(color: Colors.black),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Giveaways Dropdown
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "* Giveaways",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: AppColors.black434343,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffD2F6F9FB),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: DropdownButtonFormField<String>(
                        isDense: true,
                        decoration: const InputDecoration.collapsed(hintText: ""),
                        value: selectedGiveaway ?? giveaways.first,
                        dropdownColor: AppColors.whiteColor,
                        onChanged: (value) {
                          setState(() {
                            selectedGiveaway = value;
                          });
                        },
                        items: giveaways.map((giveaway) {
                          return DropdownMenuItem<String>(
                            value: giveaway,
                            child: Text(
                              giveaway,
                              style: TextStyle(
                                color: giveaway == giveaways.first ? Colors.red : Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                        selectedItemBuilder: (BuildContext context) {
                          return giveaways.map((giveaway) {
                            return Text(
                              giveaway,
                              style: const TextStyle(color: Colors.black),
                            );
                          }).toList();
                        },
                      ),
                    ),
                    const SizedBox(height: 30),

                    // NEW Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          // Add your logic here
                        },
                        child: const Text(
                          "NEW",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
