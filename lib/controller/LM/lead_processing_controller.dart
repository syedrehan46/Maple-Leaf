import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../model/LM/Lead Converted/lead_converted_model.dart';
import '../../network/network_call.dart';
import '../../utils/api_routes.dart';
import '../auth_controller.dart';

class LeadProcessingController extends GetxController implements GetxService {
  final AuthController authController = Get.find<AuthController>();

  RxList<LeadConvertedModel> allLeads = <LeadConvertedModel>[].obs;
  RxList<LeadConvertedModel> leadProcessingList = <LeadConvertedModel>[].obs;

  RxList<LeadConvertedModel> cityDetail = <LeadConvertedModel>[].obs;
  RxList<String> cityNameList = <String>[].obs;
  RxList<String> cityList = <String>[].obs;
  RxList<String> statusList = <String>[].obs;
  RxList<String> retailerList = <String>[].obs;
  RxList<String> productList = <String>[].obs;

  RxString errorMessage = ''.obs;

  RxString selectedCity = ''.obs;
  RxString selectedStatus = ''.obs;
  RxInt selectedMonthIndex = 0.obs;

  /// ✅ Fetch lead processing data
  Future<void> fetchLeadProcessingData(
      int selectedMonth, {
        String? city,
        String? status,
      }) async {
    EasyLoading.show(status: 'Loading...');
    try {
      String salesForceId = authController.salesForceId;
      String baseUrl;

      switch (selectedMonth) {
        case 0:
          baseUrl = ApiRoutes.apiLmProcessingTwoWeeks;
          print("hit 1");
          break;
        case 1:
          baseUrl = ApiRoutes.apiLmProcessingLastMonth;
          print("hit 2");
          break;
        case 2:
          baseUrl = ApiRoutes.apiLmProcessingLastTwoMonth;
          print("hit 3");
          break;
        default:
          baseUrl = ApiRoutes.apiLmProcessingTwoWeeks;
      }

      final queryParams = {
        'salesForceId': salesForceId,
        if (status != null && status.isNotEmpty && !status.contains("Please")) 'status': status,
        if (city != null && city.isNotEmpty && !city.contains("Please")) 'city': city,
      };

      final queryString = Uri(queryParameters: queryParams).query;
      final url = "$baseUrl?$queryString";

      print("Final API URL: $url");

      ApiResponse response = await NetworkCall.getApiCallWithToken(url);
      print("DATA IS COMMING ==>${response.responseString} ");
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final json = jsonDecode(response.responseString!);

        if (json is List && json.isNotEmpty && json.first is Map<String, dynamic>) {
          allLeads.value = json.map((e) => LeadConvertedModel.fromJson(e)).toList();
          leadProcessingList.value = allLeads;

          statusList.value = allLeads
              .map((e) => (e.leadStatus ?? '').toUpperCase())
              .where((status) => status != "CONVERTED") // ❗ EXCLUDE "CONVERTED"
              .toSet()
              .toList();


          Set<String> allRetailers = {};
          Set<String> allProducts = {};

          for (var item in json) {
            if (item["products"] != null && item["products"] is List) {
              allProducts.addAll(List<String>.from(item["products"]));
            }
            if (item["retailers"] != null && item["retailers"] is List) {
              allRetailers.addAll(List<String>.from(item["retailers"]));
            }
          }

          productList.value = ["Select Product Sold", ...allProducts.toList()];
          retailerList.value = ["Select Retailer", ...allRetailers.toList()];
        } else {
          throw Exception("Unexpected response format");
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

  void applyFilters() {
    final isCityEmpty = selectedCity.value.isEmpty || selectedCity.value.contains("Please");
    final isStatusEmpty = selectedStatus.value.isEmpty || selectedStatus.value.contains("Please");

    if (isCityEmpty && isStatusEmpty) {
      leadProcessingList.value = allLeads;
    } else {
      leadProcessingList.value = allLeads.where((e) {
        final matchCity = isCityEmpty || (e.cityName?.toLowerCase() == selectedCity.value.toLowerCase());
        final matchStatus = isStatusEmpty || (e.leadStatus?.toLowerCase() == selectedStatus.value.toLowerCase());
        return matchCity && matchStatus;
      }).toList();
    }
  }

  /// ✅ Getter version (used for direct filtering)
  List<LeadConvertedModel> get filterData {
    final isCityEmpty = selectedCity.value.isEmpty || selectedCity.value.contains("Please");
    final isStatusEmpty = selectedStatus.value.isEmpty || selectedStatus.value.contains("Please");

    if (isCityEmpty && isStatusEmpty) {
      return allLeads;
    }

    return allLeads.where((e) {
      final matchCity = isCityEmpty || (e.cityName?.toLowerCase() == selectedCity.value.toLowerCase());
      final matchStatus = isStatusEmpty || (e.leadStatus?.toLowerCase() == selectedStatus.value.toLowerCase());
      return matchCity || matchStatus;
    }).toList();
  }



  /// ✅ Fetch city list
  Future<void> fetchCityDetail() async {
    EasyLoading.show(status: 'Loading...');
    try {
      String lmSalesId = authController.salesForceId;
      String url = "${ApiRoutes.apiLmProcessingCityDetail}?lmSalesId=$lmSalesId";

      ApiResponse response = await NetworkCall.getApiCallWithToken(url);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final json = jsonDecode(response.responseString!);

        if (json is List && json.isNotEmpty && json.first is Map<String, dynamic>) {
          cityDetail.value = json.map((e) => LeadConvertedModel.fromJson(e)).toList();
          cityNameList.value = json
              .map((e) => e['CITY_NAME']?.toString() ?? '')
              .where((name) => name.isNotEmpty)
              .toSet()
              .toList();
        } else {
          throw Exception("Unexpected city list format");
        }
      } else {
        errorMessage.value = response.errorMsg ?? 'Unknown error occurred';
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorMessage.value = 'An error occurred: $e';
      print('City Fetch Error: $e');
    }
  }

  @override
  void onInit() {
    fetchLeadProcessingData(0);
    fetchCityDetail();
    super.onInit();
  }
}
