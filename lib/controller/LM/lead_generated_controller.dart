import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/model/LM/Lead%20Generated/lead_generated_model.dart';
import 'package:mapleleaf/model/LM/Lead%20Processing/lead_processing_model.dart';
import '../../model/LM/Lead Converted/lead_converted_model.dart';
import '../../network/network_call.dart';
import '../../utils/api_routes.dart';
import '../auth_controller.dart';

class LeadGeneratedController extends GetxController implements GetxService {
  final AuthController authController = Get.find<AuthController>();

  RxList<LeadConvertedModel> leadGeneratedList = <LeadConvertedModel>[].obs;
  RxString errorMessage = ''.obs;

  Future<void> fetchLeadGeneratedData(int selectedMonthIndex) async {
    EasyLoading.show(status: 'Loading...');
    try {
      String salesForceId = authController.salesForceId;
      String url;

      switch (selectedMonthIndex) {

        case 0:
          print("Executed ....Rehan");
          url =
              "${ApiRoutes.apiLmGeneratedTwoWeeks}?salesForceId=$salesForceId";
          break;
        case 1:
          url =
              "${ApiRoutes.apiLmGeneratedLastThirtyDays}?salesForceId=$salesForceId";
          break;
        case 2:
          url =
              "${ApiRoutes.apiLmGeneratedLastTwoMonth}?salesForceId=$salesForceId";
          break;
        default:
          url =
              "${ApiRoutes.apiLmGeneratedTwoWeeks}?salesForceId=$salesForceId";
      }

      ApiResponse response = await NetworkCall.getApiCallWithToken(url);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final List<dynamic> data = jsonDecode(response.responseString!);
        leadGeneratedList.value =
            data.map((e) => LeadConvertedModel.fromJson(e)).toList();
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
    fetchLeadGeneratedData(0);

    super.onInit();
  }
}
