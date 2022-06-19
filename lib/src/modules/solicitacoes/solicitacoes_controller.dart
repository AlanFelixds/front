import 'package:flutter/material.dart';
import 'package:front_flutter/src/core/models/evento_model.dart';
import 'package:front_flutter/src/modules/solicitacoes/solicitacoes_repository.dart';
import 'package:get/get.dart';

class SolicitacoesController extends GetxController {
  SolicitacoesRepository solicitacoesRepository;
  SolicitacoesController(this.solicitacoesRepository);

  RxList<EventoModel> events = <EventoModel>[].obs;

  Future<void> listaEvent() async {
    events.clear();
    try {
      final List result = await solicitacoesRepository.listEvent();

      for (var element in result) {
        events.add(EventoModel.fromMap(element));
      }
    } catch (e) {
      debugPrint("Sem eventos cadastrado!! $e");
    }
  }
}
