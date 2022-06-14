import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/src/core/models/evento_model.dart';
import 'package:front_flutter/src/core/models/participant_event_model.dart';
import 'package:front_flutter/src/core/models/participante_model.dart';
import 'package:front_flutter/src/core/utils/constantes/template_const.dart';
import 'package:front_flutter/src/core/utils/conversor/date_time.dart';
import 'package:front_flutter/src/modules/evento/evento_repository.dart';
import 'package:get/get.dart';

class EventoController extends GetxController {
  EventoRepository eventoRepository;
  EventoController(this.eventoRepository);

  // CAMPOS DE TEXTO //

  TextEditingController nomeParticipanteController = TextEditingController();
  TextEditingController emailParticipantController = TextEditingController();

  TextEditingController nomeEventoController = TextEditingController();
  TextEditingController dataEventoController = TextEditingController(text: '2021-12-22 15:32:00');
  TextEditingController tipoEventoController = TextEditingController();
  TextEditingController cargaHorariaEventoController = TextEditingController();
  TextEditingController palestranteEventoController = TextEditingController();
  // FINAL CAMPOS DE TEXTO //

  RxString nome = ''.obs;
  RxList<EventoModel> events = <EventoModel>[].obs;
  RxList<ParticipantEventModel> participants = <ParticipantEventModel>[].obs;

  final GlobalKey<FormState> formEventKey = GlobalKey<FormState>();
  RxBool blTemplateSelection = false.obs;
  final RxString chekedBt = TemplateConst.templates[0].obs;
  RxString template = TemplateConst.templates[1].obs;

  Future<void> createEvent() async {
    EventoModel eventoModel = EventoModel();
    eventoModel.nome = nomeEventoController.text;
    eventoModel.data = UtilsDatetime.stringToDate(dataEventoController.text);
    eventoModel.tipo = tipoEventoController.text;
    eventoModel.cargaHoraria = cargaHorariaEventoController.text;
    eventoModel.palestrante = palestranteEventoController.text;

    eventoModel.template = chekedBt.value.split('/')[2];

    // print(eventoModel.toMap());

    await eventoRepository.criarEvento(eventoModel.toMap());
  }

  Future<void> listaEvent() async {
    events.clear();
    try {
      final List result = await eventoRepository.listEvent();

      for (var element in result) {
        events.add(EventoModel.fromMap(element));
      }
    } catch (e) {
      debugPrint("Sem eventos cadastrado!! $e");
    }
  }

  Future<void> adicionarParticipante({required String eventID}) async {
    ParticipantModel participantModel = ParticipantModel();
    participantModel.nameParticipant = nomeParticipanteController.text;
    participantModel.emailParticipant = emailParticipantController.text;
    participantModel.idEvent = eventID;

    await eventoRepository.addParticipant(participantModel);
  }

  Future<void> listaParticipantes({required String eventID}) async {
    participants.clear();
    try {
      final result = await eventoRepository.listParticipantsEvent(eventID: eventID);
      for (var element in result) {
        participants.add(ParticipantEventModel.fromMap(element));
      }
      debugPrint(participants[0].name);
    } catch (e) {
      debugPrint("Sem participantes cadastrado!! $e");
    }
  }

  void goToCadastrarEventos() {
    Modular.to.pushNamed('/evento/delivery');
  }
}
