import 'package:front_flutter/src/core/database/interface_web_client.dart';

class SignupRepository {
  final IWebClient _webService;
  SignupRepository(this._webService);

  Future<dynamic> register(String name, String email, String senha) async {
    final response = await _webService.post(
      url: '/signup',
      body: {
        'nome': name,
        'email': email,
        'senha': senha,
      },
    );
    return response;
  }
}
