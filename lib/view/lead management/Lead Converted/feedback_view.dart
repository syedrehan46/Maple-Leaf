import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';

// Custom FocusNode to disable focus behavior for read-only fields
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class FeedbackScreen extends StatelessWidget {
  // TextEditingControllers
  final TextEditingController painterController =
  TextEditingController(text: "03121000221");
  final TextEditingController painterNameController =
  TextEditingController(text: "Maple Employee");
  final TextEditingController customerContactController =
  TextEditingController(text: "03164442037");
  final TextEditingController customerNameAddressController =
  TextEditingController(text: "M ALI");
  final TextEditingController siteVisitController =
  TextEditingController(text: "YES");
  final TextEditingController productSoldController =
  TextEditingController(text: "YES");
  final TextEditingController sampleController =
  TextEditingController(text: "YES");
  final TextEditingController convertedToSaleController =
  TextEditingController(text: "YES");
  final TextEditingController painterConversionController =
  TextEditingController(text: "YES");
  final TextEditingController specialIncentivesController =
  TextEditingController(text: "YES");
  final TextEditingController expectedKgsController =
  TextEditingController(text: "25 KG");
  final TextEditingController shopNameController =
  TextEditingController(text: "MILLI PIANTS");
  final TextEditingController kGSController = TextEditingController(text: "25");
  final TextEditingController kgstwoController =
  TextEditingController(text: "0");
  final TextEditingController kgsthreeController =
  TextEditingController(text: "0");
  final TextEditingController fiveController = TextEditingController(text: "5");
  final TextEditingController twentyController =
  TextEditingController(text: "0");
  final TextEditingController twentyRegController =
  TextEditingController(text: "0");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "FEEDBACK",
          style: TextStyle(
              color: Color(0xffF7F7F7), fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Colors.white,
          ),
        ),
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/menu_bg.png",fit: BoxFit.cover,)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              // Added scroll in case of overflow
              child: Column(
                children: [
                  _buildTextfield("Painter Phone", painterController, readOnly: true),
                  _buildTextfield("Painter Name", painterNameController, readOnly: true),
                  _buildTextfield("Customer Contact No", customerContactController, readOnly: true),
                  _buildTextfield("Customer Name and Address", customerNameAddressController, readOnly: true),

                  // Row 1
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextfield("Site Visit", siteVisitController, readOnly: true),
                      ),
                      const SizedBox(width: 4), // Reduced spacing
                      Expanded(
                        child: _buildTextfield("Product Sold", productSoldController, readOnly: true),
                      ),
                    ],
                  ),

                  // Row 2
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextfield("Sample Applied", sampleController, readOnly: true),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: _buildTextfield("Converted To Sale", convertedToSaleController, readOnly: true),
                      ),
                    ],
                  ),

                  // Row 3
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextfield("Painter Conversion", painterConversionController, readOnly: true),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: _buildTextfield("Special Incentives", specialIncentivesController, readOnly: true),
                      ),
                    ],
                  ),
                  _buildTextfield("Expected KGS", expectedKgsController, readOnly: true),
                  _buildTextfield("MILLI PAINTS", shopNameController, readOnly: true),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextfield("No of bags 5 KG Putty", fiveController, readOnly: false),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: _buildTextfield("KG'S", kGSController, readOnly: true),
                      ),
                    ],
                  ),

                  // Row 2
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextfield("No of Bags 20 KG Putty", twentyController, readOnly: false),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: _buildTextfield("KG'S", kgstwoController, readOnly: true),
                      ),
                    ],
                  ),

                  // Row 3
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextfield("No of Bags 20 KG Rep...", twentyRegController, readOnly: false),
                      ),
                      SizedBox(width: 6),
                      Expanded(
                        child: _buildTextfield("KG'S", kgsthreeController, readOnly: true),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable TextField builder
  Widget _buildTextfield(String label, TextEditingController controller, {bool readOnly = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        focusNode: readOnly ? AlwaysDisabledFocusNode() : null, // Prevent focus
        enableInteractiveSelection: !readOnly, // Disable copy/paste menu
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: readOnly ? AppColors.primaryColor: AppColors.primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
