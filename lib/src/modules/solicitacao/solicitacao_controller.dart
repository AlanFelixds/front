import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/src/core/models/event_model.dart';
import 'package:front_flutter/src/core/models/participant_event_model.dart';
import 'package:front_flutter/src/core/models/participant_model.dart';
import 'package:front_flutter/src/core/utils/conversor/date_time.dart';
import 'package:front_flutter/src/modules/solicitacao/solicitacao_repository.dart';
import 'package:get/get.dart';

class SolicitacaoController extends GetxController {
  SolicitacaoRepository solicitacaoRepository;
  SolicitacaoController(this.solicitacaoRepository);

  TextEditingController nomeParticipanteController = TextEditingController();
  TextEditingController emailParticipantController = TextEditingController();

  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventDateController = TextEditingController(text: '2021-12-22 15:32:00');

  RxString nome = ''.obs;
  RxList<EventModel> events = <EventModel>[].obs;
  RxList<ParticipantEventModel> participants = <ParticipantEventModel>[].obs;

  final GlobalKey<FormState> formEventKey = GlobalKey<FormState>();

  Future<void> createEvent() async {
    EventModel eventModel = EventModel();
    eventModel.eventName = eventNameController.text;
    eventModel.eventDate = UtilsDatetime.stringToDate(eventDateController.text);

    await solicitacaoRepository.createEvent(eventModel);
  }

  Future<void> listEvent() async {
    events.clear();
    try {
      final List result = await solicitacaoRepository.listEvent();

      for (var element in result) {
        events.add(EventModel.fromMap(element));
      }
    } catch (e) {
      debugPrint("Sem eventos cadastrado!! $e");
    }
  }

  Future<void> addParticipant({required String eventID}) async {
    ParticipantModel participantModel = ParticipantModel();
    participantModel.nameParticipant = nomeParticipanteController.text;
    participantModel.emailParticipant = emailParticipantController.text;
    participantModel.idEvent = eventID;

    await solicitacaoRepository.addParticipant(participantModel);
  }

  Future<void> listParticipants({required String eventID}) async {
    participants.clear();
    try {
      final result = await solicitacaoRepository.listParticipantsEvent(eventID: eventID);
      for (var element in result) {
        participants.add(ParticipantEventModel.fromMap(element));
      }
      print(participants[0].name);
    } catch (e) {
      debugPrint("Sem participantes cadastrado!! $e");
    }
  }

  void goToCadastrarEventos() {
    Modular.to.pushNamed('/solicitacao/delivery');
  }
}
