import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/model/IS/allCity/city_model.dart';
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
    fetchCities(salesForceId, zoneId);
  }
  RxList<CityModel> citiesData =<CityModel>[].obs;
  RxList<String> citiesList = <String>[].obs;

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
  final RxString selectedCityFromList = ''.obs;
  String zoneId='10';
  Future<void> fetchCities(String salesForceId,String zoneId) async {
    EasyLoading.show();
    String url = "${ApiRoutes.apiIsAllCities}?salesForceId=$salesForceId&zoneId=$zoneId";
    ApiResponse response = await NetworkCall.getApiCallWithToken(url);
    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);

        // ✅ Decode and assign city model list
        citiesData.value = data.map((e) => CityModel.fromJson(e)).toList();

        // ✅ Extract unique, non-empty city names
        final names = citiesData
            .map((item) => item.cityName?.toString() ?? '')
            .where((name) => name.isNotEmpty)
            .toSet()
            .toList();

        citiesList.value = names;

        // Optional debug
        for (var item in citiesData) {
          // print("City: ${item.cityName}, SQL ID: ${item.sqlCityId}");
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

// ✅ Get city details from citiesData by name
  CityModel? getCityByName(String cityName) {
    try {
      return citiesData.firstWhere(
            (city) => city.cityName?.toLowerCase() == cityName.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }
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

  Future<void> addGeneralCustomerFOSD2CUpdatedV5({
    required String CUSTOMER_NAME,
    required String PHONE,
    required String? CITY_ID,
    required String VIA,
    required String STATUS,
    required String REVISIT_DATE,
    required String CREATED_BY,
    required String SALES_FORCE_ID,
    required String? WALLET_NUMBER,
    required String? RETAILER_ID,
    required String? PAINTER_NUMBER,
    required String? NEW_PAINTER_NUMBER,
    required String WINNING_DATE_OF_STW,
    required String DATE_OF_MKT_LEAD,
    required String ASSIGN_TO,
    required String LEAD_FROM,
    required String? GIFT_ID,
    required String TYPE,
    required String LOCATION_NAME,
    required String LATITUDE,
    required String LONGITUDE,
    required String SIZE_OF_HOUSE,
    required String EXPECTED_KGS,
    required String AREA_ID,  // Changed to String
    required String SECOND_PERSON_TYPE,
    required String SECOND_PERSON_NUMBER,
    required String THIRD_PERSON_TYPE,
    required String THIRD_PERSON_NUMBER,
    required String SECOND_PERSON_NAME,
    required String THIRD_PERSON_NAME,
    required String LEAD_REFERAL,
    required String? REFER_AREA_ID,
    required String? REFERED_BY_SALES_ID,
  }) async {
    try {
      EasyLoading.show();
      final url = ApiRoutes.apiAddGeneralCustomer;

      // Debug prints
      print("Api Url: $url");
      print("CITY_ID value: $CITY_ID");
      print("AREA_ID value: $AREA_ID");
      print("RETAILER_ID value: $RETAILER_ID");

      final body = {
        "CUSTOMER_NAME": CUSTOMER_NAME,
        "PHONE": PHONE,
        "CITY_ID": CITY_ID, // Don't convert to string if it's already null
        "VIA": VIA,
        "STATUS": STATUS,
        "REVISIT_DATE": REVISIT_DATE,
        "CREATED_BY": CREATED_BY,
        "SALES_FORCE_ID": SALES_FORCE_ID,
        "WALLET_NUMBER": WALLET_NUMBER,
        "RETAILER_ID": RETAILER_ID ?? "", // Use empty string if null
        "PAINTER_NUMBER": PAINTER_NUMBER,
        "NEW_PAINTER_NUMBER": NEW_PAINTER_NUMBER,
        "WINNING_DATE_OF_STW": WINNING_DATE_OF_STW ?? "",
        "DATE_OF_MKT_LEAD": DATE_OF_MKT_LEAD,
        "ASSIGN_TO": "",
        "LEAD_FROM": LEAD_FROM,
        "GIFT_ID": GIFT_ID,
        "TYPE": TYPE,
        "LOCATION_NAME": LOCATION_NAME,
        "LATITUDE": LATITUDE,
        "LONGITUDE": LONGITUDE,
        "SIZE_OF_HOUSE": SIZE_OF_HOUSE,
        "EXPECTED_KGS": EXPECTED_KGS,
        "AREA_ID": AREA_ID, // Keep as string
        "SECOND_PERSON_TYPE": SECOND_PERSON_TYPE,
        "SECOND_PERSON_NUMBER": SECOND_PERSON_NUMBER,
        "THIRD_PERSON_TYPE": THIRD_PERSON_TYPE,
        "THIRD_PERSON_NUMBER": THIRD_PERSON_NUMBER,
        "SECOND_PERSON_NAME": SECOND_PERSON_NAME,
        "THIRD_PERSON_NAME": THIRD_PERSON_NAME,
        "LEAD_REFERAL": LEAD_REFERAL,
        "REFER_AREA_ID": REFER_AREA_ID,
        "REFERED_BY_SALES_ID": REFERED_BY_SALES_ID
      };

      print("Body: $body");

      final ApiResponse response = await NetworkCall.postApiCall(url, body);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final json = jsonDecode(response.responseString!);
        print("Response Success: $json");
      } else {
        errorMessage.value = response.errorMsg ?? 'Customer Add API Error';
        print("API Error: ${response.errorMsg}");
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorMessage.value = 'Something went wrong!';
      print("Exception in Add Customer: $e");
    }
  }
}