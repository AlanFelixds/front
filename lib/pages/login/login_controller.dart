import 'package:flutter/material.dart';
import 'package:front_flutter/pages/login/login_repository.dart';
import 'package:front_flutter/utils/routes/const_named_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository;
  LoginController(this.loginRepository);

  final userController = TextEditingController();
  final passwordController = TextEditingController();

  chamarLogin() {
    loginRepository.login(userController.text, passwordController.text);
  }

  goToSignup() {
    Get.offAllNamed(NamedRoutes.SIGNUP);
  }

  goToHome() {
    // Get.offAllNamed(NamedRoutes.SIGNUP);
    Get.toNamed(NamedRoutes.HOME);
  }
}
