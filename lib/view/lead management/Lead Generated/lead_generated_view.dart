import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Generated/Portfolio%20View/porfolio_two_view.dart';
import 'package:mapleleaf/view/lead%20management/Lead%20Generated/Portfolio%20View/portfolio_view.dart';

class LeadGeneratedView extends StatefulWidget {
  const LeadGeneratedView({super.key});
  @override
  State<LeadGeneratedView> createState() => _LeadGeneratedViewState();
}
class _LeadGeneratedViewState extends State<LeadGeneratedView> {
  final RxInt selectedIndex = 0.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedStatus = ''.obs;
  final List<Map<String, dynamic>> leads = [
    {
      'id': '17684',
      'phone': '03129229292',
      'date': "13-APR-2025",
      'name': 'KAMRAN',
      'color': AppColors.redColor,
    },
    {
      'id': '17685',
      'phone': '03112345678',
      'name': 'ZAIRE',
      'date': "12-APR-2025",
      'color': AppColors.redColor,
    },
    {
      'id': '17686',
      'phone': '03219876543',
      'date': "10-APR-2025",
      'name': 'SARA',
      'color': AppColors.activeColor,
    },
  ];
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

                    /// 👇 This controls how selected item (closed state) looks
                    selectedItemBuilder: (BuildContext context) {
                      return items.map((String value) {
                        return Text(
                          value,
                          style: TextStyle(
                            color: Colors.black, // Always black when dropdown is closed
                          ),
                        );
                      }).toList();
                    },

                    /// 👇 This controls dropdown list items
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
  void showCustomFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.whiteColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Month",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: AppColors.primaryColor, shape: BoxShape.circle),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(Icons.close,
                              color: Colors.white, size: 16),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => ElevatedButton(
                        onPressed: () {
                          selectedIndex.value = 0;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedIndex.value == 0
                                ? Colors.red
                                : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding:  EdgeInsets.symmetric(
                              horizontal: 6, vertical: 0),
                        ),
                        child: const Text("This Month"),
                      )),
                      const SizedBox(width: 16),
                      Obx(() => ElevatedButton(
                        onPressed: () {
                          selectedIndex.value = 1;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedIndex.value == 1
                                ? Colors.red
                                : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                        ),
                        child: const Text("Since Last Month"),
                      )),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => ElevatedButton(
                        onPressed: () {
                          selectedIndex.value = 2;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(
                            color: selectedIndex.value == 2
                                ? Colors.red
                                : Colors.black,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                        ),
                        child: const Text("Since Last Two Month"),
                      )),
                    ],
                  ),
                  const SizedBox(height: 20),
                  buildDropdown("City", ["Please Select City","CHARHOI", "DANDI DARA", "DINA", "JHEUM", "KHARIAN", "KOTLA", "SARAI ALAMGIR"], selectedCity),
                  const SizedBox(height: 16),
                  buildDropdown("Status", ["Please Select Status","LEAD GENERATED", "PROCESSED", "CONVERTED", "CLOSE"], selectedStatus),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: const Text("SHOW RESULT",
                              style: TextStyle(color: Colors.white)),
                        ),
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
                          selectedCity.value = ''; // Reset to empty string
                          selectedStatus.value = ''; // Reset to empty string
                        },
                        child: const Text("CLEAR",
                            style: TextStyle(color:  AppColors.primaryColor)),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/menu_bg.png",fit: BoxFit.fill,)),
       Padding(
         padding: const EdgeInsets.only(top: 50),
         child: ListView.builder(
            itemCount: leads.length,
            itemBuilder: (BuildContext context, int index) {
              final lead = leads[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  12,
                  index == 0 ? 22 : 6, // double the top padding for the first item
                  12,
                  4,
                ),
                child: GestureDetector(
                  onTap: () {
                    if (lead['color'] == AppColors.activeColor) {
                      Get.to(PorfolioTwoView());
                    } else {
                      Get.to(PorfolioView());
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: lead['color'],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              lead['id'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 40),
                            Text(
                              lead['date'],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "${lead['phone']}${lead['name']}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
       ),
          CustomAppbar(title: 'Lead Generated',timeLocationIsVisible: true,),

      ]
      ),
    );
  }
}
