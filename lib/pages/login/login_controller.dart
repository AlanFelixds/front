import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:front_flutter/models/user_model.dart';
import 'package:front_flutter/pages/login/login_repository.dart';
import 'package:front_flutter/utils/routes/const_named_routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository;
  LoginController(this.loginRepository);

  final userController = TextEditingController(text: 'admin');
  final passwordController = TextEditingController(text: 'admin');

  Future<void> login() async {
    try {
      UserModel userModel = UserModel();
      userModel.user = userController.text;
      userModel.password = passwordController.text;
      userModel = await loginRepository.signIn(userModel);
      goToHome();
    } catch (e) {
      log("Error: Function SignIn. Excessão: " + e.toString());
    }
  }

  goToSignup() {
    Get.offAllNamed(NamedRoutes.SIGNUP);
  }

  goToHome() {
    // Get.offAllNamed(NamedRoutes.SIGNUP);
    Get.toNamed(NamedRoutes.HOME);
  }
}
