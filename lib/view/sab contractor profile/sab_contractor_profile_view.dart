import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_appbar.dart';
import 'package:mapleleaf/utils/custom%20widgets/floatingaction_button.dart';
import 'package:mapleleaf/view/individual%20meetup/individual_meetup.dart';
class SabContractorProfileView extends StatelessWidget {
  SabContractorProfileView({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final media=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset("assets/images/menu_bg.png",
                fit: BoxFit.cover,)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomAppbar(title: 'SUB CONTRACTOR PROFILE '),
              // Search TextField
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 50,
                  width: media.width,
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
              ),
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
            ],
          ),
          
        ],
      ),
      floatingActionButton: CustomFloatingActionButton(onPressed: (){Get.to(IndividualMeetup());}),
    );
  }
}
