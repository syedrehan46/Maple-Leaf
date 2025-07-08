import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../model/IM/all_area_painter_model.dart';
import '../../../model/IM/indivdual_painter_model.dart';
import '../../../network/network_call.dart';
import '../../../utils/api_routes.dart';
import '../../auth_controller.dart';

class IndividualPainterController extends GetxController implements GetxService {
  // Data
  RxList<IndivdualPainterModel> meetupCardList = <IndivdualPainterModel>[].obs;
  RxList<AreaModel> allAreaList = <AreaModel>[].obs;

  // Selection & State
  RxInt selectedPlanId = 0.obs;
  RxString errorMessage = ''.obs;
  RxString salesForceId = ''.obs;
  RxString city = "".obs;
  int clusterId = 605;

  // Getter to access planId anywhere
  int get planId => selectedPlanId.value;

  // Count getter if needed
  RxInt get meetupCount => meetupCardList.length.obs;

  @override
  void onInit() {
    super.onInit();
    final AuthController authController = Get.find<AuthController>();
    salesForceId.value = authController.salesForceId;
    print("Fetched salesForceId: ${salesForceId.value}");

    fetchPainetrDetail(); // Fetch painter data
  }

  Future<void> fetchPainetrDetail() async {
    EasyLoading.show();

    final url = "${ApiRoutes.apiEngamentPlanDetail}?salesForceId=$salesForceId";
    print("URL >> $url");

    ApiResponse response = await NetworkCall.getApiCallWithToken(url);
    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);
        meetupCardList.value = data.map((e) => IndivdualPainterModel.fromJson(e)).toList();

        // ✅ Set selectedPlanId
        if (meetupCardList.isNotEmpty && meetupCardList.first.planId != null) {
          selectedPlanId.value = meetupCardList.first.planId!;
          print("Selected Plan ID: ${selectedPlanId.value}");
        }

      } catch (e) {
        errorMessage.value = 'Failed to parse data';
        print("Parse Error: $e");
      }
    } else {
      errorMessage.value = response.errorMsg ?? 'Unknown error';
      print("API Error: ${response.errorMsg}");
    }
  }

  Future<void> fetchAllAreas() async {
    EasyLoading.show();

    final url = "${ApiRoutes.apiImAllArea}?salesForceId=$salesForceId&ClusterID=$clusterId";
    print("All Areas URL >> $url");

    ApiResponse response = await NetworkCall.getApiCallWithToken(url);
    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);
        allAreaList.value = data.map((e) => AreaModel.fromJson(e)).toList();
        print("All Area Response: ${allAreaList.length} items");
      } catch (e) {
        errorMessage.value = 'Failed to parse area data';
        print("Area Parse Error: $e");
      }
    } else {
      errorMessage.value = response.errorMsg ?? 'Unknown error';
      print("Area API Error: ${response.errorMsg}");
    }
  }

  Future<void> AddLeadWithPainter({
    required int registrationId,
    required String customerNumber,
    required String customerNameAndAddress,
    required String painterName,
    required String phoneNumber,
    required String planType,
    required int areaId,
    required int createdBy,
    required String salesForceId,
  }) async {
    EasyLoading.show(status: 'Adding lead...');

    Map<String, String> body = {
      "REGISTRATION_ID": registrationId.toString(),
      "CUSTOMER_NUMBER": customerNumber,
      "CUSTOMER_NAME_ADDRESS": customerNameAndAddress,
      "PAINTER_NAME": painterName,
      "PHONE_NUMBER": phoneNumber,
      "PLAN_TYPE": planType,
      "AREA_ID": areaId.toString(),
      "CREATED_BY": createdBy.toString(),
      "SALES_FORCE_ID": salesForceId,
    };

    try {
      final url = ApiRoutes.apiImAddLead;

      ApiResponse response = await NetworkCall.postFormUrlEncodedWithTokenCall(url, body);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final result = jsonDecode(response.responseString ?? '{}');
        print("Lead Add Response: $result");

        if (result['Data'] == true) {
          EasyLoading.showSuccess(result['message'] ?? "Lead Added Successfully");
        } else {
          EasyLoading.showError(result['message'] ?? "Lead Submission Failed");
        }
      } else {
        EasyLoading.showError(response.errorMsg ?? "Something went wrong");
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Exception: $e");
    }
  }

  Future<void> addPainter({
    required String planId,
    required String location,
    required String giveAways,
    required String createdBy,
    required String salesForceId,
    required String imagePath,
  }) async {
    EasyLoading.show(status: 'Submitting plan...');

    Map<String, String> body = {
      "PLAN_ID": planId,
      "LOCATION": location,
      "GIVE_AWAYS": giveAways,
      "CREATED_BY": createdBy,
      "SALES_FORCE_ID": salesForceId,
    };

    try {
      final url = ApiRoutes.apiImAddPlan;

      ApiResponse response = await NetworkCall.multipartUploadFile(url, body, imagePath);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final result = jsonDecode(response.responseString ?? '{}');
        print("Add Painter Result: $result");

        if (result['Data'] == true) {
          EasyLoading.showSuccess(result['message'] ?? "Plan submitted successfully");
        } else {
          EasyLoading.showError(result['message'] ?? "Submission failed");
        }
      } else {
        EasyLoading.showError(response.errorMsg ?? "Something went wrong");
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Exception: $e");
    }
  }
}
