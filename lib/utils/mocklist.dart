import 'package:front_flutter/models/event_model.dart';
import 'package:front_flutter/models/participant_model.dart';
import 'package:front_flutter/models/user_model.dart';

class ListaEventos {
  static List<EventModel> eventTeste = [
    EventModel(eventName: 'Praça', eventDate: '22-12', isExpanded: false, id: 1),
    EventModel(eventName: 'Pico', eventDate: '01-19', isExpanded: false, id: 2),
    EventModel(eventName: 'Raid', eventDate: '15-10', isExpanded: false, id: 3),
    EventModel(eventName: 'Grand', eventDate: '07-07', isExpanded: false, id: 4),
  ];

  static List<ParticipantModel> participant = [
    ParticipantModel(name: 'Alan', email: 'alan@gmail.com'),
    ParticipantModel(name: 'Amanda', email: 'amanda@gmail.com'),
    ParticipantModel(name: 'Felix', email: 'felix@gmail.com'),
  ];

  static List<ParticipantModel> participant2 = [
    ParticipantModel(name: 'Alisson', email: 'alisson@gmail.com'),
    ParticipantModel(name: 'Junior', email: 'junior@gmail.com'),
    ParticipantModel(name: 'Silvana', email: 'sil@gmail.com'),
  ];
}
