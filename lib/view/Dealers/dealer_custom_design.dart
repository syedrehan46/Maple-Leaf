import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DealerCustomDesign extends StatefulWidget {
  const DealerCustomDesign({super.key});

  @override
  State<DealerCustomDesign> createState() => _DealerCustomDesignState();
}

class _DealerCustomDesignState extends State<DealerCustomDesign> {
  final TextEditingController dealerNameController = TextEditingController();
  final TextEditingController proprietorNameController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController cnicExpiryController = TextEditingController();
  final TextEditingController ntnController = TextEditingController();
  final TextEditingController strnController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController shopOfficeNumberController = TextEditingController();
  final TextEditingController phone1Controller = TextEditingController();
  final TextEditingController phone2Controller = TextEditingController();

  Future<void> _pickDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  Widget customTextField(String label,
      {TextEditingController? controller,
        TextInputType? keyboardType,
        bool isRequired = false,
        int? maxLength}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isRequired ? '* $label' : label,
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
          Focus(
            onFocusChange: (hasFocus) {
              setState(() {}); // Refresh to change the border color on focus
            },
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              maxLength: maxLength,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                counterText: "",
                filled: true,
                fillColor: Colors.grey,
                border: InputBorder.none, // Remove the default border

                enabledBorder: UnderlineInputBorder(

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget dateFieldWithButton(String label, String buttonText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("* $label", style: const TextStyle(fontSize: 14, color: Colors.white)),
                TextField(
                  controller: controller,
                  readOnly: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: '',
                    filled: true,
                    fillColor: Colors.grey,
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.all(Radius.circular(12)),
                    // ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade700,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () => _pickDate(controller),
            child: Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202427),
      appBar: AppBar(
        title: const Text("Dealer Form", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Customer Type",
                style: TextStyle(color: Colors.orange.shade700, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(16),
              ),
              child: DropdownButtonFormField<String>(
                value: "Dealer",
                dropdownColor: Colors.grey.shade800,
                style: const TextStyle(color: Colors.black),
                iconEnabledColor: Colors.black,
                decoration: const InputDecoration(border: InputBorder.none),
                items: const [
                  DropdownMenuItem(value: "Dealer", child: Text("Dealer")),
                  DropdownMenuItem(value: "Retailer", child: Text("Retailer")),
                ],
                onChanged: (val) {},
              ),
            ),
            const SizedBox(height: 16),
            customTextField("Enter Dealer Name", isRequired: true, controller: dealerNameController),
            customTextField("Enter Proprietor Name", isRequired: true, controller: proprietorNameController),
            customTextField("Enter CNIC (3520223239872)", isRequired: true, controller: cnicController, keyboardType: TextInputType.number, maxLength: 13),
            dateFieldWithButton("Select CNIC Expiry Date", "CNIC EXPIRY", cnicExpiryController),
            customTextField("Enter NTN", controller: ntnController),
            customTextField("Enter STRN", controller: strnController),
            dateFieldWithButton("Select Date of birth", "DOB", dobController),
            customTextField("Enter Shop Office Number", controller: shopOfficeNumberController, keyboardType: TextInputType.phone, maxLength: 11),
            customTextField("Enter Phone 1", isRequired: true, controller: phone1Controller, keyboardType: TextInputType.phone, maxLength: 11),
            customTextField("Enter Phone 2", controller: phone2Controller, keyboardType: TextInputType.phone, maxLength: 11),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                ),
                onPressed: () {
                  // Handle submission
                },
                child: const Text("SUBMIT", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
