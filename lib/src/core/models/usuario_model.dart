class UsuarioModel {
  String? id;
  String? email;
  String? nome;
  String? senha;
  String? permissao;

  UsuarioModel({
    this.id,
    this.nome,
    this.email,
    this.senha,
    this.permissao,
  });

  factory UsuarioModel.fromJSON(Map<String, dynamic> json) {
    return UsuarioModel(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
      permissao: json['permissao'],
    );
  }

  Map<String, dynamic> toMap(UsuarioModel userModel) {
    return {
      "id": userModel.id,
      "nome": userModel.nome,
      "email": userModel.email,
      "senha": userModel.senha,
      "permissao": userModel.permissao,
    };
  }
}
