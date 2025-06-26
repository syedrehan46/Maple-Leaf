import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/controller/auth_controller.dart';
import '../../model/PE/PainterEngagedModel.dart' show EngagedPainterModel;
import '../../network/network_call.dart';
import '../../utils/api_routes.dart';

class PainterEngagedController extends GetxController {
  final AuthController authController = Get.find<AuthController>();

  RxList<EngagedPainterModel> engagedPainterList = <EngagedPainterModel>[].obs;
  RxList<EngagedPainterModel> filteredPainterList = <EngagedPainterModel>[].obs;
  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    String salesForceId = "${authController.salesForceId}";
    fetchPainterEngagedData(salesForceId);

    // Initialize filtered list with all painters
    filteredPainterList.assignAll(engagedPainterList);
  }

  // Method to update search query and filter list
  void updateSearchQuery(String query) {
    searchQuery.value = query;
    applySearchFilter();
  }

  void applySearchFilter() {
    if (searchQuery.value.isEmpty) {
      // Show all painters when search is empty
      filteredPainterList.assignAll(engagedPainterList);
    } else {
      // Filter painters based on search query
      filteredPainterList.assignAll(
        engagedPainterList.where((painter) {
          final painterName = painter.painterName?.toLowerCase()  ?? '';
          final phoneNumber = painter.phoneNumber?.toLowerCase() ?? '';

          final query = searchQuery.value.toLowerCase();

          // Check if painter name contains the search query
          return painterName.contains(query)||phoneNumber.contains(query);
        }).toList(),
      );
    }
  }

  Future<void> fetchPainterEngagedData(String salesForceId) async {
    EasyLoading.show();
    String url = "${ApiRoutes.apiEngagedPainter}?salesForceId=$salesForceId";
    ApiResponse response = await NetworkCall.getApiCallWithToken(url);
    EasyLoading.dismiss();

    if ((response.done ?? false) && response.responseString != null) {
      try {
        final List<dynamic> data = jsonDecode(response.responseString!);
        engagedPainterList.value = data
            .map((e) => EngagedPainterModel.fromJson(e as Map<String, dynamic>))
            .toList();

        // Update filtered list after fetching data
        applySearchFilter();
      } catch (e) {
        print("Parse Error: $e");
      }
    } else {
      print("API Error: ${response.errorMsg}");
    }
  }

  // Method to clear search
  void clearSearch() {
    searchQuery.value = '';
    applySearchFilter();
  }
}