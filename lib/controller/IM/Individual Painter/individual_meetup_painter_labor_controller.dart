import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/model/login_model.dart';

import '../../../model/IM/indivdual_painter_model.dart';
import '../../../network/network_call.dart';
import '../../../utils/api_routes.dart';
import '../../auth_controller.dart';

class IndividualMeetupPainterLaborController extends GetxController implements GetxService {
  RxList<IndivdualPainterModel> meetupCardList = <IndivdualPainterModel>[].obs;
  RxInt get meetupCounts => meetupCardList.length.obs;
  RxString errorMessage = ''.obs;
  RxString salesForceId = ''.obs;

  // You can pass this as a parameter from your screen
  Rx<IndivdualPainterModel?> selectedPlan = Rx<IndivdualPainterModel?>(null);

  // Access selected card values
  String get selectedPlanId => selectedPlan.value?.planId?.toString() ?? '';
  String get selectedActualId => selectedPlan.value?.actualId?.toString() ?? '';
  String get selectedCreatedBy => selectedPlan.value?.createdBy?.toString() ?? '';

  Future<void> fetchPainetrDetail() async {


    EasyLoading.show();

    String url = "${ApiRoutes.apiEngamentPlanDetailLabor}?salesForceId=$salesForceId";
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

  @override
  void onInit() {
    super.onInit();
    final AuthController authController = Get.find<AuthController>();
    salesForceId.value = authController.salesForceId;

    print("Fetched salesForceId: ${salesForceId.value}");
    fetchPainetrDetail(); // Call your data-fetching method/ ✅ now it's called!
  }
}
