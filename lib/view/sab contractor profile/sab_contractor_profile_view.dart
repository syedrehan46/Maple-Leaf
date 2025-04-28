import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/view/individual%20meetup/UserLead%20Page/add_leads_view.dart';
import 'package:mapleleaf/view/individual%20meetup/individual_meetup.dart';

class SabContractorProfileView extends StatelessWidget {
  SabContractorProfileView({super.key});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header Container
          Container(
            height: 90,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  "INDIVIDUAL MEETUPS PROFILE ",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Positioned(
                  left: 0,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),

          // Search TextField
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: textEditingController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Search",
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Placeholder for No Data Found
          Expanded(
            child: Container(
              width: double.infinity,

              child: const Center(
                child: Text(
                  "No Data Found",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),

          // GestureDetector(
          //   onTap: (){
          //     Get.to(AddLeadsView());
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 16),
          //     child: Container(
          //       height: 60,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //           color:
          //           AppColors.primaryColor,
          //           borderRadius: BorderRadius.circular(30)
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Padding(padding: const EdgeInsets.only(left: 16),
          //               child:  Text("MAPLE \n EMPLOYEE",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),)),
          //           Padding(
          //             padding: const EdgeInsets.only(right: 14.0),
          //             child: Row(
          //               children: [
          //                 Text("03164442036",style: TextStyle(fontSize: 16,color: Colors.white),),
          //                 Icon(Icons.arrow_forward_ios,size: 25,color: Colors.white,),
          //                 Container(height: 25,width: 25,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),child: Center(child: Text("1",style: TextStyle(color: AppColors.primaryColor),),),)
          //
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0),
          //   child: GestureDetector(
          //     onTap: (){Get.to(AddLeadsView());},
          //     child: Container(
          //       height: 60,
          //       width: double.infinity,
          //       decoration: BoxDecoration(
          //           color:
          //           AppColors.primaryColor,
          //           borderRadius: BorderRadius.circular(30)
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Padding(padding: const EdgeInsets.only(left: 16),
          //               child:  Text("YFFUR",style: TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),)),
          //           Padding(
          //             padding: const EdgeInsets.only(right: 14.0),
          //             child: Row(
          //               children: [
          //                 Text("03242454646",style: TextStyle(fontSize: 16,color: Colors.white),),
          //                 Icon(Icons.arrow_forward_ios,size: 25,color: Colors.white,),
          //                 // Container(height: 25,width: 25,decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),child: Center(child: Text("1",style: TextStyle(color: AppColors.primaryColor),),),)
          //
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // )

          // Spacer to push the button to the bottom
        ],
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(IndividualMeetup());
        },
        backgroundColor: const Color(0xff207E39),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 40,
        ),
        shape: const CircleBorder(),
      ),
    );
  }
}
