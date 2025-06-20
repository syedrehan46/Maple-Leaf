import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/model/LM/Lead%20Converted/lead_converted_model.dart';
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

  RxList<String> cityList = [''].obs;
  RxList<String> statusList = [''].obs;

  /// ✅ Fetch data with optional filters
  Future<void> fetchLeadGeneratedData(
      int selectedMonth, {
        String? city,
        String? status,
      }) async {
    EasyLoading.show(status: 'Loading...');
    try {
      String salesForceId = authController.salesForceId;
      String baseUrl;

      // Choose API based on selected month
      switch (selectedMonth) {
        case 0:
          baseUrl = ApiRoutes.apiLmGeneratedTwoWeeks;
          break;
        case 1:
          baseUrl = ApiRoutes.apiLmGeneratedLastThirtyDays;
          break;
        case 2:
          baseUrl = ApiRoutes.apiLmGeneratedLastTwoMonth;
          break;
        default:
          baseUrl = ApiRoutes.apiLmGeneratedTwoWeeks;
      }

      // Build dynamic query parameters
      final queryParams = {
        'salesForceId': salesForceId,
        if (status != null && status.isNotEmpty && !status.contains("Please"))
          'status': status,
        if (city != null && city.isNotEmpty && !city.contains("Please"))
          'city': city,
      };

      final queryString = Uri(queryParameters: queryParams).query;
      final url = "$baseUrl?$queryString";
      print("Final API URL: $url");

      // API Call
      ApiResponse response = await NetworkCall.getApiCallWithToken(url);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final List<dynamic> data = jsonDecode(response.responseString!);
        print("Data coming >> $data");

        allLeads.value =
            data.map((e) => LeadConvertedModel.fromJson(e)).toList();
        leadGeneratedList.value = allLeads;

        final Set<String> statuses = allLeads
            .map((e) => (e.leadStatus ?? '').toUpperCase())
            .toSet();

        statusList.value = statuses.toList();
      } else {
        errorMessage.value = response.errorMsg ?? 'Unknown error occurred';
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorMessage.value = 'An error occurred: $e';
      print('Fetch Error: $e');
    }
  }

  // ✅ Optional — only used if you want to filter locally instead of from API
  void applyFilters() {
    final String city = selectedCity.value.trim().toUpperCase();
    final String status = selectedStatus.value.trim().toUpperCase();

    leadGeneratedList.value = allLeads.where((lead) {
      final leadCity = (lead.customerName ?? '').trim().toUpperCase();
      final leadStatus = (lead.leadStatus ?? '').trim().toUpperCase();

      final cityMatches = city.isEmpty || leadCity == city;
      final statusMatches = status.isEmpty || leadStatus == status;

      return cityMatches && statusMatches;
    }).toList();
  }

  // ✅ Fetch city names for dropdown
  RxList<String> cityNameList = <String>[].obs;
  RxList<LeadConvertedModel> cityDetail = <LeadConvertedModel>[].obs;

  Future<void> fetchCityDetail() async {
    EasyLoading.show(status: 'Loading...');
    try {
      String lmSalesId = authController.salesForceId;
      String url = "${ApiRoutes.apiLmCityList}?lmSalesId=$lmSalesId";

      ApiResponse response = await NetworkCall.getApiCallWithToken(url);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final List<dynamic> data = jsonDecode(response.responseString!);

        cityDetail.value =
            data.map((e) => LeadConvertedModel.fromJson(e)).toList();

        cityNameList.value = data
            .map((e) => e['CITY_NAME']?.toString() ?? '')
            .where((name) => name.isNotEmpty)
            .toSet()
            .toList();

        print("City Names: $cityNameList");
      } else {
        errorMessage.value = response.errorMsg ?? 'Unknown error occurred';
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorMessage.value = 'An error occurred: $e';
      print('Fetch Error: $e');
    }
  }

  @override
  void onInit() {
    fetchLeadGeneratedData(0);
    fetchCityDetail();
    super.onInit();
  }
}
