import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/src/core/exception/login_exception.dart';
import 'package:front_flutter/src/core/models/user_model.dart';
import 'package:front_flutter/src/core/storage/local.dart';
import 'package:front_flutter/src/modules/login/login_repository.dart';
import 'package:get/state_manager.dart';

class LoginController {
  LoginRepository loginRepository;
  LoginController(this.loginRepository);

  final TextEditingController loginUsernameController = TextEditingController(text: "alan");
  final TextEditingController loginPasswordController = TextEditingController(text: "alan");

  final TextEditingController registerUsernameController = TextEditingController();
  final TextEditingController registerLoginPasswordController = TextEditingController();

  final RxString msg = ''.obs;
  final RxBool blCheckBox = false.obs;

  Future<bool> login() async {
    // final SharedPreferences prefes = await Modular.getAsync<SharedPreferences>();
    final local = Modular.get<Local>();
    UserModel usuario = UserModel();
    usuario.username = loginUsernameController.text;
    usuario.password = loginPasswordController.text;

    try {
      String result = await loginRepository.login(
        usuario.username!,
        usuario.password!,
      );

      final token = result.split(".")[1];

      var payload = utf8.decode(base64.decode(base64.normalize(token)));
      debugPrint(token);
      debugPrint(jsonDecode(payload)['username']);

      // prefes.setString('token', result);
      local.save(chave: 'token', valor: result);
      goHome();
      return true;
    } on LoginException catch (e) {
      msg.value = e.message;
      return false;
    }
  }

  goHome() => Modular.to.navigate('/home/dashboard/');

  goSignup() => Modular.to.pushNamed('/signup');
}
