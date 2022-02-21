import 'dart:math';

import 'package:flutter/material.dart';
import 'package:front_flutter/models/event_model.dart';
import 'package:front_flutter/models/participant_model.dart';
import 'package:front_flutter/pages/solicitar_certificado/solicitar_certificado_repository.dart';
import 'package:get/get.dart';

class SolicitarCertificadoController extends GetxController {
  final SolicitiarCertificadoRepository solicitiarCertificadoRepository;
  SolicitarCertificadoController(this.solicitiarCertificadoRepository);

  final RxList<ParticipantModel> participants = <ParticipantModel>[].obs;
  final RxList<EventModel> events = <EventModel>[].obs;

  final ScrollController controllerOne = ScrollController();
  RxBool blExpandedPanel = false.obs;

  RxInt ii = 4.obs;

  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventDateController = TextEditingController();
  final TextEditingController eventTeacherNameController = TextEditingController();
  final TextEditingController eventTeacherEmailController = TextEditingController();
  final TextEditingController participantNameController = TextEditingController();
  final TextEditingController participantEmailController = TextEditingController();

  List eventos = [];

  void addParticipante() {
    ParticipantModel participant = ParticipantModel();
    participant.name = participantNameController.text;
    participant.email = participantEmailController.text;

    participants.add(participant);
  }

  void addEvent() {
    int id = Random().nextInt(100);
    EventModel event = EventModel(id: id);
    event.eventName = eventNameController.text;
    event.eventDate = eventDateController.text;
    event.eventTeacherName = eventTeacherNameController.text;
    event.eventTeacherEmail = eventTeacherEmailController.text;
    event.eventParticipants = participants;
    events.add(event);
  }

  goToListaSolicitacoes() {
    Get.toNamed('/listaSolicitacoes');
  }

  goToEventDetail() {
    Get.toNamed('/event-detail', arguments: events);
  }
}
