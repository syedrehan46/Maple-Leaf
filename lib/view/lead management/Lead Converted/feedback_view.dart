import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';

// Custom FocusNode to disable focus behavior for read-only fields
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class FeedbackScreen extends StatelessWidget {
  // TextEditingControllers
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
  final TextEditingController kGSController = TextEditingController(text: "25");
  final TextEditingController kgstwoController = TextEditingController(text: "0");
  final TextEditingController kgsthreeController = TextEditingController(text: "0");
  final TextEditingController fiveController = TextEditingController(text: "5");
  final TextEditingController twentyController = TextEditingController(text: "0");
  final TextEditingController twentyRegController = TextEditingController(text: "0");

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

                        _buildTextfield("Expected KGS", expectedKgsController, readOnly: true),
                        _buildTextfield("Shop Name", shopNameController, readOnly: true),

                        Row(
                          children: [
                            Expanded(child: _buildTextfield("No of Bags 5 KG Putty", fiveController, readOnly: false)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("KG'S", kGSController, readOnly: true)),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(child: _buildTextfield("No of Bags 20 KG Putty", twentyController, readOnly: false)),
                            const SizedBox(width: 6),
                            Expanded(child: _buildTextfield("KG'S", kgstwoController, readOnly: true)),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(child: _buildTextfield("No of Bags 20 KG Regular", twentyRegController, readOnly: false)),
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

  // Reusable TextField widget
  Widget _buildTextfield(String label, TextEditingController controller, {bool readOnly = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        focusNode: readOnly ? AlwaysDisabledFocusNode() : null,
        enableInteractiveSelection: !readOnly,
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
