class UserModel {
  String? id;
  String? email;
  String? password;

  UserModel({
    this.id,
    this.email,
    this.password,
  });

  factory UserModel.fromJSON(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toMap(UserModel userModel) {
    return {
      "id": userModel.id,
      "email": userModel.email,
      "password": userModel.password,
    };
  }
}
