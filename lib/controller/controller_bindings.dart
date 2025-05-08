
import 'package:get/get.dart';

import 'auth_controller.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(()=>AuthController());
  }
}