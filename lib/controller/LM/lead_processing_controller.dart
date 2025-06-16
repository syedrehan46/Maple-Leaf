import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/model/LM/Lead%20Processing/lead_processing_model.dart';
import '../../model/LM/Lead Converted/lead_converted_model.dart';
import '../../network/network_call.dart';
import '../../utils/api_routes.dart';
import '../auth_controller.dart';

class LeadProcessingController extends GetxController implements GetxService {
  final AuthController authController = Get.find<AuthController>();

  RxList<LeadProcessingModel> leadProcessingList = <LeadProcessingModel>[].obs;
  RxString errorMessage = ''.obs;

  Future<void> fetchLeadProcessingData() async {
    EasyLoading.show(status: 'Loading...');
    try {
      String salesForceId = authController.salesForceId;
      String url = "${ApiRoutes.apiLmProcessingTwoWeeks}?salesForceId=$salesForceId";

      ApiResponse response = await NetworkCall.getApiCallWithToken(url);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final List<dynamic> data = jsonDecode(response.responseString!);
        leadProcessingList.value = data.map((e) => LeadProcessingModel.fromJson(e)).toList();
        print(leadProcessingList.value);
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
    // TODO: implement onInit
    fetchLeadProcessingData();

    super.onInit();
  }
}
