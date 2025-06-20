import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/utils/custom%20widgets/calender.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom widgets/custom_appbar.dart';
import '../../utils/custom widgets/custom_button1.dart';
import '../../utils/custom widgets/custom_dropdown1.dart';
import '../../utils/custom widgets/custom_textfeild.dart';

class IsForm extends StatefulWidget {
  const IsForm({super.key});

  @override
  State<IsForm> createState() => _IsFormState();
}

class _IsFormState extends State<IsForm> {
  final TextEditingController customerContactController = TextEditingController();
  final TextEditingController customerNameAddressController = TextEditingController();
  final TextEditingController secoundPersonNameController = TextEditingController();
  final TextEditingController secoundPersonNumberController = TextEditingController();
  RxInt selectedPainterIndex = 0.obs;
  final RxBool isReferralSelected = false.obs;

  final RxList<String> myTextList = <String>[
    'First Text',
    'Second Text',
    'Third Text',
    'Fourth Text',
  ].obs;

  final List<String> labelOptions = [
    '*Painter No',
    '*Wallet No',
    '*New Painter No',
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size.width * 0.85;
    final media1 = MediaQuery.of(context).size.width * 0.84;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/menu_bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  CustomAppbar(title: 'Individual Sites'),
                  const SizedBox(height: 20),
                  CustomDropdown1(
                    label: '*Via',
                    items: myTextList,
                    selectedValue: myTextList.first.obs,
                    parentContext: context,
                    width: media1,
                    height: 80,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField1(
                    label: '*Customer Contact No',
                    controller: customerContactController,
                    showCharCount: true,
                    maxLength: 11,
                    width: media,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField1(
                    label: '*Customer Name and Address',
                    controller: customerNameAddressController,
                    width: media,
                  ),
                  const SizedBox(height: 10),
                  CustomDropdown1(
                    label: '*City',
                    items: myTextList,
                    selectedValue: myTextList.first.obs,
                    parentContext: context,
                    width: media1,
                    height: 80,
                  ),
                  const SizedBox(height: 10),
                  CustomDropdown1(
                    label: '*Area',
                    items: myTextList,
                    selectedValue: myTextList.first.obs,
                    parentContext: context,
                    width: media1,
                    height: 80,
                  ),
                  const SizedBox(height: 10),
                  Obx(() => GestureDetector(
                    onTap: () => isReferralSelected.value = !isReferralSelected.value,
                    child: Container(
                      height: 80,
                      width: media,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blackColor, width: 1),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.greyA4A4A4Color),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isReferralSelected.value
                                            ? AppColors.primaryColor
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Text('You want to refer this Lead'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                  const SizedBox(height: 10),
                  Obx(() => isReferralSelected.value
                      ? Column(
                    children: [
                      CustomDropdown1(
                        label: '*Referral Areas',
                        items: myTextList,
                        selectedValue: myTextList.first.obs,
                        parentContext: context,
                        width: media1,
                        height: 80,
                      ),
                      const SizedBox(height: 10),
                      CustomDropdown1(
                        label: '*Sales Officer',
                        items: myTextList,
                        selectedValue: myTextList.first.obs,
                        parentContext: context,
                        width: media1,
                        height: 80,
                      ),
                    ],
                  )
                      : const SizedBox.shrink()),
                  const SizedBox(height: 10),
                  CustomDropdown1(
                    label: '*Second Person Type',
                    items: myTextList,
                    selectedValue: myTextList.first.obs,
                    parentContext: context,
                    width: media1,
                    height: 80,
                  ),
                  SizedBox(height: 10),
                  CustomDropdown1(
                    label: '*Soft Account Holders',
                    items: myTextList,
                    selectedValue: myTextList.first.obs,
                    parentContext: context,
                    width: media1,
                    height: 80,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField1(
                    label: '*Enter Second Person Name',
                    controller: secoundPersonNameController,
                    width: media,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField1(
                    label: '*Second Person Number',
                    controller: secoundPersonNumberController,
                    showCharCount: true,
                    maxLength: 11,
                    width: media,
                  ),
                  const SizedBox(height: 10),
                  CustomDropdown1(
                    label: 'Third Person Type',
                    items: myTextList,
                    selectedValue: myTextList.first.obs,
                    parentContext: context,
                    width: media1,
                    height: 80,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField1(
                    label: 'Enter Third Person Name',
                    controller: customerContactController,
                    width: media,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField1(
                    label: 'Enter Third Person Number',
                    controller: customerContactController,
                    showCharCount: true,
                    maxLength: 11,
                    width: media,
                  ),
                  const SizedBox(height: 10),
                  CustomDropdown1(
                    label: '*House Size',
                    items: myTextList,
                    selectedValue: myTextList.first.obs,
                    parentContext: context,
                    width: media1,
                    height: 80,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 80,
                    width: media,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blackColor, width: 1),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.only(bottom: 10,top: 10,right: 10),
                    child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(3, (index) {
                        final List<String> options = [
                          "Painter\nNo",
                          "Wallet\nNo",
                          "New\nPainter No"
                        ];
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => selectedPainterIndex.value = index,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColors.greyA4A4A4Color),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: selectedPainterIndex.value == index
                                            ? AppColors.primaryColor
                                            : Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Flexible(
                                  child: Text(
                                    options[index],
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    )),
                  ),
                  const SizedBox(height: 10),
                  Obx(() => CustomTextField1(
                    label: labelOptions[selectedPainterIndex.value],
                    controller: customerContactController,
                    width: media,
                  )),
                  const SizedBox(height: 10),
                  CustomTextField1(
                    label: '*Expected Kgs',
                    controller: customerContactController,
                    width: media,
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: media,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '*Planned Visit Date',
                              style: TextStyle(color: AppColors.grey8E8E8EColor),
                            ),
                            SizedBox(height: 4), // for spacing
                            Container(
                              width: 155, // set desired width here
                              height: 1,   // thickness of divider
                              color: Colors.black,
                            ),
                          ],
                        ),
                        Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: AppColors.activeColor,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Planned Visit Date',
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(onTap: (){
                    showCustomDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      onDateSelected: (pickedDate) {
                        print("User picked: $pickedDate");
                        // Do whatever you want with the date
                      },
                    );
                  },
                    child: Container(
                      width: media,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '*Select Date of Make Activity',
                                style: TextStyle(color: AppColors.grey8E8E8EColor),
                              ),
                              SizedBox(height: 4), // for spacing
                              Container(
                                width: 205, // set desired width here
                                height: 1,   // thickness of divider
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              color: AppColors.activeColor,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'MKT Date',
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  CustomButton1(
                    text: 'ADD',
                    onPressed: () {},
                    width: 0.85,
                    height: 45,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
