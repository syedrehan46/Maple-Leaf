import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/painter_controller.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/view/individual%20meetup/painter_engament_invite.dart';

import '../Maple Lead/Dealers/Job Detail/custom_toast.dart';

class IndividualMeetup extends StatefulWidget {
  IndividualMeetup({super.key});

  @override
  State<IndividualMeetup> createState() => _IndividualMeetupState();
}

class _IndividualMeetupState extends State<IndividualMeetup> {
  final painterDataController = Get.find<PainterDataController>();

  String? location;
  String? giveaway;

  final List<String> locations = [
    'Please Select Location',
    'CAFE',
    'SPOT',
    'SITE',
    'SHOP'
  ];

  final List<String> giveaways = [
    'Please Select Giveaway',
    'NONE',
    'FOOD AND GIVEAWAY',
    'FOOD AND FREE BAGS',
    'FOOD'
  ];

  void showToast(String message) {
    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey.shade700,
      ),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(milliseconds: 1200),
    );
  }

  bool validateSelections() {
    if (location == null || location == locations.first) {
      if (giveaway == null || giveaway == giveaways.first) {
        CustomToast("Please select Location and Giveaways", context: context);
      } else {
        CustomToast("Please select Location", context: context);
      }
      return false;
    }
    if (giveaway == null || giveaway == giveaways.first) {
      CustomToast("Please select a Giveaways", context: context);
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/menu_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              CustomAppbar(title: 'INDIVIDUAL MEETUPS'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "${painterDataController.city.value} (${painterDataController.city.value})",
                          style: const TextStyle(
                            color: AppColors.redColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      buildDropdown("Location", locations, location, (value) {
                        setState(() => location = value);
                      }),
                      const SizedBox(height: 20),
                      buildDropdown("Giveaway", giveaways, giveaway, (value) {
                        setState(() => giveaway = value);
                      }),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: media.width * 0.9,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.redColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            if (validateSelections()) {
                              painterDataController.location.value = location!;
                              painterDataController.giveaway.value = giveaway!;
                              Get.to(() => PainterEngamentInvite(
                                location: location!,
                                giveaway: giveaway!,
                              )); // ✅ Navigate to your screen
                            }
                          },

                          child: const Text(
                            "NEW",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
        ],
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, String? selectedValue, void Function(String?) onChanged) {
    final LayerLink _layerLink = LayerLink();
    OverlayEntry? _overlayEntry;
    bool isDropdownOpen = false;

    final GlobalKey _dropdownKey = GlobalKey();

    final String headerTitle = items.first;
    final List<String> dropdownValues = items.sublist(1);

    void _removeDropdown() {
      _overlayEntry?.remove();
      _overlayEntry = null;
      isDropdownOpen = false;
    }

    void _showDropdown(BuildContext context) {
      final RenderBox renderBox = _dropdownKey.currentContext?.findRenderObject() as RenderBox;
      final Offset position = renderBox.localToGlobal(Offset.zero);
      final Size size = renderBox.size;

      _overlayEntry = OverlayEntry(
        builder: (context) => Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _removeDropdown,
                behavior: HitTestBehavior.translucent,
                child: Container(),
              ),
            ),
            Positioned(
              left: position.dx,
              top: position.dy + size.height + 4,
              width: size.width * 0.9,
              child: CompositedTransformFollower(
                link: _layerLink,
                showWhenUnlinked: false,
                offset: Offset(0, 0),
                child: Material(
                  elevation: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 50,
                        color: AppColors.primaryColor,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 12),
                        child: Text(
                          headerTitle,
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: Column(
                          children: dropdownValues.map((item) {
                            return ListTile(
                              title: Text(item),
                              onTap: () {
                                onChanged(item);
                                _removeDropdown();
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      Overlay.of(context).insert(_overlayEntry!);
      isDropdownOpen = true;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "* $label",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16, // 🔥 increase this as needed
              color: Colors.black, // optional: change color if needed
            ),
          ),

          const SizedBox(height: 4),
          CompositedTransformTarget(
            link: _layerLink,
            child: GestureDetector(
              key: _dropdownKey,
              onTap: () {
                if (!isDropdownOpen) {
                  _showDropdown(context);
                }
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedValue ?? headerTitle,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
