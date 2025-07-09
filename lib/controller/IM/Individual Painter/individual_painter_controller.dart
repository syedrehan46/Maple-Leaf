import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../model/IM/all_area_painter_model.dart';
import '../../../model/IM/indivdual_painter_model.dart';
import '../../../model/IM/paineter_record_model.dart';
import '../../../network/network_call.dart';
import '../../../utils/api_routes.dart';
import '../../auth_controller.dart';

class IndividualPainterController extends GetxController implements GetxService {
  // Data
  RxList<IndivdualPainterModel> meetupCardList = <IndivdualPainterModel>[].obs;
  RxList<IndividualPainterPlanModel> allPainterDetail = <IndividualPainterPlanModel>[].obs;
  RxList<AreaModel> allAreaList = <AreaModel>[].obs;
  RxInt meetupCount = 0.obs;

  // Selected Card
  Rx<IndivdualPainterModel?> selectedPlan = Rx<IndivdualPainterModel?>(null);

  // Access selected card values
  String get selectedPlanId => selectedPlan.value?.planId?.toString() ?? '';
  String get selectedActualId => selectedPlan.value?.actualId?.toString() ?? '';
  String get selectedCreatedBy => selectedPlan.value?.createdBy?.toString() ?? '';

  // Extra State
  RxInt selectedPlanIndex = 0.obs;
  RxString errorMessage = ''.obs;
  RxString salesForceId = ''.obs;
  RxString city = "".obs;
  int clusterId = 605;

  @override
  void onInit() {
    super.onInit();
    final AuthController authController = Get.find<AuthController>();
    salesForceId.value = authController.salesForceId;
    print("Fetched salesForceId: ${salesForceId.value}");

    // Sequential loading
    loadData();
  }

  Future<void> loadData() async {
    await fetchPainetrDetail();
    print("Selected Plan ID: $selectedPlanId");
    await fetcAllPainter();
  }

  Future<void> fetchPainetrDetail() async {
    EasyLoading.show();

    final url = "${ApiRoutes.apiEngamentPlanDetail}?salesForceId=${salesForceId.value}";
    print("URL >> $url");

    ApiResponse response = await NetworkCall.getApiCallWithToken(url);
    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);
        meetupCardList.value = data.map((e) => IndivdualPainterModel.fromJson(e)).toList();

        if (meetupCardList.isNotEmpty) {
          selectedPlan.value = meetupCardList.first;
          print("First selected planId: ${selectedPlan.value?.planId}");
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

  Future<void> fetcAllPainter() async {
    EasyLoading.show();

    final url =
        "${ApiRoutes.apiAllPainterHeader}?salesForceId=${salesForceId.value}&planId=$selectedPlanId";
    print("Painter Fetch URL >> $url");

    ApiResponse response = await NetworkCall.getApiCallWithToken(url);
    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);
        allPainterDetail.value = data.map((e) => IndividualPainterPlanModel.fromJson(e)).toList();
        print("Fetched ${allPainterDetail.length} painters");
      } catch (e) {
        errorMessage.value = 'Failed to parse painter data';
        print("Painter Parse Error: $e");
      }
    } else {
      errorMessage.value = response.errorMsg ?? 'Unknown error';
      print("Painter API Error: ${response.errorMsg}");
    }
  }

  Future<void> fetchAllAreas() async {
    EasyLoading.show();

    final url = "${ApiRoutes.apiImAllArea}?salesForceId=${salesForceId.value}&ClusterID=$clusterId";
    print("All Areas URL >> $url");

    ApiResponse response = await NetworkCall.getApiCallWithToken(url);
    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);
        allAreaList.value = data.map((e) => AreaModel.fromJson(e)).toList();
        print("Fetched ${allAreaList.length} areas");
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
    required String actualId,
    required String createdBy,
    required String imagePath1,
    String? imagePath2,
  }) async {
    EasyLoading.show(status: 'Submitting...');

    try {
      final url = ApiRoutes.apiImAddPainter;

      Map<String, String> body = {
        "PLAN_ID": planId,
        "ACTUAL_ID": actualId,
        "CREATED_BY": createdBy,
      };

      Map<String, String> images = {
        "Img": imagePath1,
      };

      if (imagePath2 != null && imagePath2.isNotEmpty) {
        images["Img1"] = imagePath2;
      }

      ApiResponse response =
      await NetworkCall.multipartUploadMultipleFiles(url, body, images);

      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final result = jsonDecode(response.responseString!);
        print("Response: $result");

        if (result['Data'] == true) {
          EasyLoading.showSuccess(result['message'] ?? "Submitted successfully");
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
