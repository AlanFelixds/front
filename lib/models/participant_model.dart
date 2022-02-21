import 'dart:convert';

class ParticipantModel {
  String? name;
  String? email;
  ParticipantModel({
    this.name,
    this.email,
  });

  ParticipantModel copyWith({
    String? name,
    String? email,
  }) {
    return ParticipantModel(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory ParticipantModel.fromMap(Map<String, dynamic> map) {
    return ParticipantModel(
      name: map['name'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipantModel.fromJson(String source) => ParticipantModel.fromMap(json.decode(source));

  @override
  String toString() => 'ParticipantModel(name: $name, email: $email)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ParticipantModel && other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}
