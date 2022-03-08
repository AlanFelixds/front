import 'package:get/get.dart';

class RouterController extends GetxController {
  RouterController();

  final RxInt indexRoute = 0.obs;
  RxMap<int, String> mapNavigation = {
    0: '/home',
    1: '/home/request_certification',
    2: '/home/request_list',
    3: '/home/perfil',
  }.obs;

  @override
  void onInit() {
    super.onInit();
    ever(indexRoute, (_) {
      Get.rootDelegate.toNamed(mapNavigation.values.elementAt(indexRoute.value));
    });
  }
}
