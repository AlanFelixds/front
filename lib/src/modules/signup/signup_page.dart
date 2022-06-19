import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:front_flutter/src/core/widgets/customs/button/custom_button.dart';
import 'package:front_flutter/src/core/widgets/customs/text-form-field/custom_text_form_field.dart';
import 'package:front_flutter/src/core/widgets/customs/title/custom_title.dart';
import 'package:front_flutter/src/modules/signup/signup_controller.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  final controller = Modular.get<SignupController>();

  @override
  Widget build(BuildContext context) {
    final sizeWidget = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.green[400],
      body: sizeWidget > 600 ? uiDesktop() : uiMobile(),
    );
  }

  Widget uiDesktop() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Container(
            width: 300,
            height: 350,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(icon: const Icon(Icons.alternate_email_rounded), textController: controller.emailController, hint: 'Email'),
                CustomTextFormField(icon: const Icon(Icons.not_listed_location_outlined), textController: controller.nomeController, hint: 'Nome'),
                CustomTextFormField(icon: const Icon(Icons.lock_outline), textController: controller.senhaController, hint: 'Password'),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CustomButton(
                        onPressed: () {
                          controller.createUser();
                        },
                        text: "Cadastrar"),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget uiMobile() {
    return Center(
      child: Column(
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
                CustomTextFormField(textController: controller.emailController, hint: "Email"),
                const Text("Nome", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
                const SizedBox(height: 5),
                CustomTextFormField(textController: controller.nomeController, hint: "Nome"),
                const SizedBox(height: 10),
                const Text("Senha", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
                const SizedBox(height: 5),
                CustomTextFormField(textController: controller.senhaController, hint: "Senha"),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CustomButton(
                      onPressed: () => controller.createUser(),
                      text: "Cadastrar",
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
