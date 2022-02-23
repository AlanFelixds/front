import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:front_flutter/models/user_model.dart';
import 'package:front_flutter/pages/login/login_repository.dart';
import 'package:front_flutter/utils/routes/const_named_routes.dart';
import 'package:front_flutter/utils/shared/shared_preferences.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginRepository loginRepository;
  LoginController(this.loginRepository);

  final userController = TextEditingController(text: 'root');
  final passwordController = TextEditingController(text: 'root');

  RxBool blCheckBox = false.obs;

  @override
  void onInit() async {
    super.onInit();

    final bool? result = await LocalStorage.loadDataLocal(key: 'saveUser', option: 'Bool');
    // blCheckBox.value = result;
    // if (result == true ) {
    //   final String? result = await LocalStorage.loadDataLocal(key: 'user', option: 'String');
    //   userController.text = result!;
    // }
  }

  Future<void> login() async {
    try {
      UserModel userModel = UserModel();
      userModel.user = userController.text;
      userModel.password = passwordController.text;
      userModel = await loginRepository.signIn(userModel);
      print(userModel);
      if (blCheckBox.value == true) {
        LocalStorage.saveDataLocal(key: 'user', value: userModel.user!, option: 'String');
        LocalStorage.saveDataLocal(key: 'saveUser', value: blCheckBox.value, option: 'Bool');
      }
      goToHome(userModel);
    } catch (e) {
      log("Error: Function SignIn. Excessão: " + e.toString());
    }
  }

  goToSignup() {
    Get.toNamed(NamedRoutes.SIGNUP);
  }

  goToHome(UserModel userModel) {
    Get.toNamed(NamedRoutes.HOME, arguments: userModel);
  }
}
