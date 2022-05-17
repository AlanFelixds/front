import 'package:flutter/material.dart';
import 'package:front_flutter/src/core/widgets/customs/button/custom_button.dart';
import 'package:front_flutter/src/core/widgets/customs/text-form-field/custom_text_form_field.dart';

class DialogAddParticipante extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;

  const DialogAddParticipante({
    Key? key,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey,
      elevation: 3,
      child: Container(
        width: 400,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              width: 300,
              height: 200,
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  CustomTextFormField(textController: controller, label: 'Nome do Participante'),
                  const SizedBox(height: 8),
                  CustomTextFormField(textController: controller, label: 'Email do Participante'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CustomButton(onPressed: onPressed, text: 'Add participante', height: 30),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
