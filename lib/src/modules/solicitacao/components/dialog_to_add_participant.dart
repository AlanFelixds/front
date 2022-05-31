import 'package:flutter/material.dart';
import 'package:front_flutter/src/core/widgets/customs/button/custom_button.dart';
import 'package:front_flutter/src/core/widgets/customs/text-form-field/custom_text_form_field.dart';
import 'package:front_flutter/src/modules/solicitacao/components/card_to_list_participants.dart';
import 'package:front_flutter/src/modules/solicitacao/solicitacao_controller.dart';
import 'package:get/get.dart';

class DialogToAddParticipante extends StatelessWidget {
  final SolicitacaoController controller;
  final int indexEvent;

  const DialogToAddParticipante({
    Key? key,
    required this.controller,
    required this.indexEvent,
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
              Form(
                // key: controller.formParticipantKey,
                child: Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextFormField(textController: controller.nomeParticipanteController, hint: 'Nome do Participante'),
                        const SizedBox(width: 8),
                        CustomTextFormField(textController: controller.emailParticipantController, hint: 'Email do Participante'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: CustomButton(
                            onPressed: () async {
                              await controller.addParticipant(eventID: controller.events[indexEvent].id!);
                            },
                            text: 'Add participante',
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Obx(() {
                return SizedBox(
                  width: 290,
                  height: 100,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      itemCount: controller.participants.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CardToListParticipants(
                          text: "${controller.participants[index].name}",
                          addParticipant: () {},
                          delParticipant: () {},
                        );
                      },
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
