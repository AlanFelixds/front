import 'package:front_flutter/pages/signup/signup_controller.dart';
import 'package:front_flutter/pages/signup/signup_repository.dart';
import 'package:front_flutter/utils/web_service/web_service.dart';
import 'package:get/get.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController(Get.find()));
    Get.lazyPut<SignupRepository>(() => SignupRepository(WebService()));
  }
}
