import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';

class PorfolioView extends StatefulWidget {
  const PorfolioView({super.key});

  @override
  State<PorfolioView> createState() => _PorfolioViewState();
}

class _PorfolioViewState extends State<PorfolioView> {
  String followUpDate = " * Follow up date";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Fixed Custom AppBar
          CustomAppbar(title: 'PORTFOLIO',),

          // Scrollable content below
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  // Background image
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/menu_bg.png",
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Content container
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildTextField("Painter Phone", "03355150650"),
                        buildTextField("Painter Name", "KAMRAN"),
                        buildTextField("Customer Contact No", "03355150650"),
                        buildTextField("Customer Name and Address", "null"),
                        buildTextField("Plan Type", "INDIVIDUAL MEETUP PAINTER"),
                        buildDropdown("Site Visit", [
                          "Please select Site Visit",
                          "Yes",
                          "No"
                        ]),
                        buildDropdown("Special Incentive", [
                          "Please select Special Incentive",
                          "YES",
                          "NO"
                        ]),
                        buildDropdown("Painter Auto Conversion", [
                          "Please select Painter auto Conversion",
                          "YES",
                          "NO"
                        ]),
                        buildDropdown("Sample Applied", [
                          "Please select Sample Applied",
                          "Yes",
                          "No"
                        ]),
                        buildDropdown("Converted To Sale", [
                          "Please select Converted to Sale",
                          "Yes",
                          "No"
                        ]),

                        // Follow-up section
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 16),
                          child: Row(
                            children: [
                              const Text(
                                "Further Follow Up",
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () => _selectDate(context),
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red[700],
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(followUpDate),
                              ),
                            ],
                          ),
                        ),

                        // Update Button
                        Center(
                          child: SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // handle submission logic here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red[700],
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                "UPDATE INFORMATION",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
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

  Widget buildTextField(String label, String initialValue, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(

        controller: TextEditingController(text: initialValue),
        maxLines: maxLines,
        decoration: InputDecoration(

          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items) {
    String dropdownValue = items.first;
    bool isMenuOpen = false;

    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "* $label",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    value: dropdownValue,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    onTap: () {
                      // Set menu state to open when tapped
                      setState(() {
                        isMenuOpen = true;
                      });
                    },
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        // Reset menu state when selection made
                        isMenuOpen = false;
                      });
                    },
                    selectedItemBuilder: (BuildContext context) {
                      return items.map<Widget>((String item) {
                        // When dropdown is closed, selected item is gray
                        return Container(
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          color: Colors.grey.shade200,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(item),
                        );
                      }).toList();
                    },
                    items: items.map<DropdownMenuItem<String>>(
                          (String value) {
                        // Get index of current item
                        int index = items.indexOf(value);

                        // First item is red when menu is open, others white
                        Color backgroundColor = index == 0
                            ? AppColors.redColor   // Red background for first item
                            : Colors.white;        // White background for other items

                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            color: backgroundColor,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                            child: Text(
                              value,
                              style: TextStyle(
                                color: index == 0 ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 0)),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        followUpDate = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }
}