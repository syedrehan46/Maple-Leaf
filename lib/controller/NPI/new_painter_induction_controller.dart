import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/model/LM/Lead%20Processing/lead_processing_model.dart';
import 'package:mapleleaf/model/NPI/new_painter_induction_model.dart';
import '../../model/LM/Lead Converted/lead_converted_model.dart';
import '../../network/network_call.dart';
import '../../utils/api_routes.dart';
import '../auth_controller.dart';

class NewPainterInductionController extends GetxController implements GetxService {
  final AuthController authController = Get.find<AuthController>();

  RxList<NewPainterInductionModel> newPainterInductionList = <NewPainterInductionModel>[].obs;
  RxInt get npiCount => newPainterInductionList.length.obs;
  RxString errorMessage = ''.obs;

  Future<void> fetchLeadProcessingData() async {
    EasyLoading.show(status: 'Loading...');
    try {
      String salesForceId = authController.salesForceId;
      String url = "${ApiRoutes.apiNewPainterInduction}?salesForceId=$salesForceId";

      ApiResponse response = await NetworkCall.getApiCallWithToken(url);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final List<dynamic> data = jsonDecode(response.responseString!);
        newPainterInductionList.value = data.map((e) => NewPainterInductionModel.fromJson(e)).toList();
        print(newPainterInductionList.value);
      } else {
        errorMessage.value = response.errorMsg ?? 'Unknown error occurred';
      }
    } catch (e) {
      EasyLoading.dismiss();
      errorMessage.value = 'An error occurred: $e';
      print('Fetch Error: $e');
    }
  }
  Future<void> addCardNumberWithPainter({
    required int registrationId,
    required String cardNumber,
  }) async {
    EasyLoading.show(status: 'Submitting card number...');

    final Map<String, dynamic> body = {
      "REGISTRATION_ID": registrationId,
      "CARD_NUMBER": cardNumber,
    };

    try {
      final String url = ApiRoutes.apiFeedBack;

      ApiResponse response = await NetworkCall.postApiWithTokenCall(url, body);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final result = jsonDecode(response.responseString ?? '{}');
        print("AddCardNumberWithPainter Response: $result");

        if (result['Data'] == "Wallet number alloted" || result['Data'] == "Old Wallet number alloted") {
          EasyLoading.showSuccess(result['Data']);
        } else {
          EasyLoading.showError(result['message'] ?? "This wallet number is not exist in system");
        }
      } else {
        EasyLoading.showError(response.errorMsg ?? "Something went wrong");
      }
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError("Exception: $e");
      print("AddCardNumberWithPainter Exception: $e");
    }
  }



  @override
  void onInit() {
    // TODO: implement onInit
    fetchLeadProcessingData();

    super.onInit();
  }
}
