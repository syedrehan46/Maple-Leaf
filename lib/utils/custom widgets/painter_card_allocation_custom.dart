import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import '../../controller/NPI/new_painter_induction_controller.dart';
import '../../model/NPI/new_painter_induction_model.dart';
import '../../view/Maple Lead/Dealers/Job Detail/custom_toast.dart';
import '../app_colors.dart';
import 'custom_appbar.dart';

class PainterCardAllocationCustom extends StatefulWidget {
  final NewPainterInductionModel painterinduction;

  const PainterCardAllocationCustom({
    super.key,
    required this.painterinduction,
  });

  @override
  State<PainterCardAllocationCustom> createState() =>
      _PainterCardAllocationCustomState();
}

class _PainterCardAllocationCustomState
    extends State<PainterCardAllocationCustom> {
  final TextEditingController painterNameController = TextEditingController();
  final TextEditingController painterNumberController = TextEditingController();
  final TextEditingController customerNumberController = TextEditingController();
  final controller=Get.put(NewPainterInductionController());

  @override
  void initState() {
    super.initState();
    painterNameController.text = widget.painterinduction.painterName ?? '';
    painterNumberController.text = widget.painterinduction.phoneNumber ?? '';

  }

  @override
  void dispose() {
    painterNameController.dispose();
    painterNumberController.dispose();
    customerNumberController.dispose();
    super.dispose();
  }

  // ✅ Validates and shows popup for valid or invalid card
  void validateCardAndProceed() async {
    final cardNumber = customerNumberController.text.trim();

    if (cardNumber.isEmpty) {
      CustomToast("Please Enter Card Number", context: context);
    } else if (cardNumber.length != 16) {
      CustomToast("Card number must be 16 digits", context: context);
    } else {
      // ✅ Call API
      await controller.addCardNumberWithPainter(
        registrationId: widget.painterinduction.registrationId?.toInt() ?? 0,
        cardNumber: cardNumber,
      );
      // showCustomPopup(context);
    }
  }

  // ✅ Simulated API Call
  Future<void> addCardNumberWithPainter({
    required int registrationId,
    required String cardNumber,
  }) async {
    print("Calling API with REGISTRATION_ID: $registrationId, CARD_NUMBER: $cardNumber");
    await Future.delayed(Duration(seconds: 1));
    // Add actual API call logic here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/menu_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomAppbar(title: "PAINTER CARD ALLOCATION"),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  widget.painterinduction.planType == "IMP"
                      ? "INDIVIDUAL MEETUP PAINTER"
                      : "INDIVIDUAL MEETUP LABOR \n           CONTRACTOR",
                  style: AppFonts.styleHarmoniaBold18W600()
                      .copyWith(color: AppColors.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    CustomTextField(
                      label: "Painter Name",
                      controller: painterNameController,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: "Painter Number",
                      controller: painterNumberController,
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      label: "Enter Customer Card",
                      controller: customerNumberController,
                      keyboardType: TextInputType.number,
                      maxLength: 16,
                      showCounter: true,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                        ),
                        onPressed: validateCardAndProceed,
                        child: const Text(
                          "UPDATE",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool showCounter;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.maxLength,
    this.keyboardType,
    this.showCounter = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
    widget.controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String displayText = "* ${widget.label}";
    final int currentLength = widget.controller.text.length;
    final int? max = widget.maxLength;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            hintText: !_focusNode.hasFocus ? displayText : null,
            labelText: _focusNode.hasFocus ? displayText : null,
            labelStyle: const TextStyle(color: Color(0xff504E4E)),
            counterText: "",
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primaryColor),
            ),
          ),
        ),
        if (widget.showCounter && max != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, right: 4),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "$currentLength/$max",
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          ),
      ],
    );
  }
}

void showCustomPopup(BuildContext context,
    {bool isError = false, String? message}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 180,
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                 Icons.check_circle,
                color: isError ? Colors.red : Colors.green,
                size: 40,
              ),
              const SizedBox(height: 14),
              Text(
                'Update',
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                message ?? 'Card Submitted Successfully',
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 120,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
