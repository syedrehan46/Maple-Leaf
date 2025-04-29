import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapleleaf/utils/app_colors.dart';

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
      // backgroundColor: Colors.red[700],
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "PORTFOLIO", 
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),

      body: Stack(
        children: [
         Positioned.fill(child: Image.asset("assets/images/menu_bg.png",fit: BoxFit.cover,)),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextField("Painter Phone", "03355150650"),
                  buildTextField("Painter Name", "KAMRAN"),
                  buildTextField("Customer Contact No", "03355150650"),
                  buildTextField("Customer Name and Address", "null"),
                  buildTextField("Plan Type", "INDIVIDUAL MEETUP PAINTER"),
                  buildDropdown(
                      "Site Visit", ["Please select Site Visit", "Yes", "No"]),

                  buildDropdown("Special Incentive",
                      ["Please select Special Incentive", "YES", "NO"]),
                  buildDropdown("Painter Auto Conversion",
                      ["Please select Painter auto Conversion", "YES", "NO"]),
                  buildDropdown("Sample Applied",
                      ["Please select Sample Applied", "Yes", "No"]),
                  buildDropdown("Converted To Sale",
                      ["Please select Converted to Sale", "Yes", "No"]),

                  // Follow up Date button
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
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Color(0xffD2F6F9FB),
                  borderRadius: BorderRadius.circular(8),
                  // border: Border.all(color: Colors.grey.shade400),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: items.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
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