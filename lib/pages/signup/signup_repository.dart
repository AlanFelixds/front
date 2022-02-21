import 'package:front_flutter/utils/web_service/web_service.dart';

class SignupRepository {
  final WebService webService;
  SignupRepository(this.webService);

  Future<void> createUserF(user, password, email) async {
    final response = webService.postResponse('createUser', {
      'user': user,
      'password': password,
      'email': email,
    });
  }
}
