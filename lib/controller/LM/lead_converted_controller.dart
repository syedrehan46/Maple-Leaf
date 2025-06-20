import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../model/LM/Lead Converted/lead_converted_model.dart';
import '../../network/network_call.dart';
import '../../utils/api_routes.dart';
import '../auth_controller.dart';

class LeadConvertedController extends GetxController implements GetxService {
  final AuthController authController = Get.find<AuthController>();

  RxList<LeadConvertedModel> allLeads = <LeadConvertedModel>[].obs;
  RxList<LeadConvertedModel> leadConvertedList = <LeadConvertedModel>[].obs;
  RxString errorMessage = ''.obs;

  // Filters
  RxString selectedCity = ''.obs;
  RxString selectedStatus = ''.obs;
  RxInt selectedMonthIndex = 0.obs;

  RxList<String> cityList = <String>[].obs;
  RxList<String> statusList = <String>[].obs;

  RxList<String> retailerList = <String>[].obs;
  RxList<String> productList = <String>[].obs;

  /// ✅ Fetch converted data with optional filters
  Future<void> fetchLeadConvertedData(
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
          baseUrl = ApiRoutes.apiLmConvertedTwoWeeks;
          break;
        case 1:
          baseUrl = ApiRoutes.apiLmConvertedLastThirtyDays;
          break;
        case 2:
          baseUrl = ApiRoutes.apiLmConvertedLastTwoMonth;
          break;
        default:
          baseUrl = ApiRoutes.apiLmConvertedTwoWeeks;
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
        final dynamic rawData = jsonDecode(response.responseString!);

        if (rawData is List) {
          final List<dynamic> data = rawData;

          // Parse LeadConvertedModel
          allLeads.value = data
              .where((e) => e is Map<String, dynamic>)
              .map((e) => LeadConvertedModel.fromJson(e as Map<String, dynamic>))
              .toList();

          leadConvertedList.value = allLeads;

          // Get status list
          final Set<String> statuses = allLeads
              .map((e) => (e.leadStatus ?? '').toUpperCase())
              .toSet();
          statusList.value = statuses.toList();

          // Extract products & retailers
          Set<String> allProducts = {};
          Set<String> allRetailers = {};

          for (var item in data) {
            if (item is Map<String, dynamic>) {
              if (item["products"] != null && item["products"] is List) {
                allProducts.addAll(List<String>.from(item["products"]));
              }
              if (item["retailers"] != null && item["retailers"] is List) {
                allRetailers.addAll(List<String>.from(item["retailers"]));
              }
            }
          }

          productList.value = ["Select Product Sold", ...allProducts.toList()];
          retailerList.value = ["Select Retailer", ...allRetailers.toList()];
        } else {
          errorMessage.value = 'Invalid response format: not a list';
        }
      } else {
        errorMessage.value = response.errorMsg ?? 'Unknown error occurred';
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorMessage.value = 'An error occurred: $e';
      print('Fetch Error: $e');
    }
  }

  /// ✅ Local filter if needed
  void applyFilters() {
    final String city = selectedCity.value.trim().toUpperCase();
    final String status = selectedStatus.value.trim().toUpperCase();

    leadConvertedList.value = allLeads.where((lead) {
      final leadCity = (lead.customerName ?? '').trim().toUpperCase();
      final leadStatus = (lead.leadStatus ?? '').trim().toUpperCase();

      final cityMatches = city.isEmpty || leadCity == city;
      final statusMatches = status.isEmpty || leadStatus == status;

      return cityMatches && statusMatches;
    }).toList();
  }

  // ✅ City List Fetcher
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
        final dynamic rawData = jsonDecode(response.responseString!);

        if (rawData is List) {
          cityDetail.value = rawData
              .where((e) => e is Map<String, dynamic>)
              .map((e) => LeadConvertedModel.fromJson(e as Map<String, dynamic>))
              .toList();

          cityNameList.value = rawData
              .map((e) => e['CITY_NAME']?.toString() ?? '')
              .where((name) => name.isNotEmpty)
              .toSet()
              .toList();

          print("City Names: $cityNameList");
        } else {
          errorMessage.value = 'Invalid city data format';
        }
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
    fetchLeadConvertedData(0);
    fetchCityDetail();
    super.onInit();
  }
}
