import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}
class _FeedbackScreenState extends State<FeedbackScreen> {

  final TextEditingController painterController = TextEditingController(text: "03121000221");
  final TextEditingController painterNameController = TextEditingController(text: "Maple Employee");
  final TextEditingController customerContactController = TextEditingController(text: "03164442037");
  final TextEditingController customerNameAddressController = TextEditingController(text: "M ALI");
  final TextEditingController siteVisitController = TextEditingController(text: "YES");
  final TextEditingController productSoldController = TextEditingController(text: "YES");
  final TextEditingController sampleController = TextEditingController(text: "YES");
  final TextEditingController convertedToSaleController = TextEditingController(text: "YES");
  final TextEditingController painterConversionController = TextEditingController(text: "YES");
  final TextEditingController specialIncentivesController = TextEditingController(text: "YES");
  final TextEditingController expectedKgsController = TextEditingController(text: "25 KG");
  final TextEditingController shopNameController = TextEditingController(text: "MILLI PAINTS");

  final TextEditingController fiveController = TextEditingController();
  final TextEditingController twentyController = TextEditingController();
  final TextEditingController twentyRegController = TextEditingController();
  final TextEditingController kGSController = TextEditingController();
  final TextEditingController kgstwoController = TextEditingController();
  final TextEditingController kgsthreeController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // Add listeners to update KG fields when bag counts change
    fiveController.addListener(() {
      _updateKgTotal(fiveController, kGSController, 5);
    });
    twentyController.addListener(() {
      _updateKgTotal(twentyController, kgstwoController, 20);
    });
    twentyRegController.addListener(() {
      _updateKgTotal(twentyRegController, kgsthreeController, 20);
    });
  }
  // Function to update KG total based on bag count
  void _updateKgTotal(TextEditingController bagsController, TextEditingController kgController, int multiplier) {
    int bags = 0;
    // Parse the bags input as int, defaulting to 0 if invalid
    try {
      bags = int.parse(bagsController.text);
    } catch (e) {
      bags = 0;
    }
    // Update the corresponding KG field
    kgController.text = (bags * multiplier).toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Fixed Custom App Bar
          CustomAppbar(title: 'FEEDBACK', timeLocationIsVisible: false),

          // Expanded to let scroll area take remaining space
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/menu_bg.png",
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Main Content with padding
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        _buildTextfield("Painter Phone", painterController, readOnly: true),
                        _buildTextfield("Painter Name", painterNameController, readOnly: true),
                        _buildTextfield("Customer Contact No", customerContactController, readOnly: true),
                        _buildTextfield("Customer Name and Address", customerNameAddressController, readOnly: true),

                        Row(
                          children: [
                            Expanded(child: _buildTextfield("Site Visit", siteVisitController, readOnly: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("Product Sold", productSoldController, readOnly: true)),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(child: _buildTextfield("Sample Applied", sampleController, readOnly: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("Converted To Sale", convertedToSaleController, readOnly: true)),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(child: _buildTextfield("Painter Conversion", painterConversionController, readOnly: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("Special Incentives", specialIncentivesController, readOnly: true)),
                          ],
                        ),

                        _buildTextfield("Shop Name", shopNameController, readOnly: true),
                        _buildTextfield("Expected KGS", expectedKgsController, readOnly: true),

                        // First row with calculation (5 KG Putty)
                        Row(
                          children: [
                            Expanded(child: _buildTextfield("No of Bags 5 KG Putty", fiveController, readOnly: false, isNumber: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("KG'S", kGSController, readOnly: true)),
                          ],
                        ),

                        // Second row with calculation (20 KG Putty)
                        Row(
                          children: [
                            Expanded(child: _buildTextfield("No of Bags 20 KG Putty", twentyController, readOnly: false, isNumber: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("KG'S", kgstwoController, readOnly: true)),
                          ],
                        ),

                        // Third row with calculation (20 KG Regular)
                        Row(
                          children: [
                            Expanded(child: _buildTextfield("No of Bags 20 KG Regular", twentyRegController, readOnly: false, isNumber: true)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("KG'S", kgsthreeController, readOnly: true)),
                          ],
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
  Widget _buildTextfield(String label, TextEditingController controller, {bool readOnly = false, bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        focusNode: readOnly ? AlwaysDisabledFocusNode() : null,
        enableInteractiveSelection: !readOnly,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text, // Number keyboard for numeric fields
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}