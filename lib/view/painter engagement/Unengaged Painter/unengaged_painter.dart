import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mapleleaf/utils/app_colors.dart';
class UnengagedPainter extends StatelessWidget {
  UnengagedPainter({super.key});
  bool isUnEngagedSelected = true;
  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = "Please Select City".obs;

  @override
  Widget build(BuildContext context) {
    final List<String> cities = [
      "Please Select City", // First red item
      "CHARHOI",
      "DANDI DARA",
      "DINA",
      "JHELUM",
      "KHARIAN",
      "KOTLA",
      "SARAI ALAMGIR",
    ];

    void showCustomFilterDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) {

          return Dialog(
            backgroundColor: AppColors.whiteColor,
            insetPadding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            decoration: const BoxDecoration(color: AppColors.redColor, shape: BoxShape.circle),
                            padding: const EdgeInsets.all(4),
                            child: const Icon(Icons.close, color: Colors.white, size: 20,),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("City", style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(height: 10),

                    // City Dropdown
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Obx(() => DropdownButton<String>(
                        value: selectedCity.value,
                        isExpanded: true,
                        underline: Container(), // Remove the default underline
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            selectedCity.value = newValue;
                          }
                        },
                        items: cities.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: value == "Please Select City" ? Colors.black : Colors.black,
                              ),
                            ),
                          );
                        }).toList(),
                      )),
                    ),

                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        ),
                        onPressed: () {
                          print("SHOW SUMMARY tapped");
                        },
                        child: const Text("SHOW SUMMARY", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("SHOW RESULT", style: TextStyle(color: Colors.white)),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: AppColors.primaryColor, width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          onPressed: () {
                            selectedIndex.value = -1;
                            selectedCity.value = "Please Select City";
                          },
                          child: Text("CLEAR", style: TextStyle(color: AppColors.primaryColor)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F5F7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(hintText: "Search", border: InputBorder.none,hintStyle: TextStyle(color: Colors.black)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Icon(Icons.search,color: AppColors.redColor,),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    showCustomFilterDialog(context);
                  },
                  child: Image.asset(
                    'assets/images/ic_filter.png',
                    height: 24,
                    width: 24,
                    color: AppColors.redColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(child: Center(child: Text(('Please use the search or filter to view Painters'),style: TextStyle(color: AppColors.redColor,fontWeight: FontWeight.bold),),)),
        ],
      ),
    );;
  }
}
