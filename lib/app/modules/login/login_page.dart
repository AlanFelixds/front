import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/core/utils/themes/color_palette.dart';
import 'package:front_flutter/app/core/widgets/customs/button/custom_elevated_button.dart';
import 'package:front_flutter/app/core/widgets/customs/text-form-field/custom_text_form_field.dart';
import 'package:front_flutter/app/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<LoginController>();

    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: Get.height,
              color: ThemeColors.appBackgroundLogin,
              child: Center(
                child: Image.asset('assets/images/logo.jpg'),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: Get.height,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: ThemeColors.appDrawer),
                  ),
                  width: 400,
                  height: 450,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(icon: const Icon(Icons.alternate_email_rounded), textController: controller.loginUsernameController, hint: 'Email'),
                      CustomTextFormField(icon: const Icon(Icons.lock_outline), textController: controller.loginPasswordController, hint: 'Password'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() {
                            return TextButton.icon(
                              onPressed: () => controller.blCheckBox.value = !controller.blCheckBox.value,
                              icon: controller.blCheckBox.value ? const Icon(Icons.check_box_rounded) : const Icon(Icons.check_box_outline_blank_rounded),
                              label: const Text("Remember me"),
                            );
                          }),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Forgot password ?"),
                          ),
                        ],
                      ),
                      CustomElevatedButton(onPressed: () => controller.login(), label: 'Sing in'),
                      TextButton(onPressed: () => controller.goSignup(), child: const Text('Não possue uma conta ? Clique aqui'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
