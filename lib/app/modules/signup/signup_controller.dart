import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/modules/signup/signup_repository.dart';

import 'package:get/get.dart';

class SignupController extends GetxController {
  final SignupRepository signupRepository;
  SignupController(this.signupRepository);

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  createUser() {
    signupRepository.signup(nameController.text, passwordController.text, emailController.text);
  }

  goToLogin() {
    // Get.offAllNamed(NamedRoutes.LOGIN);
    Modular.to.pushNamed('login');
  }
}
