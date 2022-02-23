import 'package:front_flutter/models/user_model.dart';
import 'package:front_flutter/utils/web_service/web_service.dart';

class LoginRepository {
  final WebService webService;
  LoginRepository(this.webService);

  Future<UserModel> signIn(UserModel userModel) async {
    final Map<String, Object?> body = userModel.toMapLogin();
    final Map<String, dynamic>? response = await webService.postResponse('/signin', body);

    if (response == null) throw 'Usuário não encontrado Null';
    if (response['code'] == 10) throw 'Usuário não encontrado';
    return UserModel.fromMap(response);
  }
}
