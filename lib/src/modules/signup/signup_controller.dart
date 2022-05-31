import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/src/core/models/user_model.dart';
import 'package:front_flutter/src/modules/signup/signup_repository.dart';

class SignupController {
  SignupRepository signupRepository;
  SignupController(this.signupRepository);

  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerNameController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();

  String msg = '';

  // Future<void> login() async {
  //   if (emailController.text == 'a' && passwordController.text == 'a') {
  //     Get.snackbar(
  //       'Login',
  //       "Login success",
  //       backgroundColor: Colors.green,
  //       duration: const Duration(seconds: 3),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //     msg = 'login efetuado';
  //   } else {
  //     Get.snackbar(
  //       'Login',
  //       "Login fail",
  //       backgroundColor: Colors.red,
  //       duration: const Duration(seconds: 3),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  //   msg = 'usuário não encontrado';
  // }

  Future<void> createUser() async {
    UserModel user = UserModel();
    user.name = registerNameController.text;
    user.email = registerEmailController.text;
    user.password = registerPasswordController.text;

    final response = await signupRepository.register(
      registerNameController.text,
      registerEmailController.text,
      registerPasswordController.text,
    );

    if (response == "Usuario criado com sucesso.") {
      goLogin();
    }
  }

  goLogin() {
    Modular.to.navigate('/login');
  }
}
