import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/core/exception/login_exception.dart';
import 'package:front_flutter/app/core/models/user_model.dart';
import 'package:front_flutter/app/core/storage/local.dart';
import 'package:front_flutter/app/modules/login/login_repository.dart';
import 'package:get/state_manager.dart';

class LoginController {
  LoginRepository loginRepository;
  LoginController(this.loginRepository);

  final TextEditingController loginUsernameController = TextEditingController(text: "root");
  final TextEditingController loginPasswordController = TextEditingController(text: "root");

  final TextEditingController registerUsernameController = TextEditingController();
  final TextEditingController registerLoginPasswordController = TextEditingController();

  final RxString msg = ''.obs;
  final RxBool blCheckBox = false.obs;

  Future<void> login() async {
    final local = Modular.get<Local>();
    UserModel usuario = UserModel();
    usuario.username = loginUsernameController.text;
    usuario.password = loginPasswordController.text;

    try {
      String result = await loginRepository.login(
        usuario.username!,
        usuario.password!,
      );

      // final token = result.split(".")[1];

      // var payload = utf8.decode(base64.decode(base64.normalize(token)));
      // debugPrint(token);
      // debugPrint(jsonDecode(payload)['username']);

      // prefes.setString('token', result);
      local.save(chave: 'token', valor: result);
      goHome();
    } on LoginException catch (e) {
      msg.value = e.message;
    }
  }

  goHome() => Modular.to.pushNamed('/home/dashboard/');
  goSignup() => Modular.to.pushNamed('/signup');
}
