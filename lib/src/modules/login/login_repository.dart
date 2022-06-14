import 'package:front_flutter/src/core/database/interface_web_client.dart';

class LoginRepository {
  final IWebClient _webService;
  LoginRepository(this._webService);

  Future<dynamic> login(String email, String senha) async {
    final response = await _webService.post(url: '/login', body: {
      'email': email,
      'senha': senha,
    });
    return response;
  }
}
