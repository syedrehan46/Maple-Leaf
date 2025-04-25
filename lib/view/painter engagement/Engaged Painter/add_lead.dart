import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class AddLead extends StatefulWidget {
  const AddLead({super.key});

  @override
  State<AddLead> createState() => _AddLeadState();
}

class _AddLeadState extends State<AddLead> {
  String? selectedArea;
  final List<String> areas = [
      'AL MADNI TOWN', 'AL SADDIQ WELFARE', 'ARSAL TOWN', ' BILAL TOWN', 'EID GAH ROAD',
    'FAROOQ TOWN', 'GARDEN TOWN', 'GULSHAN TOWN', 'GT ROAD', 'GUJAR PUR',
    'HAMZA BAIG SOCIETY', 'IQBAL ROAD', 'JAMEEL TOWN', 'JEHLUM BAZAR', 'KAREEM HOUSING',
    'MALIK NAFEES TOWN', 'MOHALLA MEHFOOZABAD', 'MANGLA CHOWK', 'ORANGI TOWN', 'ROHTAS ROAD','SATELLITE TOWN','SHANDAR CHOWK'
  ];
  List<String> filteredAreas = [];
  final TextEditingController searchController = TextEditingController();

  // Text editing controllers with empty initial values
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredAreas = List.from(areas);
  }

  void filterAreas(String query) {
    setState(() {
      filteredAreas = areas.where((area) =>
          area.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  void showAreaSelectionDialog() {
    // Reset search before showing dialog
    searchController.clear();
    filteredAreas = List.from(areas);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                width: double.maxFinite,
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header "Select Item"
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Text(
                        "Select Item",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    // Search Bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        ),
                        onChanged: (value) {
                          setDialogState(() {
                            filteredAreas = areas.where((area) =>
                                area.toLowerCase().contains(value.toLowerCase())).toList();
                          });
                        },
                      ),
                    ),

                    // Area List
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: filteredAreas.length,
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.grey.shade400,
                            ),
                          );
                        },
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(filteredAreas[index]),
                            onTap: () {
                              setState(() {
                                selectedArea = filteredAreas[index];
                              });
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 80,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.redColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Text(
                      "ADD LEADS",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Display ONLY the painter name if passed from previous screen
              if (Get.arguments != null && Get.arguments['name'] != null)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Text(
                      '${Get.arguments['name']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.redColor,
                      ),
                    ),
                  ),
                ),

              // Form fields
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name TextField - always empty
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "*Enter Customer Name and Address",
                        labelText: "*Enter Customer Name and Address",
                        labelStyle: TextStyle(color: Colors.grey.shade700),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.redColor, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      ),
                    ),

                    const SizedBox(height: 20),

                    //
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.grey.shade700),
                        hintText: "*Enter Customer Number",
                        labelText: "*Enter Customer Number",
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.redColor, width: 2),
                        ),
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Area Text
                    const Text(
                      '*Areas',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),

                    const SizedBox(height: 10),

                    // Area Selection Field that shows dialog on tap
                    InkWell(
                      onTap: showAreaSelectionDialog,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              selectedArea ?? 'Please select area',
                              style: TextStyle(
                                color: selectedArea == null ? Colors.grey.shade700 : Colors.black,
                              ),
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Add Lead Button
                    Center(
                      child: InkWell(
                        onTap: () {
                           // Or navigate to another screen after adding
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * (0.8),
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColors.redColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Add Lead',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}