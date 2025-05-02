
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:get/get.dart';
import 'package:mapleleaf/view/auth/sign_in_view.dart';
import 'package:mapleleaf/view/dashboard/select_dashboard_view.dart';

import '../main.dart';
import '../model/login_model.dart';
import '../network/network_call.dart';
import '../utils/api_routes.dart';
import '../utils/shared_keys.dart';
import '../view/auth/select_account_view.dart';

class AuthController extends GetxController implements GetxService{

  apiLogin({required String userName, required String password,bool fromSplash = false}) async{
    String serialNumber = await FlutterUdid.udid;
    if(!fromSplash){
      EasyLoading.show();
    }
    Map body = {
      "username": userName,
      "password": password,
      "deviceId":serialNumber,
    };
    ApiResponse apiResponse = await NetworkCall.postFormData(ApiRoutes.baseUrl + ApiRoutes.apiLogin, body);
    // print(apiResponse.responseString);
    EasyLoading.dismiss();
    if(apiResponse.done ?? false){
      LoginModel loginModel = LoginModel.fromRawJson(apiResponse.responseString ?? "");
      if(loginModel.success == "2"){
        preferences.setString(SharedKeys.keyUsername, loginModel.user?.username ?? "");
        preferences.setString(SharedKeys.keyPswd, password);
        Get.offAll(()=> const SelectDashboardView());
      }
      else{
        Get.offAll(()=> const SignInView());
      }
    }
    else{
      print("Error ${apiResponse.errorMsg}");
    }
  }


  apiUpdateCredential({required String userName, required String oldPassword, required String newPassword,}) async{
    String serialNumber = await FlutterUdid.udid;
    EasyLoading.show();
    Map body = {
      "username": userName,
      "oldPassword": oldPassword,
      "newPassword": newPassword,
      "deviceId":serialNumber,
    };
    ApiResponse apiResponse = await NetworkCall.postFormData(ApiRoutes.baseUrl + ApiRoutes.apiUpdateCredential, body);
    // print(apiResponse.responseString);
    EasyLoading.dismiss();
    if(apiResponse.done ?? false){
      LoginModel loginModel = LoginModel.fromRawJson(apiResponse.responseString ?? "");
      if(loginModel.success == "1"){
        Get.offAll(()=> const SelectDashboardView());
      }
      else{
        Get.offAll(()=> const SignInView());
      }
    }
    else{
      print("Error ${apiResponse.errorMsg}");
    }
  }

}