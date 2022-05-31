import 'dart:convert';

class ParticipantEventModel {
  String? id;
  String? name;
  String? email;

  ParticipantEventModel({
    this.id,
    this.name,
    this.email,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (email != null) {
      result.addAll({'email': email});
    }

    return result;
  }

  factory ParticipantEventModel.fromMap(Map<String, dynamic> map) {
    return ParticipantEventModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipantEventModel.fromJson(String source) => ParticipantEventModel.fromMap(json.decode(source));
}
