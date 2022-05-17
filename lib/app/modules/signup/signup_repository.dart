import 'package:front_flutter/app/core/database/interface_web_client.dart';

class SignupRepository {
  final IWebClient _webService;
  SignupRepository(this._webService);

  Future<void> signup(user, password, email) async {
    _webService.post(url: '/signup', body: {
      'user': user,
      'password': password,
      'email': email,
    });
  }
}
