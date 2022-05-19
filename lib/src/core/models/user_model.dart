class UserModel {
  String? id;
  String? email;
  String? name;
  String? password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
  });

  factory UserModel.fromJSON(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toMap(UserModel userModel) {
    return {
      "id": userModel.id,
      "name": userModel.name,
      "email": userModel.email,
      "password": userModel.password,
    };
  }
}
