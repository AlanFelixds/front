import 'package:flutter/material.dart';
import 'package:front_flutter/pages/signup/signup_controller.dart';
import 'package:get/get.dart';

class SignupPage extends GetResponsiveView<SignupController> {
  SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              color: const Color.fromARGB(255, 50, 190, 29),
              child: Image.network(
                'https://cdni.iconscout.com/illustration/premium/thumb/male-and-female-employee-doing-online-marketing-2985914-2490959.png',
                color: Colors.white.withOpacity(0.2),
                colorBlendMode: BlendMode.modulate,
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Container(
                width: Get.width * .8,
                height: Get.height * .8,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://cdni.iconscout.com/illustration/premium/thumb/male-and-female-employee-doing-online-marketing-2985914-2490959.png',
                    ),
                    Container(
                      width: 310,
                      height: 410,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomTextFormField(controller: controller.nameController, label: 'Nome', icon: const Icon(Icons.account_circle_rounded), context: context),
                          CustomTextFormField(controller: controller.emailController, label: 'Email', icon: const Icon(Icons.alternate_email_rounded), context: context),
                          CustomTextFormField(controller: controller.passwordController, label: 'Password', icon: const Icon(Icons.lock_outline), context: context),
                          CustomElevatedButton(onPressed: () => controller.createUser(), label: 'Sing in'),
                        ],
                      ),
                    ),
                  ],
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
