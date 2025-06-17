import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../model/IS/Area Wise Planning User/areawise_model.dart';
import '../../network/network_call.dart';
import '../../utils/api_routes.dart';

class PlanController extends GetxController implements GetxService {

  RxList<PlanModel> cityWisePlanList = <PlanModel>[].obs;
  RxList<PlanModel> areaWisePlanList = <PlanModel>[].obs;

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
        for (var item in cityWisePlanList) {
          print("City ${item.achievement}, Plan ID: ${item.planId}, Month: ${item.activeMonth}");
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
}
