import 'package:front_flutter/src/core/database/interface_web_client.dart';

class SignupRepository {
  final IWebClient _webService;
  SignupRepository(this._webService);

  Future<dynamic> register(String email, String password) async {
    final response = await _webService.post(url: '/signup', body: {
      'email': email,
      'password': password,
    });
    return response;
  }
}
