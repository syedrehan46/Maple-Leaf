import 'package:flutter/material.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/ui_helper.dart';
import 'package:mapleleaf/view/individual%20meetup/UserLead%20Page/add_leads_view.dart';
import 'package:mapleleaf/view/new%20painter%20induction/painter_card_allocation_view.dart';

import '../../controller/IM/Individual Painter/individual_painter_controller.dart';
import '../../controller/NPI/new_painter_induction_controller.dart';
import '../../utils/custom widgets/custom_appbar.dart';
import '../../utils/custom widgets/painter_card_allocation_custom.dart';

class NewPainterInductionView extends StatelessWidget {
  NewPainterInductionView({super.key});

  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = "Please Select City".obs;
  final RxString selectedStatus = "Please Select Status".obs;
  final TextEditingController textEditingController = TextEditingController();
  final controller = Get.put(NewPainterInductionController());

  Widget buildDropdown(String label, List<String> items, RxString selectedValue) {
    String dropdownValue = items.first;

    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " $label",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color(0xffD2F6F9FB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    isExpanded: true,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        selectedValue.value = dropdownValue;
                      });
                    },
                    selectedItemBuilder: (BuildContext context) {
                      return items.map((String value) {
                        return Text(
                          value,
                          style: const TextStyle(color: Colors.black),
                        );
                      }).toList();
                    },
                    items: items.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                            color: value == items.first ? Colors.red : Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/menu_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              CustomAppbar(
                title: 'NEW PAINTER INDUCTION',
                timeLocationIsVisible: true,
              ),

              Expanded(
                child: Obx(() {
                  return ListView.builder(
                    itemCount: controller.newPainterInductionList.length,
                    itemBuilder: (context, index) {
                      final painter = controller.newPainterInductionList[index];

                      return GestureDetector(
                        onTap: () {
                          Get.to(PainterCardAllocationCustom(
                            painterinduction: painter,
                          ));
                        },
                        child: UiHelper.customListItem(
                          context: context,
                          title: painter.painterName ?? '',
                          phoneNumber: painter.phoneNumber ?? '',
                          location: painter.areaName ?? '',
                          date: painter.creationDate ?? '',
                          city: painter.cityName ?? '',
                          padding: 12,
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
