import 'package:front_flutter/pages/login/login_controller.dart';
import 'package:front_flutter/pages/login/login_repository.dart';
import 'package:front_flutter/utils/web_service/web_service.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(Get.find()));
    Get.lazyPut<LoginRepository>(() => LoginRepository(WebService()));
  }
}
