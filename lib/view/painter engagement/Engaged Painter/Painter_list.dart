
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/PE/Painter_Engaged_Controller.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import '../../../utils/custom widgets/custom_filter.dart';
import 'add_lead.dart';

class PainterList extends StatelessWidget {
   PainterList({super.key});


  PainterEngagedController painterEngagedController=Get.find<PainterEngagedController>();

  @override
  Widget build(BuildContext context) {
    final media=MediaQuery.of(context).size;


    // ScrollController to manage the scrollbar
    final ScrollController scrollController = ScrollController();

    return SafeArea(
      child: Scrollbar(
        controller: scrollController,
        thickness: 5.0,  // Width of the scrollbar
        radius: const Radius.circular(10.0),  // Rounded corners
        // Always show the scrollbar thumb
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      width: media.width,
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
                  GestureDetector(
                    onTap: () {
                      // showCustomFilterDialog(context);
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
            ListView.builder(
              shrinkWrap: true,
              controller: scrollController,  // Connect the ScrollController
              padding: const EdgeInsets.all(10),
              itemCount: painterEngagedController.engagedPainterList.length,
              itemBuilder: (context, index) {
                final painterData=painterEngagedController.engagedPainterList[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12), // Space between items
                  child: Container(
                    height: 55, // Fixed height
                    width: media.width * (0.7), // Width of device
                    decoration: BoxDecoration(
                      color: painterData.isPainter=='OLD'? AppColors.selectColor:AppColors.primaryColor, // Red container
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 26,right: 10),
                      child: Row(
                        children: [
                          // Name on the left with flexible width
                          Expanded(
                            child: Text(
                              painterData.painterName.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Phone number with fixed width for alignment
                          Container(
                            width: 110, // Fixed width for consistent alignment
                            margin: const EdgeInsets.only(left: 8),
                            child: Text(
                              painterData.phoneNumber.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          const SizedBox(width: 8), // Consistent space before icon
                          InkWell(onTap: () {
                            // Navigate to AddLead screen with the selected painter's data
                            Get.to(() => AddLead(), arguments: {
                              'name': painterData.painterName,
                              'phone': painterData.phoneNumber,
                            });
                          },child: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20)),
                          SizedBox(width: 5,),

                          Container(height: 20.h,width: 20.w,

                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            shape: BoxShape.circle
                          ),

                          child: Center(child: Text(painterData.leadCount.toString(),
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600
                          ),
                          ),

                          ),)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}