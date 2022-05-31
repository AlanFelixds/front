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
        width: 700,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          width: 300,
          height: 110,
          child: Column(
            children: [
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextFormField(textController: controller, hint: 'Nome do Participante'),
                  const SizedBox(width: 8),
                  CustomTextFormField(textController: controller, hint: 'Email do Participante'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomButton(onPressed: onPressed, text: 'Add participante', height: 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
