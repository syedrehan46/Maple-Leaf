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
          baseUrl = ApiRoutes.apiLmConvertedLastMonth;
          break;
        case 2:
          baseUrl = ApiRoutes.apiLmConvertedLastTwoMonth;
          break;
        default:
          baseUrl = ApiRoutes.apiLmConvertedTwoWeeks;
      }

      final queryParams = {
        'salesForceId': salesForceId,
      };

      final queryString = Uri(queryParameters: queryParams).query;
      final url = "$baseUrl?$queryString";
      print("Final API URL: $url");

      ApiResponse response = await NetworkCall.getApiCallWithToken(url);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final dynamic rawData = jsonDecode(response.responseString!);

        if (rawData is List) {
          final List<dynamic> data = rawData;

          allLeads.value = data
              .where((e) => e is Map<String, dynamic>)
              .map((e) => LeadConvertedModel.fromJson(e as Map<String, dynamic>))
              .toList();

          leadConvertedList.value = allLeads;

          // ✅ Unique Status List
          final Set<String> statuses = allLeads
              .map((e) => (e.leadStatus ?? '').toUpperCase())
              .toSet();
          statusList.value = statuses.toList();

          // ✅ Extract Retailers & Products (Only this part added)
          Set<String> retailers = {};
          Set<String> products = {};

          for (var lead in allLeads) {
            if ((lead.retailerName ?? '').isNotEmpty) {
              retailers.add(lead.retailerName!.trim());
            }
            if ((lead.productSold ?? '').isNotEmpty) {
              products.add(lead.productSold!.trim());
            }
          }

          retailerList.value = ['Select Retailer', ...retailers.toList()];
          productList.value = ['Select Product Sold', ...products.toList()];
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
    final isCityEmpty = selectedCity.value.isEmpty || selectedCity.value.contains("Please");
    final isStatusEmpty = selectedStatus.value.isEmpty || selectedStatus.value.contains("Please");

    if (isCityEmpty && isStatusEmpty) {
      leadConvertedList.value = allLeads;
    } else {
      leadConvertedList.value = allLeads.where((e) {
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
