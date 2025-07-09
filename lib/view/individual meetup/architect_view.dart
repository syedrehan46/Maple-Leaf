import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/IM/Individual%20Painter/architect_builder._controller.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Custom%20Widgets/custom_apbar_view.dart';

class ArchitectView extends StatefulWidget {
  @override
  State<ArchitectView> createState() => _ArchitectViewState();
}

class _ArchitectViewState extends State<ArchitectView> {
  final searchController = TextEditingController();
  final controller = Get.put(ArchitectBuilderController());

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Architect/Builder"),
      body: Column(
        children: [
          const SizedBox(height: 16),

          // 🔍 Search Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              controller: searchController,
              onChanged: controller.searchArchitects,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: null,



              ),
            ),
          ),

          const SizedBox(height: 12),



          const SizedBox(height: 8),

          // 📋 Architect List View
          Expanded(
            child: Obx(() {
              if (controller.errorMessage.value.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, size: 48, color: Colors.red),
                      const SizedBox(height: 16),
                      Text(
                        controller.errorMessage.value,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: controller.fetchArchitectDetail,
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                );
              }

              if (controller.allArchitectList.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inbox_outlined, size: 48, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        "No architects found",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ],
                  ),
                );
              }

              if (controller.filteredArchitectList.isEmpty && controller.isSearchActive) {
                return const SizedBox.shrink(); // <- ⛔ nothing shown if no result
              }

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: controller.filteredArchitectList.length,
                itemBuilder: (context, index) {
                  final item = controller.filteredArchitectList[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: Text(
                                  item.personName ?? '',
                                  style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Text(
                                item.phoneNumber ?? '',
                                style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Center(
                          child: Text(
                            item.cityName ?? '',
                            style: AppFonts.styleHarmoniaBold16W600(AppColors.whiteColor),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
