import 'dart:convert';

class EventModel {
  String? id;
  String? eventName;
  DateTime? eventDate;

  EventModel({this.id, this.eventName, this.eventDate});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (eventName != null) {
      result.addAll({'event_name': eventName});
    }
    if (eventDate != null) {
      result.addAll({'event_date': eventDate!.millisecondsSinceEpoch});
    }

    return result;
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'],
      eventName: map['event_name'],
      // eventDate: map['event_date'] != null ? DateTime.fromMillisecondsSinceEpoch(map['event_date']) : null,
      eventDate: map['event_date'] != null ? DateTime.tryParse(map['event_date']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) => EventModel.fromMap(json.decode(source));

  // Map<String, dynamic> toGenerateMap() {
  //   return {
  //     'eventName': eventName,
  //     'eventDate': eventDate,
  //     'speaker': speaker,
  //     'speakerEmail': speakerEmail,
  //   };
  // }
}
