import 'package:front_flutter/pages/solicitar_certificado/solicitar_certificado_controller.dart';
import 'package:front_flutter/pages/solicitar_certificado/solicitar_certificado_repository.dart';
import 'package:front_flutter/utils/web_service/web_service.dart';
import 'package:get/get.dart';

class SolicitarCertificadoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SolicitarCertificadoController>(() => SolicitarCertificadoController(Get.find()));
    Get.lazyPut<SolicitiarCertificadoRepository>(() => SolicitiarCertificadoRepository(WebService()));
  }
}
