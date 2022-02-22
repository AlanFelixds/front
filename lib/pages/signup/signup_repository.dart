import 'package:front_flutter/utils/web_service/web_service.dart';

class SignupRepository {
  final WebService webService;
  SignupRepository(this.webService);

  Future<void> signup(user, password, email) async {
    final response = webService.postResponse('/signup', {
      'user': user,
      'password': password,
      'email': email,
    });
  }
}
