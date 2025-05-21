import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';

class CustomRadioButton extends StatefulWidget {
  final String title;
  final ValueChanged<String>? onChanged;
  final bool showSecondaryRadio;

  const CustomRadioButton({
    super.key,
    required this.title,
    this.onChanged,
    this.showSecondaryRadio = false, // default is hidden
  });

  @override
  _CustomYesNoRadioState createState() => _CustomYesNoRadioState();
}

class _CustomYesNoRadioState extends State<CustomRadioButton> {
  String selectedValue = "NO";
  String secondaryValue = "NO";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Primary Radio Group (Dealer Cum Retailer)
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          color: AppColors.grey9E9EA2Color,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  widget.title,
                  style: AppFonts.styleHarmoniaBold14W600(const Color(0xFFB31D1E)),
                ),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: AppColors.primaryColor,
                        value: "YES",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                          widget.onChanged?.call(selectedValue);
                        },
                      ),
                      const Text("YES"),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: AppColors.primaryColor,
                        value: "NO",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value!;
                          });
                          widget.onChanged?.call(selectedValue);
                        },
                      ),
                      const Text("NO"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // Secondary Radio Group (Existing Retailer), displayed when the first radio button is YES
        if (widget.showSecondaryRadio)
          Padding(
            padding: const EdgeInsets.only( top: 8),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: AppColors.grey9E9EA2Color,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Existing Retailer",
                      style: AppFonts.styleHarmoniaBold14W600(const Color(0xFFB31D1E)),
                    ),
                  ),
                  const SizedBox(width: 39),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio<String>(
                            activeColor: AppColors.primaryColor,
                            value: "YES",
                            groupValue: secondaryValue,
                            onChanged: (value) {
                              setState(() {
                                secondaryValue = value!;
                              });
                              // No external callback
                            },
                          ),
                          const Text("YES"),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Radio<String>(
                            activeColor: AppColors.primaryColor,
                            value: "NO",
                            groupValue: secondaryValue,
                            onChanged: (value) {
                              setState(() {
                                secondaryValue = value!;
                              });
                              // No external callback
                            },
                          ),
                          const Text("NO"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
