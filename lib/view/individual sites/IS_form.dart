import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/auth_controller.dart';
import 'package:mapleleaf/model/IS/Area%20Wise%20Planning%20User/areawise_model.dart';
import 'package:mapleleaf/utils/custom%20widgets/calender.dart';
import '../../controller/IS/is_controller.dart';
import '../../model/IS/area/area_model.dart';
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
  final TextEditingController painterNumberController = TextEditingController(); // New controller for painter field
  RxInt selectedPainterIndex = 0.obs;
  final RxBool isReferralSelected = false.obs;
  final Rx<DateTime?> selectedPlannedVisitDate = Rx<DateTime?>(null);
  final Rx<DateTime?> selectedMktDate = Rx<DateTime?>(null);

  final RxList<String> personTypeList = <String>[
    'LABOR CONTRACTOR',
    'SUB CONTRACTOR',
    'PAINTER',
    'LABOUR',
    'ARCHITECT',
    'ATTENDANT',
  ].obs;
  final RxList<String> type = <String>[
    'HOME OWNER',
    'PROJECT',
    'SOCIETY OFFICE',
  ].obs;
  final RxList<String> houseSizelist = <String>[
    '250sqy',
    '500sqy',
    'Above 500sqy',
  ].obs;

  // Create separate RxString variables for each dropdown
  final RxString selectedVia = ''.obs;
  final RxString selectedCity = ''.obs;
  final RxString selectedArea = ''.obs;
  final RxString selectedReferralArea = ''.obs;
  final RxString selectedSalesOfficer = ''.obs;
  final RxString selectedSecondPersonType = ''.obs;
  final RxString selectedSoftAccountHolders = ''.obs;
  final RxString selectedThirdPersonType = ''.obs;
  final RxString selectedHouseSize = ''.obs;


  PlanModel? planModel;

  final List<String> labelOptions = [
    '*Painter No',
    '*Wallet No',
    '*New Painter No',
  ];
  int getMaxLength() {
    switch (selectedPainterIndex.value) {
      case 0: // Painter No
        return 11;
      case 1: // Wallet No
        return 16;
      case 2: // New Painter No
        return 11;
      default:
        return 11;
    }

  }
  final PlanController controller = Get.find<PlanController>();
  final AuthController authController = Get.find<AuthController>();

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
                    items: controller.viaDescriptionList,
                    selectedValue: selectedVia,
                    parentContext: context,
                    width: media1,
                    height: 80,
                    ontap: (){
                      // Reset referral selection when via changes
                      isReferralSelected.value = false;
                      selectedReferralArea.value = '';
                      selectedSalesOfficer.value = '';
                    }, titleColor: AppColors.primaryColor,
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
                    titleColor: AppColors.primaryColor,
                    label: '*City',
                    items: controller.cityNameList,
                    selectedValue: selectedCity,
                    parentContext: context,
                    width: media1,
                    height: 80,
                    ontap: () {
                      // ✅ When city is selected, fetch areas for that city
                      if (selectedCity.value.isNotEmpty) {
                        // Clear previous area selection
                        selectedArea.value = '';

                        // Get city details from the plan model
                        PlanModel? cityDetails = controller.getCityDetailsByName(selectedCity.value);

                        if (cityDetails != null) {
                          // Call fetchAreasByZoneAndCity with the city's zone and city ID
                          controller.fetchAreasByZoneAndCity(

                            salesForceId: authController.salesForceId,
                            zoneId: cityDetails.zoneId,
                            cityId: cityDetails.cityId,
                          );
                          controller.fetchReferalAreasByZoneAndCity(
                            salesForceId: authController.salesForceId,
                            zoneId: cityDetails.zoneId,
                            cityId: cityDetails.cityId,
                          );
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomDropdown1(
                    titleColor: AppColors.primaryColor,
                    label: '*Area',
                    items: controller.areaNameList,
                    selectedValue: selectedArea,
                    parentContext: context,
                    width: media1,
                    height: 80, ontap: () {

                  },
                  ),
                  const SizedBox(height: 10),
                  // Conditionally show referral widget only when selectedVia is NOT "MARKETING ACTIVITIES"
                  Obx(() => selectedVia.value != "MARKETING ACTIVITIES"
                      ? Column(
                    children: [
                      GestureDetector(
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
                      ),
                      const SizedBox(height: 10),
                      Obx(() => isReferralSelected.value
                          ? Column(
                        children: [
                          CustomDropdown1(
                            titleColor: AppColors.primaryColor,
                            label: '*Referral Areas',
                            items: controller.referralAreaNameList,
                            selectedValue: selectedReferralArea,
                            parentContext: context,
                            width: media1,
                            height: 80,
                            ontap: () {
                              if (selectedReferralArea.value.isNotEmpty) {
                                // Clear previous sales officer selection
                                selectedSalesOfficer.value = '';

                                // Get area details to fetch areaId
                                AreaModel? areaDetails = controller.getReferralAreaByName(selectedReferralArea.value);

                                if (areaDetails != null && areaDetails.areaId != null) {
                                  // Call API with areaId
                                  controller.fetchReferalAreasSalesOfiicers(areaId: areaDetails.areaId);
                                }
                              }
                            },
                          ),
                          const SizedBox(height: 10),
                          CustomDropdown1(
                            titleColor: AppColors.primaryColor,
                            label: '*Sales Officer',
                            items: controller.salesOfficerNameList,
                            selectedValue: selectedSalesOfficer,
                            parentContext: context,
                            width: media1,
                            height: 80, ontap: () {  },
                          ),
                          const SizedBox(height: 10),
                        ],
                      )
                          : const SizedBox.shrink()),
                    ],
                  )
                      : const SizedBox.shrink()),
                  CustomDropdown1(
                    titleColor: AppColors.primaryColor,
                    label: '*Second Person Type',
                    items: personTypeList,
                    selectedValue: selectedSecondPersonType,
                    parentContext: context,
                    width: media1,
                    height: 80, ontap: () {  },
                  ),
                  SizedBox(height: 10),
                Obx(() => selectedVia.value == "HUNTING"
                    ? CustomDropdown1(
                  titleColor: AppColors.primaryColor,
                  label: '*Type',
                  items: type,
                  selectedValue: selectedSoftAccountHolders,
                  parentContext: context,
                  width: media1,
                  height: 80, ontap: () {  },
                )
                    : const SizedBox.shrink()),
                SizedBox(height: 10),
                  CustomDropdown1(
                    titleColor: AppColors.primaryColor,
                    label: '*Soft Account Holders',
                    items: controller.softAccountHoldersNameList,
                    selectedValue: selectedSoftAccountHolders,
                    parentContext: context,
                    width: media1,
                    height: 80, ontap: () {  },
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
                    titleColor: AppColors.primaryColor,
                    label: 'Third Person Type',
                    items: personTypeList,
                    selectedValue: selectedThirdPersonType,
                    parentContext: context,
                    width: media1,
                    height: 80, ontap: () {  },
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
                    titleColor: AppColors.primaryColor,
                    label: '*House Size',
                    items: houseSizelist,
                    selectedValue: selectedHouseSize,
                    parentContext: context,
                    width: media1,
                    height: 80, ontap: () {  },
                  ),
                  const SizedBox(height: 20),
                Obx(() => selectedVia.value == "PAINTER"
                    ? Column(
                  children: [
                    Container(
                      height: 80,
                      width: media,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blackColor, width: 1),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.only(bottom: 10, top: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(3, (index) {
                          final List<String> options = [
                            "Painter\nNo",
                            "Wallet\nNo",
                            "New\nPainter No"
                          ];
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                selectedPainterIndex.value = index;
                                painterNumberController.clear(); // Clear on change
                              },
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
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField1(
                      label: labelOptions[selectedPainterIndex.value],
                      controller: painterNumberController,
                      showCharCount: true,
                      maxLength: getMaxLength(),
                      width: media,
                    ),
                  ],
                )
                    : const SizedBox.shrink()),
                const SizedBox(height: 5),
                  CustomTextField1(
                    label: '*Expected Kgs',
                    controller: customerContactController,
                    width: media,
                  ),
                  SizedBox(height: 10,),
              Obx(() => selectedVia.value != "MARKETING ACTIVITIES"
                  ? InkWell(
                onTap: () {
                  showCustomDatePicker(
                    context: context,
                    onDateSelected: (DateTime date) {
                      selectedPlannedVisitDate.value = date;
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedPlannedVisitDate.value != null
                                ? '${selectedPlannedVisitDate.value!.toLocal().toString().split(' ')[0]}'
                                : '*Planned Visit Date',
                            style: TextStyle(
                              fontSize: 14,
                              color: selectedPlannedVisitDate.value != null
                                  ? AppColors.blackColor
                                  : AppColors.grey8E8E8EColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 155,
                            height: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 150,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: AppColors.activeColor,
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
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
              )
                  : const SizedBox.shrink()),
              SizedBox(height: 10,),
              Obx(() => selectedVia.value == "MARKETING ACTIVITIES"
                  ? InkWell(
                onTap: () {
                  showCustomDatePicker(
                    context: context,
                    onDateSelected: (DateTime date) {
                      selectedMktDate.value = date;
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedMktDate.value != null
                                ? '${selectedMktDate.value!.toLocal().toString().split(' ')[0]}'
                                : '*Select Date of Make Activity',
                            style: TextStyle(
                              fontSize: 14,
                              color: selectedMktDate.value != null
                                  ? AppColors.blackColor
                                  : AppColors.grey8E8E8EColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 205,
                            height: 1,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      Container(
                        height: 30,
                        width: 100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: AppColors.activeColor,
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
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
              )
                  : const SizedBox.shrink()),
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