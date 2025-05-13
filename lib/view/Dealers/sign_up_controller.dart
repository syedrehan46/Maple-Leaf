import 'package:get/get.dart';

class LoginController extends GetxController {
  var obscurePassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }
}
