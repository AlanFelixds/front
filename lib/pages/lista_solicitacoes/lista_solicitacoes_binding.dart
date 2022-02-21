import 'package:front_flutter/pages/lista_solicitacoes/lista_solicitacoes_controller.dart';
import 'package:front_flutter/pages/lista_solicitacoes/lista_solicitacoes_repository.dart';
import 'package:front_flutter/utils/web_service/web_service.dart';
import 'package:get/get.dart';

class ListaSolicitacoesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListaSolicitacoesController>(() => ListaSolicitacoesController(Get.find()));
    Get.lazyPut<ListaSolicitacoesRepository>(() => ListaSolicitacoesRepository(WebService()));
  }
}
