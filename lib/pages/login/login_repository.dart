import 'package:front_flutter/utils/web_service/web_service.dart';

class LoginRepository {
  final WebService webService;
  LoginRepository(this.webService);

  Future<void> login(user, password) async {
    final response = webService.postResponse('login', {
      'user': user,
      'password': password,
    });
  }
}
