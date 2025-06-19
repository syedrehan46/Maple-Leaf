import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../model/IM/all_painter_detail_model.dart';
import '../../../network/network_call.dart';
import '../../../utils/api_routes.dart';
import '../../auth_controller.dart';

class AllPaniterDetailController extends GetxController implements GetxService {
  RxList<AllPainterDetailModel> allPainterList = <AllPainterDetailModel>[].obs;
  RxList<String> areaNameList = <String>[].obs;
  RxString errorMessage = ''.obs;
  RxString salesForceId = ''.obs;

  Future<void> fetchPainetrDetail() async {
    EasyLoading.show();

    String url = "${ApiRoutes.apiAllPainterDetail}?salesForceId=$salesForceId";
    print("URL>> $url");

    ApiResponse response = await NetworkCall.getApiCallWithToken(url);

    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);
        allPainterList.value = data.map((e) => AllPainterDetailModel.fromJson(e)).toList();

        updateAreaList(); // update area list after data is fetched

        print("Painter response >>> ${allPainterList.length} items");
      } catch (e) {
        errorMessage.value = 'Failed to parse data';
        print("Parse Error: $e");
      }
    } else {
      errorMessage.value = response.errorMsg ?? 'Unknown error';
      print("API Error: ${response.errorMsg}");
    }
  }

  void updateAreaList() {
    final names = allPainterList
        .map((e) => e.areaName)
        .whereType<String>()
        .toSet()
        .toList();

    areaNameList.value = names;
    print("Unique Area Names: $areaNameList");
  }

  @override
  void onInit() {
    super.onInit();
    final AuthController authController = Get.find<AuthController>();
    salesForceId.value = authController.salesForceId;

    print("Fetched salesForceId: ${salesForceId.value}");
    fetchPainetrDetail();
  }
}
