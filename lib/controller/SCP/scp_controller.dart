import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/IM/all_painter_detail_model.dart';
import '../../network/network_call.dart';
import '../../utils/api_routes.dart';
import '../auth_controller.dart';

class SCPController extends GetxController implements GetxService {
  final AuthController authController = Get.find<AuthController>();

  RxList<String> painterNameList = <String>[].obs;
  RxList<String> painterNumberList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPainterDetails();
  }

  Future<void> fetchPainterDetails() async {
    EasyLoading.show();

    final salesForceId = authController.salesForceId;
    final String url = "${ApiRoutes.apiAllPainterDetail}?salesForceId=$salesForceId";
    ApiResponse response = await NetworkCall.getApiCallWithToken(url);

    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        // print("Painter API Raw Response:\n${response.responseString}");

        final List<dynamic> jsonData = jsonDecode(response.responseString!);
        List<AllPainterDetailModel> painterDetails =
        jsonData.map((e) => AllPainterDetailModel.fromJson(e)).toList();
        // ✅ Extract names and numbers, ignoring nulls
        painterNameList.value = painterDetails
            .map((e) => e.painterName)
            .whereType<String>()
            .toList();

        painterNumberList.value = painterDetails
            .map((e) => e.phoneNumber)
            .whereType<String>()
            .toList();
      }
      catch (e) {
        Get.snackbar("Parse Error", "Failed to parse painter details.");
        print("Painter Parse Error: $e");
      }
    }
    else {
      Get.snackbar("API Error", response.errorMsg ?? "Unknown error occurred.");
      print("Painter API Error: ${response.errorMsg}");
    }
  }
}
