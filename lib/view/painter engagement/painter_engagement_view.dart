import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';

class PainterEngagementView extends StatelessWidget {
  const PainterEngagementView({super.key});

  void showCityBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 150,
            child: Center(
              child: Text(
                "Please select a city",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
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
          insetPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Month", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.close, color: Colors.white, size: 18),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Three option pills
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      pill("This Month"),
                      pill("Since Last Month"),
                      pill("Since Last Two Month"),
                    ],
                  ),

                  SizedBox(height: 20),

                  // City label
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("City", style: TextStyle(fontWeight: FontWeight.w600)),
                  ),

                  SizedBox(height: 8),

                  // Clickable City Field
                  GestureDetector(
                    onTap: () => showCityBottomSheet(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Please select a city", style: TextStyle(color: Colors.grey[600])),
                          Icon(Icons.arrow_drop_down, color: Colors.grey),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 25),

                  // Buttons Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Show Result", style: TextStyle(color: Colors.white)),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.red, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Clear", style: TextStyle(color: Colors.red)),
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

  Widget pill(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.red,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: AppColors.primaryColor,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    "INDIVIDUAL MEETUPS PAINTER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                    ),
                  ),
                  Positioned(
                    right: 15,
                    child: GestureDetector(
                      onTap: () => showCustomFilterDialog(context),
                      child: Image.asset(
                        "assets/images/ic_filter.png",
                        height: 20,
                        width: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content Placeholder
            Expanded(
              child: Center(
                child: Text("Main content goes here"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
