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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Expanded(
              child: Divider(color: Colors.white, indent: 300, endIndent: 20, height: 3),
            ),
            CustomTitle(text: 'Signup'),
            Expanded(
              child: Divider(color: Colors.white, indent: 20, endIndent: 300, height: 3),
            ),
          ],
        ),
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
              CustomTextFormField(icon: const Icon(Icons.alternate_email_rounded), textController: controller.registerEmailController, label: 'Email'),
              CustomTextFormField(icon: const Icon(Icons.not_listed_location_outlined), textController: controller.registerNameController, label: 'Nome'),
              CustomTextFormField(icon: const Icon(Icons.lock_outline), textController: controller.registerPasswordController, label: 'Password'),
              const SizedBox(height: 10),
              // const Text("Username", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),

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
    );
  }

  Widget uiMobile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Expanded(
              child: Divider(
                color: Colors.white,
                indent: 20,
                endIndent: 10,
                thickness: 1,
              ),
            ),
            CustomTitle(text: 'Signup'),
            Expanded(
              child: Divider(
                color: Colors.white,
                indent: 10,
                endIndent: 20,
                thickness: 1,
              ),
            ),
          ],
        ),
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
              CustomTextFormField(textController: controller.registerEmailController, label: "Email"),
              const Text("Nome", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormField(textController: controller.registerNameController, label: "Nome"),
              const SizedBox(height: 10),
              const Text("Password", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
              const SizedBox(height: 5),
              CustomTextFormField(textController: controller.registerPasswordController, label: "Password"),
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
    );
  }
}
