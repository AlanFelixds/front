import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:front_flutter/models/participant_model.dart';

class EventModel {
  int id;
  String? eventName;
  String? eventDate;
  String? eventTeacherName;
  String? eventTeacherEmail;

  List<ParticipantModel>? eventParticipants;

  bool? isExpanded;

  EventModel({
    required this.id,
    this.eventName,
    this.eventDate,
    this.eventTeacherName,
    this.eventTeacherEmail,
    this.eventParticipants,
    this.isExpanded = false,
  });

  EventModel copyWith({
    int? id,
    String? eventName,
    String? eventDate,
    String? eventTeacherName,
    String? eventTeacherEmail,
    List<ParticipantModel>? eventParticipants,
    bool? isExpanded,
  }) {
    return EventModel(
      id: id ?? this.id,
      eventName: eventName ?? this.eventName,
      eventDate: eventDate ?? this.eventDate,
      eventTeacherName: eventTeacherName ?? this.eventTeacherName,
      eventTeacherEmail: eventTeacherEmail ?? this.eventTeacherEmail,
      eventParticipants: eventParticipants ?? this.eventParticipants,
      isExpanded: isExpanded ?? this.isExpanded,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'eventName': eventName,
      'eventDate': eventDate,
      'eventTeacherName': eventTeacherName,
      'eventTeacherEmail': eventTeacherEmail,
      'eventParticipants': eventParticipants?.map((x) => x.toMap()).toList(),
      'isExpanded': isExpanded,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id']?.toInt() ?? 0,
      eventName: map['eventName'],
      eventDate: map['eventDate'],
      eventTeacherName: map['eventTeacherName'],
      eventTeacherEmail: map['eventTeacherEmail'],
      eventParticipants: map['eventParticipants'] != null ? List<ParticipantModel>.from(map['eventParticipants']?.map((x) => ParticipantModel.fromMap(x))) : null,
      isExpanded: map['isExpanded'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventModel(id: $id, eventName: $eventName, eventDate: $eventDate, eventTeacherName: $eventTeacherName, eventTeacherEmail: $eventTeacherEmail, eventParticipants: $eventParticipants, isExpanded: $isExpanded)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventModel && other.id == id && other.eventName == eventName && other.eventDate == eventDate && other.eventTeacherName == eventTeacherName && other.eventTeacherEmail == eventTeacherEmail && listEquals(other.eventParticipants, eventParticipants) && other.isExpanded == isExpanded;
  }

  @override
  int get hashCode {
    return id.hashCode ^ eventName.hashCode ^ eventDate.hashCode ^ eventTeacherName.hashCode ^ eventTeacherEmail.hashCode ^ eventParticipants.hashCode ^ isExpanded.hashCode;
  }
}
