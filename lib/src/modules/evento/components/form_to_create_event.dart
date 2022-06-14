import 'package:flutter/material.dart';
import 'package:front_flutter/src/core/utils/constantes/template_const.dart';
import 'package:front_flutter/src/core/widgets/customs/button/custom_button.dart';
import 'package:front_flutter/src/core/widgets/customs/text-form-field/custom_text_form_field.dart';
import 'package:front_flutter/src/modules/evento/components/card_template.dart';
import 'package:front_flutter/src/modules/evento/evento_controller.dart';
import 'package:get/get.dart';

class FormToCreateEvent extends StatelessWidget {
  final EventoController controller;

  const FormToCreateEvent({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CustomTextFormField(textController: controller.nomeEventoController, hint: "Nome"),
                    CustomTextFormField(textController: controller.dataEventoController, hint: "Data"),
                    CustomTextFormField(textController: controller.cargaHorariaEventoController, hint: "Carga horária"),
                    CustomTextFormField(textController: controller.tipoEventoController, hint: "Tipo"),
                    CustomTextFormField(textController: controller.palestranteEventoController, hint: "Palestrante"),
                  ],
                ),
                Column(
                  children: [
                    Obx(
                      () {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey[300],
                          ),
                          width: 300,
                          height: 280,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: SizedBox(
                                  width: 250,
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(controller.template.value, width: 150, height: 150, fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: SizedBox(
                                          width: 700,
                                          height: 400,
                                          child: SizedBox(
                                            width: 700,
                                            height: 400,
                                            child: GridView.builder(
                                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 20, crossAxisSpacing: 20),
                                              itemCount: TemplateConst.templates.length,
                                              itemBuilder: (BuildContext context, int index) {
                                                return Obx(
                                                  () {
                                                    return CardTemplate(
                                                      caminhoIMG: TemplateConst.templates[index],
                                                      value: TemplateConst.templates[index],
                                                      groupValue: controller.chekedBt.value,
                                                      onChanged: (value) {
                                                        controller.template.value = value!;
                                                        controller.chekedBt.value = value;
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                onHover: (value) {
                                  controller.blTemplateSelection.value = value;
                                },
                                child: Obx(
                                  () {
                                    return Text(
                                      "Selecione um template",
                                      style: TextStyle(decoration: controller.blTemplateSelection.value == true ? TextDecoration.underline : TextDecoration.none),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onPressed: () async {
                      await controller.createEvent();
                      // await controller.listEvent();
                    },
                    height: 40,
                    width: 300,
                    text: "Cadastrar Evento",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
