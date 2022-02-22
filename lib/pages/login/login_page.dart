import 'dart:js';

import 'package:flutter/material.dart';
import 'package:front_flutter/pages/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetResponsiveView<LoginController> {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(
              child: Container(
                height: Get.height,
                color: const Color(0xFF90EE90),
                child: Center(
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwDD_mgWBt4Q_YwGuFIqOU8Dv-GZM8q-_ZWg&usqp=CAU",
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: Get.height,
                child: Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Column(
                      children: [
                        CustomTextFormField(controller: controller.userController, label: 'Email', icon: const Icon(Icons.alternate_email_rounded), context: context),
                        CustomTextFormField(controller: controller.passwordController, label: 'Password', icon: const Icon(Icons.lock_outline), context: context),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [Text("Recovery password "), Text(" Remember me")]),
                        CustomElevatedButton(
                            onPressed: () {
                              controller.goToHome();
                            },
                            label: 'Sing in'),
                        TextButton(
                            onPressed: () {
                              controller.goToSignup();
                            },
                            child: const Text('Não possue uma conta ? Clique aqui'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget CustomTextFormField({required TextEditingController controller, String? hint, String? label, required Widget icon, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: SizedBox(
      width: 300,
      height: 40,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          label: Text(label ?? ''),
          contentPadding: const EdgeInsets.all(10.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(
              color: Color(0xFF295cc5),
              width: 1,
            ),
          ),
          hoverColor: Colors.transparent,
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.red,
          suffixIcon: icon,
        ),
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget CustomElevatedButton({required VoidCallback onPressed, required String label}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF295cc5),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label),
      ),
    ),
  );
}
