import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';

class IndividualMeetup extends StatefulWidget {
  const IndividualMeetup({super.key});

  @override
  State<IndividualMeetup> createState() => _IndividualMeetupState();
}

class _IndividualMeetupState extends State<IndividualMeetup> {
  String? selectedLocation;
  String? selectedGiveaway;

  final List<String> locations = ['CAFE', 'SPOT', 'SITE', 'SHOP'];
  final List<String> giveaways = [
    'NONE',
    'FOOD AND GIVEAWAY',
    'FOOD AND FREE BAGS',
    'FOOD'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 22,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "INDIVIDUAL MEETUPS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
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
              height: 50, // Increased height
              decoration: BoxDecoration(
                color: const Color(0xffD2F6F9FB),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButtonFormField<String>(
                isDense: true,
                decoration: const InputDecoration.collapsed(hintText: "Please Select Location"),
                value: selectedLocation,
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value;
                  });
                },
                items: locations.map((location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(location),
                  );
                }).toList(),
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
              height: 50, // Increased height
              decoration: BoxDecoration(
                color: const Color(0xffD2F6F9FB),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButtonFormField<String>(
                isDense: true,
                decoration: const InputDecoration.collapsed(hintText: "Please Select Giveaway"),
                value: selectedGiveaway,
                onChanged: (value) {
                  setState(() {
                    selectedGiveaway = value;
                  });
                },
                items: giveaways.map((giveaway) {
                  return DropdownMenuItem<String>(
                    value: giveaway,
                    child: Text(giveaway),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),

            // NEW BUTTON
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
                  // Action here
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
            )
          ],
        ),
      ),
    );
  }
}
