import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';

// Custom FocusNode to disable focus behavior for read-only fields
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class PorfolioTwoView extends StatefulWidget {
  const PorfolioTwoView({super.key});

  @override
  State<PorfolioTwoView> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<PorfolioTwoView> {
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
  final TextEditingController individualMeetupPainterController =
  TextEditingController(text: "INDIVIDUAL MEETUP PAINTER");
  final TextEditingController dateController =
  TextEditingController(text: "10-APR-2025");


  @override
  void dispose() {
    painterController.dispose();
    painterNameController.dispose();
    customerContactController.dispose();
    customerNameAddressController.dispose();
    siteVisitController.dispose();
    productSoldController.dispose();
    sampleController.dispose();
    convertedToSaleController.dispose();
    painterConversionController.dispose();
    specialIncentivesController.dispose();
    expectedKgsController.dispose();
    shopNameController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "PORTFOLIO",
          style: TextStyle(
              color: Color(0xffF7F7F7),
              fontWeight: FontWeight.bold,
              fontSize: 16),
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
              child: Column(
                children: [
                  _buildTextfield("Painter Phone", painterController, readOnly: true),
                  _buildTextfield("Painter Name", painterNameController, readOnly: true),
                  _buildTextfield("Customer Contact No", customerContactController, readOnly: false),
                  _buildTextfield("Customer Name and Address", customerNameAddressController, readOnly: false),
                  _buildTextfield("Plan Type",individualMeetupPainterController , readOnly: true),
                  _buildTextfield("Shop Name", shopNameController, readOnly: true),
                  _buildTextfield("Expected KGS", expectedKgsController, readOnly: true),
                  _buildTextfield("Further Follow Up Date", dateController, readOnly: true),



                  // 🔁 Updated 3 rows below with same layout style as above
                  Row(
                    children: [
                      Expanded(child: _buildTextfield("Site Visit", siteVisitController, readOnly: true)),
                      const SizedBox(width: 4),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

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
          labelStyle: TextStyle(color: Color(0xff504E4E)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
