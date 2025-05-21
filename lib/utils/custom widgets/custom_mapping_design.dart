import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/view/Maple%20Lead/Dealers/Job%20Detail/custom_toast.dart';

import '../../view/Maple Lead/Dealers/Job Detail/custom_dropdown_view.dart';
import '../../view/Maple Lead/Dealers/Mapping/mapping_controller.dart';

class MappingCustomDesign extends StatelessWidget {
  final MappingController controller = Get.put(MappingController());
  final String title;
  final bool isAreaShow;
  MappingCustomDesign({super.key,required this.title,this.isAreaShow=false
  });
 void handleTag(BuildContext context){
   if(controller.selectedCity.isEmpty || controller.selectedCity == "Please Select * City"){
     CustomToast("Please Select City ", context: context);
     return;
   }
   if(controller.selectedDealer.isEmpty || controller.selectedDealer == "Please Select * City"){
     CustomToast("Please Select Dealer ", context: context);
     return;
   }else{
     CustomToast("Dealer is Tagged ", context: context);
   }
 }
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
                    CustomDropdownField(
                      label: '* City',
                      selectedValue: controller.selectedCity,
                      items: controller.cities,
                      parentContext: context,
                    ),


                    const SizedBox(height: 16),

                    // Custom Dealer Dropdown (similar to the City dropdown)
                    CustomDropdownField(
                      label: '* Dealer',
                      selectedValue: controller.selectedDealer,
                      items: controller.dealers,
                      parentContext: context,
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
                        onPressed: () {handleTag(context);},
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

}