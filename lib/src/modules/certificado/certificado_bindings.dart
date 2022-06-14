import 'package:get/get.dart';
import './certificado_controller.dart';

class CertificadoBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(CertificadoController());
    }
}