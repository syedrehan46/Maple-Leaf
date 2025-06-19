import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/model/LM/Lead%20Generated/lead_generated_model.dart';
import 'package:mapleleaf/model/LM/Lead%20Processing/lead_processing_model.dart';
import '../../model/LM/Lead Converted/lead_converted_model.dart';
import '../../network/network_call.dart';
import '../../utils/api_routes.dart';
import '../auth_controller.dart';

class LeadGeneratedController extends GetxController implements GetxService {
  final AuthController authController = Get.find<AuthController>();

  RxList<LeadConvertedModel> allLeads = <LeadConvertedModel>[].obs;
  RxList<LeadConvertedModel> leadGeneratedList = <LeadConvertedModel>[].obs;
  RxString errorMessage = ''.obs;

  // Filters
  RxString selectedCity = ''.obs;
  RxString selectedStatus = ''.obs;
  RxInt selectedMonthIndex = 0.obs;


  // Dynamic filter options
  RxList<String> cityList = [''].obs;
  RxList<String> statusList = [''].obs;

  Future<void> fetchLeadGeneratedData(int selectedMonth) async {
    EasyLoading.show(status: 'Loading...');
    try {
      String salesForceId = authController.salesForceId;
      String url;

      String areaId = selectedCity.value.trim(); // or selectedAreaId if more appropriate
      String leadStatus = selectedStatus.value.trim();

      switch (selectedMonth) {
        case 0:
          url =
          "${ApiRoutes.apiLmGeneratedTwoWeeks}?salesForceId=$salesForceId&customerAreaId=$areaId&leadStatus=$leadStatus";
          break;
        case 1:
          url =
          "${ApiRoutes.apiLmGeneratedLastThirtyDays}?salesForceId=$salesForceId&leadStatus=$leadStatus";
          break;
        case 2:
          url =
          "${ApiRoutes.apiLmGeneratedLastTwoMonth}?salesForceId=$salesForceId&leadStatus=$leadStatus";
          break;
        default:
          url =
          "${ApiRoutes.apiLmGeneratedTwoWeeks}?salesForceId=$salesForceId&leadStatus=$leadStatus";
      }


      ApiResponse response = await NetworkCall.getApiCallWithToken(url);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final List<dynamic> data = jsonDecode(response.responseString!);
        allLeads.value = data.map((e) => LeadConvertedModel.fromJson(e)).toList();

        // Populate city and status lists dynamically
        final Set<String> cities = allLeads.map((e) => (e.cityName ?? '').toUpperCase()).toSet();
        final Set<String> statuses = allLeads.map((e) => (e.leadStatus ?? '').toUpperCase()).toSet();
        cityList.value = [''] + cities.toList();
        statusList.value = [''] + statuses.toList();

        applyFilters();
      } else {
        errorMessage.value = response.errorMsg ?? 'Unknown error occurred';
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorMessage.value = 'An error occurred: $e';
      print('Fetch Error: $e');
    }
  }

  void applyFilters() {
    final String city = selectedCity.value.trim().toUpperCase();
    final String status = selectedStatus.value.trim().toUpperCase();

    leadGeneratedList.value = allLeads.where((lead) {
      final leadCity = (lead.cityName ?? '').trim().toUpperCase();
      final leadStatus = (lead.leadStatus ?? '').trim().toUpperCase();

      final cityMatches = city.isEmpty || leadCity == city;
      final statusMatches = status.isEmpty || leadStatus == status;

      return cityMatches && statusMatches;
    }).toList();
  }

  @override
  void onInit() {
    fetchLeadGeneratedData(0);
    super.onInit();
  }
}
