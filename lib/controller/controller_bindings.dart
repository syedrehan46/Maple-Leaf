
import 'package:get/get.dart';

import 'auth_controller.dart';

class ControllerBindings extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(()=>AuthController());
  }
}