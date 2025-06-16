import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../model/LM/Lead Converted/lead_converted_model.dart';
import '../../network/network_call.dart';
import '../../utils/api_routes.dart';
import '../auth_controller.dart';

class LeadConvertedController extends GetxController implements GetxService {
  final AuthController authController = Get.find<AuthController>();

  RxList<LeadConvertedModel> leadConvertedList = <LeadConvertedModel>[].obs;
  RxString errorMessage = ''.obs;
  RxList<String> retailerList = <String>[].obs;
  RxList<String> productList = <String>[].obs;

  Future<void> fetchLeadConvertedData() async {
    EasyLoading.show(status: 'Loading...');
    try {
      String salesForceId = authController.salesForceId;
      String url = "${ApiRoutes.apiLmConvertedLastMonth}?salesForceId=$salesForceId";

      ApiResponse response = await NetworkCall.getApiCallWithToken(url);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        final List<dynamic> data = jsonDecode(response.responseString!);

        // ✅ Convert list to model list
        leadConvertedList.value = data.map((e) => LeadConvertedModel.fromJson(e)).toList();
        print(leadConvertedList.value);

        // ✅ Collect all unique products and retailers from all items
        Set<String> allProducts = {};
        Set<String> allRetailers = {};

        for (var item in data) {
          if (item["products"] != null) {
            allProducts.addAll(List<String>.from(item["products"]));
          }
          if (item["retailers"] != null) {
            allRetailers.addAll(List<String>.from(item["retailers"]));
          }
        }

        productList.value = ["Select Product Sold", ...allProducts.toList()];
        retailerList.value = ["Select Retailer", ...allRetailers.toList()];
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
    fetchLeadConvertedData();
    super.onInit();
  }
}
