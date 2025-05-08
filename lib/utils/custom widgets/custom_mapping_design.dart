import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/view/Mapping/mapping_controller.dart';
import 'package:mapleleaf/utils/app_colors.dart';

class MappingCustomDesign extends StatelessWidget {
  final MappingController controller = Get.put(MappingController());
  final String title;
  MappingCustomDesign({super.key,required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      color:
      AppColors.primaryColor,
      child:SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.blackColor,
          appBar: AppBar(
            backgroundColor: AppColors.blackColor,
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'DEALER',
                  style: TextStyle(color: AppColors.whiteColor),
                ),
                const SizedBox(width: 12),
                SvgPicture.asset(
                  "assets/images/refresh.svg",
                  height: 25,
                  width: 25,
                  color: AppColors.lightOrange,
                )
              ],
            ),
            actions: const [
              SizedBox()
            ],
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Container(
                padding: const EdgeInsets.only(bottom: 20),
                decoration: const BoxDecoration(
                  color: AppColors.grey504E4EColor

                  ,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Custom City Dropdown
                    GestureDetector(
                      onTap: () => _showCityDropdown(context),
                      child: Obx(() => Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 34, bottom: 25, left: 16, right: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.selectedCity.value.isEmpty
                                      ? "Please Select City"
                                      : controller.selectedCity.value,
                                  style: const TextStyle(color: AppColors.blackColor),
                                ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 4,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                  'City',
                                  style: AppFonts.styleHarmoniaBold16W600(Color(0xFFFF6F08))
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),


                    const SizedBox(height: 16),

                    // Custom Dealer Dropdown (similar to the City dropdown)
                    GestureDetector(
                      onTap: () => _showDealerDropdown(context),
                      child: Obx(() => Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 34, bottom: 25, left: 16, right: 16),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.selectedDealer.value.isEmpty
                                      ? "Please Select Dealer"
                                      : controller.selectedDealer.value,
                                  style: const TextStyle(color: AppColors.blackColor),
                                ),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 4,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                  'Dealer',
                                  style: AppFonts.styleHarmoniaBold16W600(Color(0xFFFF6F08))
                              ),
                            ),
                          ),
                        ],
                      )),
                    ),


                    const SizedBox(height: 16),

                    // Placeholder for Google Map
                    Container(
                      height: 200,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: const Text("Google Map Placeholder"),
                    ),

                    const SizedBox(height: 24),

                    // TAG Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightOrange,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),

                        child: const Text(
                          "TAG",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // City Dropdown
  void _showCityDropdown(BuildContext context) {
    final RxString searchText = ''.obs;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 32),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select a City",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    onChanged: (value) => searchText.value = value.toLowerCase(),
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Search City",
                      hintStyle: const TextStyle(color: Colors.black45),
                      prefixIcon: const Icon(Icons.search, color: AppColors.grey8E8E8EColor),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 12),
                  Obx(() {
                    final filtered = controller.cities
                        .where((city) => city.toLowerCase().contains(searchText.value))
                        .toList();

                    return ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 300),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: filtered.length,
                        itemBuilder: (_, index) {
                          final city = filtered[index];
                          return ListTile(
                            title: Text(city, style: const TextStyle(color: Colors.black)),
                            onTap: () {
                              controller.selectedCity.value = city;
                              Navigator.pop(context);
                            },
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(color: Colors.grey),
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Close",
                        style: TextStyle(color: AppColors.redColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Dealer Dropdown
  void _showDealerDropdown(BuildContext context) {
    final RxString searchText = ''.obs;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 32),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select a Dealer",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    onChanged: (value) => searchText.value = value.toLowerCase(),
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: "Search Dealer",
                      hintStyle: const TextStyle(color: Colors.black45),
                      prefixIcon: const Icon(Icons.search, color: AppColors.grey8E8E8EColor),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 12),
                  Obx(() {
                    final filtered = controller.dealers
                        .where((dealer) => dealer.toLowerCase().contains(searchText.value))
                        .toList();

                    return ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 300),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: filtered.length,
                        itemBuilder: (_, index) {
                          final dealer = filtered[index];
                          return ListTile(
                            title: Text(dealer, style: const TextStyle(color: Colors.black)),
                            onTap: () {
                              controller.selectedDealer.value = dealer;
                              Navigator.pop(context);
                            },
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(color: Colors.grey),
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Close",
                        style: TextStyle(color: AppColors.redColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}