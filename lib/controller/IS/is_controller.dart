import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/model/IS/via/via_model.dart';
import '../../model/IS/Area Wise Planning User/areawise_model.dart';
import '../../model/IS/Sales_oficer/sales_oficer_model.dart';
import '../../model/IS/area/area_model.dart';
import '../../network/network_call.dart';
import '../../utils/api_routes.dart';
import '../auth_controller.dart';

class PlanController extends GetxController implements GetxService {

  final AuthController authController = Get.find<AuthController>();
  @override
  void onInit() {
    super.onInit();
    String salesForceId = "${authController.salesForceId}";
    fetchPlanDataCityWise(salesForceId);
    fetchViamembers();
    fetchSoftAccountHolders();
  }

  RxList<AreaModel> areasList = <AreaModel>[].obs;
  RxList<String> areaNameList = <String>[].obs;
  RxList<AreaModel> referralAreasList = <AreaModel>[].obs;
  RxList<String> referralAreaNameList = <String>[].obs;
  RxList<SalesOfficerModel> salesOfficersList = <SalesOfficerModel>[].obs;
  RxList<String> salesOfficerNameList = <String>[].obs;
  RxList<PlanModel> cityWisePlanList = <PlanModel>[].obs;
  RxList<PlanModel> areaWisePlanList = <PlanModel>[].obs;
  RxList<SalesOfficerModel> softAccountHoldersList = <SalesOfficerModel>[].obs;
  RxList<String> softAccountHoldersNameList = <String>[].obs;
  RxList<String> cityNameList = <String>[].obs;
  RxList<ViaModel> viaMembersList=<ViaModel>[].obs;
  RxList<String> viaDescriptionList = <String>[].obs;

  RxString errorMessage = ''.obs;

  Future<void> fetchPlanDataCityWise(String salesForceId) async {
    EasyLoading.show();
    String url = "${ApiRoutes.apiIsPlanDetailCityWise}?salesForceId=$salesForceId";
    ApiResponse response = await NetworkCall.getApiCallWithToken(url);
    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);
        cityWisePlanList.value = data.map((e) => PlanModel.fromJson(e)).toList();

        // ✅ Extract city names from `achievement` field
        final cities = cityWisePlanList
            .map((item) => item.cityName?.toString() ?? '')
            .toSet()
            .toList();

        cityNameList.value = cities.cast<String>();
        for (var item in cityWisePlanList) {
          // print("City ${item.achievement}, Plan ID: ${item.planId}, Month: ${item.activeMonth},");
        }
      } catch (e) {
        errorMessage.value = 'Failed to parse city-wise data';
        print("City Parse Error: $e");
      }
    } else {
      errorMessage.value = response.errorMsg ?? 'City-wise API error';
      print("City API Error: ${response.errorMsg}");
    }
  }

  // ✅ Method to get city details by city name
  PlanModel? getCityDetailsByName(String cityName) {
    try {
      return cityWisePlanList.firstWhere((city) => city.cityName == cityName);
    } catch (e) {
      return null;
    }
  }

  Future<void> fetchAreasByZoneAndCity({
    String? salesForceId,
    dynamic zoneId,
    dynamic cityId,
  }) async {
    EasyLoading.show();

    String url = "${ApiRoutes.apiIsGetAreaByUserLm}?salesForceId=$salesForceId&zoneId=$zoneId&cityId=$cityId";
    print("Calling URL: $url");

    ApiResponse response = await NetworkCall.getApiCallWithToken(url);

    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);

        // ✅ Store full AreaModel objects
        areasList.value = data.map((e) => AreaModel.fromJson(e)).toList();

        // ✅ Extract area names for dropdown
        areaNameList.value = areasList
            .map((e) => e.areaName ?? '')
            .where((name) => name.isNotEmpty)
            .toSet()
            .toList();

        for (var area in areasList) {
          // print("Area: ${area.areaName}, ID: ${area.areaId}");
        }

      } catch (e) {
        errorMessage.value = 'Failed to parse area data';
        print("Area Parse Error: $e");
      }
    } else {
      errorMessage.value = response.errorMsg ?? 'Area API error';
    }
  }

  Future<void> fetchPlanDataAreaWise(String salesForceId) async {
    EasyLoading.show();
    String url = "${ApiRoutes.apiIsPlanDetailAreaWise}?salesForceId=$salesForceId";
    ApiResponse response = await NetworkCall.getApiCallWithToken(url);
    EasyLoading.dismiss();
    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);
        areaWisePlanList.value = data.map((e) => PlanModel.fromJson(e)).toList();
      } catch (e) {
        errorMessage.value = 'Failed to parse area-wise data';
        print("Area Parse Error: $e");
      }
    } else {
      errorMessage.value = response.errorMsg ?? 'Area-wise API error';
      print("Area API Error: ${response.errorMsg}");
    }
  }
  Future<void> fetchViamembers() async {
    try {
      EasyLoading.show();

      String salesForceId = authController.salesForceId;
      String url = "${ApiRoutes.apiIsGetVia}?salesForceId=$salesForceId";

      ApiResponse response = await NetworkCall.getApiCallWithToken(url);

      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final List<dynamic> data = jsonDecode(response.responseString!);
        viaMembersList.value = data.map((e) => ViaModel.fromJson(e)).toList();

        print(viaMembersList.last.createdOn);
        // 👇 Generate list of VIA_DESCRIPTION only
        viaDescriptionList.value = viaMembersList.map((e) => e.viaDescription).toList();

        for (var item in viaDescriptionList) {
          // print("VIA_DESCRIPTION: $item");
        }

      } else {
        errorMessage.value = response.errorMsg ?? 'Via members API error';
        print("Via API Error: ${response.errorMsg}");
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorMessage.value = 'Failed to parse via members data';
      print("Via Parse Error: $e");
    }
  }

  Future<void> fetchReferalAreasByZoneAndCity({
    String? salesForceId,
    dynamic zoneId,
    dynamic cityId,
  }) async {
    EasyLoading.show();

    String url = "${ApiRoutes.apiIsGetAreaByForReferal}?salesForceId=$salesForceId&zoneId=$zoneId&cityId=$cityId";
    print("Calling URL: $url");

    ApiResponse response = await NetworkCall.getApiCallWithToken(url);

    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);

        // ✅ Store full AreaModel objects
        referralAreasList.value = data.map((e) => AreaModel.fromJson(e)).toList();

        // ✅ Extract area names for dropdown
        referralAreaNameList.value = referralAreasList
            .map((e) => e.areaName ?? '')
            .where((name) => name.isNotEmpty)
            .toSet()
            .toList();

        for (var area in referralAreasList) {
          // print("Referral Area: ${area.areaName}, ID: ${area.areaId}");
        }

      } catch (e) {
        errorMessage.value = 'Failed to parse area data';
        print("Area Parse Error: $e");
      }
    } else {
      errorMessage.value = response.errorMsg ?? 'Area API error';
    }
  }

  Future<void> fetchReferalAreasSalesOfiicers({
    dynamic areaId,
  }) async {
    EasyLoading.show();

    String url = "${ApiRoutes.apiIsGetFosReferal}?areaId=$areaId";
    print("Calling URL: $url");

    ApiResponse response = await NetworkCall.getApiCallWithToken(url);

    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);

        salesOfficersList.value = data.map((e) => SalesOfficerModel.fromJson(e)).toList();

        salesOfficerNameList.value = salesOfficersList
            .map((e) => e.salesOfficerName ?? '')
            .where((name) => name.isNotEmpty)
            .toSet()
            .toList();

        for (var officer in salesOfficersList) {
          // print("Sales Officer:99999999999999999999999999999999999999999999999999${officer.salesOfficerName}");
        }

      } catch (e) {
        errorMessage.value = 'Failed to parse sales officer data';
        print("Sales Officer Parse Error: $e");
      }
    } else {
      errorMessage.value = response.errorMsg ?? 'Sales Officer API error';
    }
  }
  AreaModel? getReferralAreaByName(String areaName) {
    try {
      return referralAreasList.firstWhere((area) => area.areaName == areaName);
    } catch (e) {
      return null;
    }
  }

  Future<void> fetchSoftAccountHolders() async {
    EasyLoading.show();

    String salesForceId = authController.salesForceId;
    String url = "${ApiRoutes.apiIsGetRetailer}?salesForceId=$salesForceId"; // You'll need to add this route
    print("Calling URL: $url");

    ApiResponse response = await NetworkCall.getApiCallWithToken(url);

    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);

        softAccountHoldersList.value = data.map((e) => SalesOfficerModel.fromJson(e)).toList();

        softAccountHoldersNameList.value = softAccountHoldersList
            .map((e) => e.retailerName ?? '')
            .where((name) => name.isNotEmpty)
            .toSet()
            .toList();

        for (var holder in softAccountHoldersList) {
          // print("Soft Account Holder:${holder.retailerName}");
        }

      } catch (e) {
        errorMessage.value = 'Failed to parse soft account holders data';
        print("Soft Account Holders Parse Error: $e");
      }
    } else {
      errorMessage.value = response.errorMsg ?? 'Soft Account Holders API error';
      print("Soft Account Holders API Error: ${response.errorMsg}");
    }
  }
}