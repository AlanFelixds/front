import 'package:get/get.dart';
import './validar_certificado_controller.dart';

class ValidarCertificadoBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ValidarCertificadoController>(() => ValidarCertificadoController());
  }
}
