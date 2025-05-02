
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'add_lead.dart';

class PainterList extends StatelessWidget {
  const PainterList({super.key});

  @override
  Widget build(BuildContext context) {
    final media=MediaQuery.of(context).size;
    // Sample data for Pakistani phone numbers and names
    final List<Map<String, String>> contacts = [
      {'name': 'Ahmed Khan', 'phone': '03215678901'},
      {'name': 'Fatima Ali', 'phone': '03331234567'},
      {'name': 'Muhammad Ibrahim', 'phone': '03001234567'},
      {'name': 'Ayesha Malik', 'phone': '03451234567'},
      {'name': 'Hassan Ahmed', 'phone': '03128765432'},
      {'name': 'Zainab Qureshi', 'phone': '03078912345'},
      {'name': 'Omar Farooq', 'phone': '03361234567'},
      {'name': 'Sara Zafar', 'phone': '03245645908'},
      {'name': 'Ali Raza', 'phone': '03171234567'},
      {'name': 'M Hussain', 'phone': '03091234567'},
      {'name': 'Jamil', 'phone': '03091234567'},
      {'name': 'Waleed', 'phone': '03091234567'},
      {'name': 'Farhan', 'phone': '03091234567'},
      {'name': 'M Talha', 'phone': '03091234567'},
    ];

    // ScrollController to manage the scrollbar
    final ScrollController scrollController = ScrollController();

    return SafeArea(
      child: Scrollbar(
        controller: scrollController,
        thickness: 5.0,  // Width of the scrollbar
        radius: const Radius.circular(10.0),  // Rounded corners
        // Always show the scrollbar thumb
        child: ListView.builder(
          controller: scrollController,  // Connect the ScrollController
          padding: const EdgeInsets.all(10),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 12), // Space between items
              child: Container(
                height: 55, // Fixed height
                width: media.width * (0.7), // Width of device
                decoration: BoxDecoration(
                  color: AppColors.redColor, // Red container
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26),
                  child: Row(
                    children: [
                      // Name on the left with flexible width
                      Expanded(
                        child: Text(
                          contacts[index]['name']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Phone number with fixed width for alignment
                      Container(
                        width: 110, // Fixed width for consistent alignment
                        margin: const EdgeInsets.only(left: 8),
                        child: Text(
                          contacts[index]['phone']!,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      const SizedBox(width: 8), // Consistent space before icon
                      InkWell(onTap: () {
                        // Navigate to AddLead screen with the selected painter's data
                        Get.to(() => AddLead(), arguments: {
                          'name': contacts[index]['name'],
                          'phone': contacts[index]['phone'],
                        });
                      },child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}