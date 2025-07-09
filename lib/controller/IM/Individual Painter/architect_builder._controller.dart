import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../model/IM/architect_model.dart';
import '../../../network/network_call.dart';
import '../../../utils/api_routes.dart';
import '../../auth_controller.dart';

class ArchitectBuilderController extends GetxController implements GetxService {
  final AuthController authController = Get.find<AuthController>();

  // Original data from API
  RxList<ArchitectModel> allArchitectList = <ArchitectModel>[].obs;

  // Filtered data for display
  RxList<ArchitectModel> filteredArchitectList = <ArchitectModel>[].obs;

  // Search query
  RxString searchQuery = ''.obs;

  RxString errorMessage = ''.obs;

  Future<void> fetchArchitectDetail() async {
    EasyLoading.show();

    String salesForceId = authController.salesForceId;
    String url = "${ApiRoutes.apiImArchitectDetail}?lmSalesForceId=$salesForceId";

    try {
      ApiResponse response = await NetworkCall.getApiCallWithToken(url);
      EasyLoading.dismiss();

      if ((response.done ?? false) && response.responseString != null) {
        print("Response string: ${response.responseString}");

        // Try to detect structure
        final decoded = jsonDecode(response.responseString!);
        final List<dynamic> data = decoded is List
            ? decoded
            : decoded['Data'] ?? []; // Adjust key if needed

        allArchitectList.value = data.map((e) => ArchitectModel.fromJson(e)).toList();

        // Initialize filtered list with all data
        filteredArchitectList.value = allArchitectList.value;

      } else {
        errorMessage.value = response.errorMsg ?? 'Unknown error';
        print("Architect Error: ${response.errorMsg}");
      }
    } catch (e, stackTrace) {
      EasyLoading.dismiss();
      errorMessage.value = 'Exception: $e';
      print("Parsing Exception: $e");
      print("StackTrace: $stackTrace");
    }
  }

  /// ✅ Search functionality
  void searchArchitects(String query) {
    searchQuery.value = query;

    if (query.trim().isEmpty) {
      filteredArchitectList.value = allArchitectList;
    } else {
      final searchWords = query.toLowerCase().split(' ');

      filteredArchitectList.value = allArchitectList.where((architect) {
        final name = architect.personName?.toLowerCase().split(' ') ?? [];

        // Compare first two words only
        for (int i = 0; i < searchWords.length && i < 2 && i < name.length; i++) {
          if (!name[i].startsWith(searchWords[i])) return false;
        }

        return true;
      }).toList();
    }
  }


  /// ✅ Clear search
  void clearSearch() {
    searchQuery.value = '';
    filteredArchitectList.value = allArchitectList.value;
  }

  /// ✅ Getter for search results count
  int get searchResultsCount => filteredArchitectList.length;

  /// ✅ Check if search is active
  bool get isSearchActive => searchQuery.value.isNotEmpty;

  @override
  void onInit() {
    fetchArchitectDetail();
    super.onInit();
  }
}