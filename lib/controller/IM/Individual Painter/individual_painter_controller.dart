// import 'dart:convert';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:mapleleaf/model/login_model.dart';
// import '../../model/IS/Area Wise Planning User/areawise_model.dart';
// import '../../network/network_call.dart';
// import '../../utils/api_routes.dart';
//
// class IndividualPainterController extends GetxController implements GetxService {
//   RxList<PlanModel> planList = <PlanModel>[].obs;
//   RxString errorMessage = ''.obs;
//
//   Future<void> fetchPlanDataAreaWise(String salesForceId) async {
//     EasyLoading.show();
//
//     String url = "${ApiRoutes.apiIsPlanDetailAreaWise}?salesForceId=$salesForceId";
//
//     ApiResponse response = await NetworkCall.getApiCallWithToken(url);
//
//     EasyLoading.dismiss();
//
//     if ((response.done ?? false) && response.responseString != null) {
//       try {
//         final List<dynamic> data = jsonDecode(response.responseString!);
//         planList.value = data.map((e) => PlanModel.fromJson(e)).toList();
//       } catch (e) {
//         errorMessage.value = 'Failed to parse data';
//         print("Parse Error: $e");
//       }
//     } else {
//       errorMessage.value = response.errorMsg ?? 'Unknown error';
//       print("API Error: ${response.errorMsg}");
//     }
//   }
// }
