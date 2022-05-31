import 'dart:convert';

class ParticipantModel {
  String? idEvent;
  String? nameParticipant;
  String? emailParticipant;

  ParticipantModel({
    this.idEvent,
    this.nameParticipant,
    this.emailParticipant,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (nameParticipant != null) {
      result.addAll({'name_participant': nameParticipant});
    }
    if (emailParticipant != null) {
      result.addAll({'email_participant': emailParticipant});
    }
    if (idEvent != null) {
      result.addAll({'id_event': idEvent});
    }

    return result;
  }

  factory ParticipantModel.fromMap(Map<String, dynamic> map) {
    return ParticipantModel(
      nameParticipant: map['name_participant'],
      emailParticipant: map['email_participant'],
      idEvent: map['id_event'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipantModel.fromJson(String source) => ParticipantModel.fromMap(json.decode(source));
}
