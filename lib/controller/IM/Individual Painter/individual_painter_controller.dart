import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/model/login_model.dart';

import '../../../model/IM/indivdual_painter_model.dart';
import '../../../network/network_call.dart';
import '../../../utils/api_routes.dart';
import '../../auth_controller.dart';

class IndividualPainterController extends GetxController implements GetxService {
  RxList<IndivdualPainterModel> meetupCardList = <IndivdualPainterModel>[].obs;
  RxInt get meetupCount => meetupCardList.length.obs;
  RxString errorMessage = ''.obs;
  RxString salesForceId = ''.obs;
  // You can pass this as a parameter from your screen


  Future<void> fetchPainetrDetail() async {


    EasyLoading.show();

    String url = "${ApiRoutes.apiEngamentPlanDetail}?salesForceId=$salesForceId";
    print("URL>> $url");

    ApiResponse response = await NetworkCall.getApiCallWithToken(url);

    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);
        meetupCardList.value = data.map((e) => IndivdualPainterModel.fromJson(e)).toList();
        print("Painter response >>> ${meetupCardList.value}");
      } catch (e) {
        errorMessage.value = 'Failed to parse data';
        print("Parse Error: $e");
      }
    } else {
      errorMessage.value = response.errorMsg ?? 'Unknown error';
      print("API Error: ${response.errorMsg}");
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
      final url = ApiRoutes.apiImAddLead; // e.g., 'https://yourapi.com/LeadEngine/LeadAssociateWithPainter'

      ApiResponse response = await NetworkCall.postFormUrlEncodedWithTokenCall(
        url,body
        // important
      );

      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final result = jsonDecode(response.responseString ?? '{}');
        print("Data ... ${result}");
        if (result['Data'] == true) {
          EasyLoading.showSuccess(result['message'] ?? "Lead Added successfully");
        } else {
          EasyLoading.showError(result['message'] ?? "Lead failed");
        }
      } else {
        EasyLoading.showError(response.errorMsg ?? "Something went wrong");
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Exception: $e");
    }
  }
  Future<void> submitPlanWithImage({
    required String planId,
    required String location,
    required String giveAways,
    required String createdBy,
    required String salesForceId,
    required String imagePath, // local file path (e.g. from ImagePicker)
  }) async {
    EasyLoading.show(status: 'Submitting plan...');

    // Prepare body fields
    Map<String, String> body = {
      "PLAN_ID": planId,
      "LOCATION": location,
      "GIVE_AWAYS": giveAways,
      "CREATED_BY": createdBy,
      "SALES_FORCE_ID": salesForceId,
    };

    try {
      final url = ApiRoutes.apiImAddPlan; // Example: https://yourapi.com/LeadEngine/AddPlanDetail

      // Make the call using your utility
      ApiResponse response = await NetworkCall.multipartUploadFile(
        url,
        body,
        imagePath,
      );

      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final result = jsonDecode(response.responseString ?? '{}');
        print("Data ... ${result}");

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

  @override
  void onInit() {
    super.onInit();
    final AuthController authController = Get.find<AuthController>();
    salesForceId.value = authController.salesForceId;

    print("Fetched salesForceId: ${salesForceId.value}");
    fetchPainetrDetail(); // Call your data-fetching method/ ✅ now it's called!
  }
}

//
// class IndividualPainterController extends GetxController implements GetxService {
//   RxList<IndivdualPainterModel> meetupCardList = <IndivdualPainterModel>[].obs;
//   RxString errorMessage = ''.obs;
//   Future<void> fetchPainetrDetail(String salesForceId) async {
//     EasyLoading.show();
//
//     String url = "${ApiRoutes.apiEngamentPlanDetail}?salesForceId=$salesForceId";
// print("URL>> $url");
//     ApiResponse response = await NetworkCall.getApiCallWithToken(url);
//
//     EasyLoading.dismiss();
//
//     if ((response.done ?? false) && response.responseString != null) {
//       try {
//         final List<dynamic> data = jsonDecode(response.responseString!);
//         meetupCardList.value = data.map((e) => IndivdualPainterModel.fromJson(e)).toList();
//         print("Painter response >>> ${meetupCardList.value}");
//       } catch (e) {
//         errorMessage.value = 'Failed to parse data';
//         print("Parse Error: $e");
//       }
//     } else {
//       errorMessage.value = response.errorMsg ?? 'Unknown error';
//       print("API Error: ${response.errorMsg}");
//     }
//   }
//   @override
//   void onInit() {
//     print("check>>");
//     // fetchPainetrDetail("0");
//     super.onInit();
//   }
//
// }
