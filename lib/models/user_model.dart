import 'dart:convert';

class UserModel {
  String? user;
  String? email;
  String? password;
  String? name;
  UserModel({
    this.user,
    this.email,
    this.password,
    this.name,
  });

  UserModel copyWith({
    String? user,
    String? email,
    String? password,
    String? name,
  }) {
    return UserModel(
      user: user ?? this.user,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'email': email,
      'password': password,
      'name': name,
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
      user: map['user'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(user: $user, email: $email, password: $password, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.user == user && other.email == email && other.password == password && other.name == name;
  }

  @override
  int get hashCode {
    return user.hashCode ^ email.hashCode ^ password.hashCode ^ name.hashCode;
  }
}
