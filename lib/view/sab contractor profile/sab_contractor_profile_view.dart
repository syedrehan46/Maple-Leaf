import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/SCP/scp_controller.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom%20widgets/floatingaction_button.dart';
import 'package:mapleleaf/view/individual%20meetup/individual_meetup.dart';
import 'package:mapleleaf/view/painter%20engagement/Engaged%20Painter/add_lead.dart';

class SabContractorProfileView extends StatelessWidget {
  SabContractorProfileView({super.key});
  final TextEditingController textEditingController = TextEditingController();
  final SCPController controller = Get.put(SCPController());

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/menu_bg.png",
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              CustomAppbar(title: 'SUB CONTRACTOR PROFILE'),
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
              // ✅ Wrap ListView in Expanded to fix layout
              Expanded(
                child: Obx(() {
                  if (controller.painterNameList.isEmpty ||
                      controller.painterNumberList.isEmpty) {
                    return Center(child: Text("No Data Found"));
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: controller.painterNameList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(24)
                        ),
                        
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.painterNameList[index],
                                style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    controller.painterNumberList[index],
                                    style: AppFonts.styleHarmoniaBold14W600(AppColors.whiteColor),
                                  ),
                                  SizedBox(width: 10,),
                                  InkWell(onTap: (){
                                    Get.to(AddLead());
                                  },child: Icon(Icons.arrow_forward_ios_sharp,color: AppColors.whiteColor,size: 15,))
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
