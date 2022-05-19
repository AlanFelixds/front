import 'package:front_flutter/src/core/database/interface_web_client.dart';

class SignupRepository {
  final IWebClient _webService;
  SignupRepository(this._webService);

  Future<dynamic> register(String email, String password, String name) async {
    final response = await _webService.post(url: '/signup', body: {
      'email': email,
      'name': name,
      'password': password,
    });
    return response;
  }
}
