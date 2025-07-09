import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/app_colors.dart';
import 'package:mapleleaf/utils/app_fonts.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button.dart';
import 'package:mapleleaf/utils/custom%20widgets/custom_button1.dart';
import '../../utils/custom widgets/custom_dropdown1.dart';
import '../../utils/custom widgets/custom_textfeild.dart';

class CCView extends StatefulWidget {
  const CCView({super.key});

  @override
  State<CCView> createState() => _CcViewState();
}

class _CcViewState extends State<CCView> {
  TextEditingController area = TextEditingController();
  final RxString customer = ''.obs;
  final RxList<String> customerList = <String>[
    'Customer 1',
    'Customer 2',
    'Customer 3',
    'Customer 4',
    'Customer 5',
  ].obs;

  @override
  Widget build(BuildContext context) {
    final media1 = MediaQuery.of(context).size.width * 0.84;
    final media = MediaQuery.of(context).size.width * 0.85;
    final media2 = MediaQuery.of(context).size.width * 0.93;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/menu_bg.png",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    CustomDropdown1(
                      label: '* General Customer',
                      selectedValue: customer,
                      items: customerList,
                      titleColor: AppColors.primaryColor,
                      parentContext: context,
                      height: 80,
                      width: media1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField1(
                      label: '* Enter Total Application Area sq.ft',
                      controller: area,
                      width: media,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 35,
                      width: 200,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                        child: Text(
                          'CALCULATE',
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Acrylic Putty',
                      style: AppFonts.styleHarmoniaBold18W6000(AppColors.primaryColor),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 340,
                      width: media2,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'No.of Buckets required:',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Primary Cost:Rs',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Primer Labour Cost:',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Acrylic Putty Cost:Rs',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Labour Cost:Rs',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Paint Cost:Rs',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Paint Labour Cost:Rs',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Total Cost:Rs',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
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
                    SizedBox(height: 30,),
                    Text(
                      'hdPutty',
                      style: AppFonts.styleHarmoniaBold18W6000(AppColors.primaryColor),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      height: 260,
                      width: media2,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'No.of Bags required:',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'hdputty Cost:Rs',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Labour Cost:Rs',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Paint Cost:Rs',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Paint Labour Cost:Rs',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.shade400, thickness: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Total Cost:Rs',
                                      style: AppFonts.styleHarmoniaBold18W6000(
                                          AppColors.blackColor),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 35),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.right,
                                        style: AppFonts.styleHarmoniaRegular18W400(
                                            AppColors.blackColor),
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
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('With hdputty:',style: AppFonts.styleHarmoniaBold18W6000(AppColors.blackColor),),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('You will Save Rs  ',style: AppFonts.styleHarmoniaBold18W6000(AppColors.blackColor),),
                                  Text('0  ',style: AppFonts.styleHarmoniaBold18W6000(AppColors.primaryColor),),
                                  Text('today.',style: AppFonts.styleHarmoniaBold18W6000(AppColors.blackColor),),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('You will Save Rs  ',style: AppFonts.styleHarmoniaBold18W6000(AppColors.blackColor),),
                                  Text('0  ',style: AppFonts.styleHarmoniaBold18W6000(AppColors.primaryColor),),
                                  Text('after 3 Years.',style: AppFonts.styleHarmoniaBold18W6000(AppColors.blackColor),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
