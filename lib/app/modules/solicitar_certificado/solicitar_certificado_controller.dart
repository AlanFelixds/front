import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/core/models/product_model.dart';
import 'package:front_flutter/app/modules/solicitar_certificado/solicitar_certificado_repository.dart';
import 'package:get/get.dart';

class SolicitarCertificadoController extends GetxController {
  SolicitarCertificadoRepository solicitacaoCertificadoRepository;
  SolicitarCertificadoController(this.solicitacaoCertificadoRepository);

  TextEditingController nomeParticipanteController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();

  RxString nome = ''.obs;
  RxList deliveries = [].obs;

  Future<void> createDelivery() async {
    ProductModel product = ProductModel();
    product.itemName = itemNameController.text;
    await solicitacaoCertificadoRepository.createDelivery(product);
  }

  Future<void> buscarDeliveries() async {
    deliveries.clear();
    final result = await solicitacaoCertificadoRepository.buscarDeliveries();
    deliveries.addAll(result[0]['deliveries']);
  }

  void goToCadastrarEventos() {
    Modular.to.pushNamed('/solicitacao/delivery');
  }
}
