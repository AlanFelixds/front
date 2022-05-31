import 'package:flutter/material.dart';
import 'package:front_flutter/src/core/widgets/customs/button/custom_button.dart';
import 'package:front_flutter/src/core/widgets/customs/text-form-field/custom_text_form_field.dart';
import 'package:front_flutter/src/modules/solicitacao/solicitacao_controller.dart';

class FormToCreateEvent extends StatelessWidget {
  final SolicitacaoController controller;

  const FormToCreateEvent({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Center(
        child: Form(
          child: Wrap(
            spacing: 5,
            children: [
              CustomTextFormField(textController: controller.eventNameController, hint: "Event name"),
              CustomTextFormField(textController: controller.eventDateController, hint: "Event date"),
              CustomButton(
                onPressed: () async {
                  await controller.createEvent();
                  await controller.listEvent();
                },
                height: 35,
                width: 300,
                text: "Cadastrar Evento",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
