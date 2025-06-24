import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/view/auth/change_password_view.dart';
import 'package:mapleleaf/view/auth/forget_password_change_view.dart';
import 'package:mapleleaf/view/auth/forgot_password_view.dart';
import 'package:mapleleaf/view/auth/sign_in_view.dart';
import 'package:mapleleaf/view/dashboard/select_dashboard_view.dart';
import '../main.dart';
import '../model/login_model.dart';
import '../network/network_call.dart';
import '../utils/api_routes.dart';
import '../utils/shared_keys.dart';
import '../view/auth/select_account_view.dart';

class AuthController extends GetxController implements GetxService {
  LoginModel? loginModel; // <-- Added this field to store login data

  void saveLoginData(String responseJson) {
    loginModel = LoginModel.fromRawJson(responseJson);
  }

  String get salesForceId => loginModel?.user?.salesForceId ?? "";
  String get employeeName => loginModel?.user?.employeeName ?? "";

  // Existing methods below

  apiLogin({required String userName, required String password, bool fromSplash = false}) async {
    String serialNumber = await FlutterUdid.udid;
    if (!fromSplash) {
      EasyLoading.show();
    }
    Map body = {
      "username": userName,
      "password": password,
      "deviceId": serialNumber,
    };
    ApiResponse apiResponse = await NetworkCall.postFormData(ApiRoutes.baseUrl + ApiRoutes.apiLogin, body);
    EasyLoading.dismiss();

    if (apiResponse.done ?? false) {
      LoginModel loginModelLocal = LoginModel.fromRawJson(apiResponse.responseString ?? "");
      // Save to the controller's loginModel field as well
      saveLoginData(apiResponse.responseString ?? "");

      if (loginModelLocal.success == "2") {
        preferences.setString(SharedKeys.keyUsername, loginModelLocal.user?.username ?? "");
        preferences.setString(SharedKeys.keyPswd, password);
        Get.offAll(() => const SelectDashboardView());
      } else {
        Get.offAll(() => const SignInView());
      }
    } else {
      print("Error ${apiResponse.errorMsg}");
    }
  }

  apiUpdateCredential({required String userName, required String oldPassword, required String newPassword}) async {
    String serialNumber = await FlutterUdid.udid;
    EasyLoading.show();
    Map body = {
      "username": userName,
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "deviceId": serialNumber,
    };
    ApiResponse apiResponse = await NetworkCall.postFormData(ApiRoutes.baseUrl + ApiRoutes.apiUpdateCredential, body);
    EasyLoading.dismiss();

    if (apiResponse.done ?? false) {
      LoginModel loginModelLocal = LoginModel.fromRawJson(apiResponse.responseString ?? "");
      // Optionally update controller's loginModel if needed
      saveLoginData(apiResponse.responseString ?? "");

      if (loginModelLocal.success == "1") {
        Get.offAll(() => const SelectDashboardView());
      } else {
        Get.offAll(() => const SignInView());
      }
    } else {
      print("Error ${apiResponse.errorMsg}");
    }
  }

  Future<void> apiVerifyPassword({
    required String empNo,
    required String cnic,
  }) async {
    String serialNumber = await FlutterUdid.udid;
    EasyLoading.show();

    Map<String, dynamic> body = {
      "empNo": empNo,
      "cnic": cnic,
      "deviceId": serialNumber,
    };

    ApiResponse apiResponse = await NetworkCall.postFormData(
      ApiRoutes.baseUrl + ApiRoutes.apiVerifyPassword,
      body,
    );

    EasyLoading.dismiss();

    if (apiResponse.done ?? false) {
      var result = jsonDecode(apiResponse.responseString ?? "{}");

      if (result['success'] == "1") {
        Get.to(() => ForgetPasswordView());
      }
    } else {
      print("Error ${apiResponse.errorMsg}");
    }
  }

  Future<void> apiChangePassword({
    required String empNo,
    required String password,
  }) async {
    String serialNumber = await FlutterUdid.udid;
    EasyLoading.show();

    Map<String, dynamic> body = {
      "empNo": empNo,
      "password": password,
      "deviceId": serialNumber,
    };

    ApiResponse apiResponse = await NetworkCall.postFormData(
      ApiRoutes.baseUrl + ApiRoutes.apiChangePassword,
      body,
    );

    EasyLoading.dismiss();

    if (apiResponse.done ?? false) {
      var result = jsonDecode(apiResponse.responseString ?? '{}');

      if (result['success'] == "1") {
        Get.to(() => SignInView());
      }
    } else {
      print("Error ${apiResponse.errorMsg}");
    }
  }
}
