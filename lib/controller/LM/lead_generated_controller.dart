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

  // Extracted values lists
  RxList<String> sampleAppliedList = <String>[].obs;
  RxList<String> convertedToSaleList = <String>[].obs;
  RxList<String> specialIncentiveList = <String>[].obs;
  RxList<String> painterAutoConversionList = <String>[].obs;
  RxList<String> siteVisitList = <String>[].obs;

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

      switch (selectedMonth) {
        case 0:
          baseUrl = ApiRoutes.apiLmGeneratedTwoWeeks;
          break;
        case 1:
          baseUrl = ApiRoutes.apiLmGeneratedLastMonth;
          break;
        case 2:
          baseUrl = ApiRoutes.apiLmGeneratedLastTwoMonth;
          break;
        default:
          baseUrl = ApiRoutes.apiLmGeneratedTwoWeeks;
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
        final List<dynamic> data = jsonDecode(response.responseString!);
        allLeads.value =
            data.map((e) => LeadConvertedModel.fromJson(e)).toList();
        leadGeneratedList.value = allLeads;

        final Set<String> statuses =
        allLeads.map((e) => (e.leadStatus ?? '').toUpperCase()).toSet();
        statusList.value = statuses.toList();

        // Populate key-based lists
        sampleAppliedList.value = allLeads
            .map((e) => e.sampleApplied ?? '')
            .where((val) => val.isNotEmpty)
            .toSet()
            .toList();

        convertedToSaleList.value = allLeads
            .map((e) => e.convertedToSale ?? '')
            .where((val) => val.isNotEmpty)
            .toSet()
            .toList();

        specialIncentiveList.value = allLeads
            .map((e) => e.specialIncentive ?? '')
            .where((val) => val.isNotEmpty)
            .toSet()
            .toList();

        painterAutoConversionList.value = allLeads
            .map((e) => e.painterAutoConversion ?? '')
            .where((val) => val.isNotEmpty)
            .toSet()
            .toList();

        siteVisitList.value = allLeads
            .map((e) => e.siteVisit ?? '')
            .where((val) => val.isNotEmpty)
            .toSet()
            .toList();
      } else {
        errorMessage.value = response.errorMsg ?? 'Unknown error occurred';
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorMessage.value = 'An error occurred: $e';
      print('Fetch Error: $e');
    }
  }

  // ✅ Local filtering
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

  // ✅ Fetch city names
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
      } else {
        errorMessage.value = response.errorMsg ?? 'Unknown error occurred';
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorMessage.value = 'An error occurred: $e';
      print('Fetch Error: $e');
    }
  }

  /// ✅ POST: Submit Feedback API
  Future<void> UpdateInformation({
    required String siteVisit,
    required String productSold,
    required String specialIncentive,
    required String customerName,
    required String phone,
    required String painterAutoConversion,
    required String retailerId,
    required String painterId,
    required String visitDate,
    required String createdBy,
    required int generalCustomerId,
    required String salesForceId,
    required String sampleApplied,
    required String convertedToSale,
    required String noOfBags5KgPutty,
    required String noOfBags20KgPutty,
    required String noOfBags20KgRepaint,
    required String retailerNotAvailRemarks,
    required String noConversionReasons,
    required String retailerStock,
    required String expectedKg,
    required String tid,
  }) async {
    EasyLoading.show(status: 'Submitting feedback...');

    Map<String, dynamic> body = {
      "SITE_VISIT": siteVisit,
      "PRODUCT_SOLD": productSold,
      "SPECIAL_INCENTIVE": specialIncentive,
      "CUSTOMER_NAME": customerName,
      "PHONE": phone,
      "PAINTER_AUTO_CONVERSION": painterAutoConversion,
      "RETAILER_ID": retailerId,
      "PAINTER_ID": painterId,
      "VISIT_DATE": visitDate,
      "CREATED_BY": createdBy,
      "GENERAL_CUSTOMER_ID": generalCustomerId.toString(),
      "SALES_FORCE_ID": salesForceId,
      "SAMPLE_APPLIED": sampleApplied,
      "CONVERTED_TO_SALE": convertedToSale,
      "NO_OF_BAGS_5_KG": noOfBags5KgPutty,
      "NO_OF_BAGS_20_KG": noOfBags20KgPutty,
      "NO_OF_BAGS_20_KG_REPAINT": noOfBags20KgRepaint,
      "RETAILER_NOT_AVAIL_REMARKS": retailerNotAvailRemarks,
      "CONVERTION_NO_REASON": noConversionReasons,
      "RETAILER_STOCK": retailerStock,
      "EXPECTED_KGS": expectedKg,
      "TID": tid,
    };

    try {
      final url = ApiRoutes.apiFeedbackForm;

      ApiResponse response = await NetworkCall.postApiWithTokenCall(url, body);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final result = jsonDecode(response.responseString ?? '{}');
        print("${result}");
        if (result['Data']) {
          EasyLoading.showSuccess(result['message'] ?? "Feedback submitted");
        } else {
          EasyLoading.showError(result['message'] ?? "Submission failed");
        }
      } else {
        EasyLoading.showError(response.errorMsg ?? "Something went wrong");
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Exception: $e");
      print("Feedback API Exception: $e");
    }
  }

  @override
  void onInit() {
    fetchLeadGeneratedData(0);
    fetchCityDetail();

    super.onInit();
  }
}
