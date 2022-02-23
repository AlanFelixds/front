import 'dart:convert';

class UserModel {
  String? id;
  String? user;
  String? email;
  String? password;
  UserModel({
    this.id,
    this.user,
    this.email,
    this.password,
  });

  UserModel copyWith({
    String? id,
    String? user,
    String? email,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user': user,
      'email': email,
      'password': password,
    };
  }

  Map<String, dynamic> toMapLogin() {
    return {
      'user': user,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      user: map['user'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, user: $user, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.id == id && other.user == user && other.email == email && other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^ user.hashCode ^ email.hashCode ^ password.hashCode;
  }
}
