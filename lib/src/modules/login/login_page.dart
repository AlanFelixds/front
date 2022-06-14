import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:front_flutter/src/core/themes/color_pallete.dart';
import 'package:front_flutter/src/core/widgets/customs/button/custom_button.dart';
import 'package:front_flutter/src/core/widgets/customs/button/custom_elevated_button.dart';
import 'package:front_flutter/src/core/widgets/customs/button/custom_text_button.dart';
import 'package:front_flutter/src/core/widgets/customs/text-form-field/custom_text_form_field.dart';
import 'package:front_flutter/src/core/widgets/customs/title/custom_title.dart';
import 'package:front_flutter/src/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    final sizeWidget = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ThemeColors.white,
      // backgroundColor: Colors.blueGrey[900],
      body: sizeWidget > 600 ? uiDesktop() : uiMobile(),
    );
  }

  Widget uiDesktop() {
    return Row(
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
                    CustomTextFormField(icon: const Icon(Icons.alternate_email_rounded, color: Colors.green), textController: controller.loginEmailController, hint: 'Email'),
                    CustomTextFormField(
                      icon: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              controller.blPassword.value = !controller.blPassword.value;
                            });
                          },
                          icon: Icon(
                            controller.blPassword.value ? Icons.lock_outline : Icons.lock_open_rounded,
                            color: controller.blPassword.value == true ? Colors.green : Colors.grey,
                          ),
                        ),
                      ),
                      textController: controller.loginPasswordController,
                      hint: 'Password',
                      blPassword: controller.blPassword.value,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () {
                            return TextButton.icon(
                              onPressed: () => controller.blCheckBox.value = !controller.blCheckBox.value,
                              icon: controller.blCheckBox.value
                                  ? const Icon(
                                      Icons.check_box_rounded,
                                      color: Colors.green,
                                    )
                                  : const Icon(Icons.check_box_outline_blank_rounded, color: Colors.green),
                              label: const Text("Remember me", style: TextStyle(color: Colors.green)),
                            );
                          },
                        ),
                        CustomTextButton(
                          onPressed: () {},
                          label: "Forgot password ?",
                        ),
                      ],
                    ),
                    CustomElevatedButton(onPressed: () => controller.login(), label: 'Sing in'),
                    CustomTextButton(
                      onPressed: () => controller.goSignup(),
                      label: "Não possue uma conta ? Clique aqui",
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Modular.to.navigate('/validation');
                      },
                      label: "Validar certificado",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget uiMobile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Container(
          width: 350,
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Email", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormField(textController: controller.loginEmailController, hint: "Email"),
              const SizedBox(height: 10),
              const Text("Password", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormField(textController: controller.loginPasswordController, hint: "Password"),
              const SizedBox(height: 20),
              Row(
                children: [
                  CustomButton(
                    onPressed: () => controller.login(),
                    text: "Entrar",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Não possui uma conta ? "),
                  TextButton(
                    onPressed: () => controller.goSignup(),
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
