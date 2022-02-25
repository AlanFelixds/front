import 'package:get/get.dart';

class RouteController extends GetxController {
  RouteController();

  goToHome() {
    Get.toNamed('/home');
  }

  goToSolicitarCertificado() {
    Get.toNamed('/solicitarCertificado');
  }

  goToLogout() {
    Get.toNamed('/signout');
  }
}
