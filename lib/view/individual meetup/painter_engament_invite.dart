import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/custom%20widgets/background_image.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_dropdownfeild.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom widgets/custom_appbar.dart';
import '../new painter induction/painter_card_allocation_view.dart';

class PainterEngamentInvite extends StatefulWidget {
  String? city;
  PainterEngamentInvite(
      {super.key, this.city, String? location, String? giveaway});

  @override
  State<PainterEngamentInvite> createState() => _PainterEngamentInviteState();
}

class _PainterEngamentInviteState extends State<PainterEngamentInvite> {
  final TextEditingController phoneNumberEditingController =
      TextEditingController();
  final TextEditingController painterNameEditingController =
      TextEditingController();
  final TextEditingController cardNumberEditingController =
      TextEditingController();
  void initState() {
    super.initState();
    // Show simple details added message when this screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Container(
            margin: EdgeInsets.all(50),
            height: 50,
            width: MediaQuery.of(context).size.width * (0.7),
            child: Center(child: Text('Add Details Successfully')),
            decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.all(Radius.circular(28))),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          duration: Duration(milliseconds: 800),
        ),
      );
    });
  }
  List<String> type=[
    'Please Select Type',
    'PAINTER',
    'LAB CONTRACTOR'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Change to transparent
      body: Stack(
        children: [
          // Background Image - This will fill the entire screen
          BackgroundImage(),
          // Content layer
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomAppbar(title: 'Painter engagement'),
                SizedBox(
                  height: 10,
                ),
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
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                          Padding(
                            padding: const EdgeInsets.only(right: 7),
                            child: Icon(
                              Icons.search_rounded,
                              size: 28,
                              color: AppColors.redColor,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CustomTextField(
                          keyboardType: TextInputType.phone,
                          maxLength: 11,
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
                          label: " Painter Name",
                          controller: painterNameEditingController,
                        ),
                      ),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                CustomDropdownFeild(title: 'Type',width: MediaQuery.of(context).size.width*(0.7), items: type, onChanged: (s){}),
                SizedBox(height: 10),
                CustomDropdownFeild(title: '* Area',width: MediaQuery.of(context).size.width*(0.7), items: type, onChanged: (s){}),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
