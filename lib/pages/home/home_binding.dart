import 'package:front_flutter/pages/home/home_controller.dart';
import 'package:front_flutter/pages/home/home_repository.dart';
import 'package:front_flutter/utils/controller/router_controller.dart';
import 'package:front_flutter/utils/web_service/web_service.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    Get.lazyPut<HomeRepository>(() => HomeRepository(WebService()));
    Get.lazyPut<RouterController>(() => RouterController());
  }
}
