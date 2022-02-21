import 'package:flutter/material.dart';
import 'package:front_flutter/pages/signup/signup_repository.dart';
import 'package:front_flutter/utils/routes/const_named_routes.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final SignupRepository signupRepository;
  SignupController(this.signupRepository);

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  callRepository() {
    signupRepository.createUserF(nameController.text, passwordController.text, emailController.text);
  }

  goToLogin() {
    // Get.offAllNamed(NamedRoutes.LOGIN);
    Get.toNamed(NamedRoutes.LOGIN);
  }
}
