import 'package:flutter/material.dart';
import 'package:front_flutter/pages/solicitar_certificado/solicitar_certificado_controller.dart';
import 'package:front_flutter/utils/customs/custom_text_form_field.dart';
import 'package:get/get.dart';

class SolicitarCertificadoPage extends GetResponsiveView<SolicitarCertificadoController> {
  SolicitarCertificadoPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Row(
          children: [
            Container(
              width: 300,
              height: Get.height,
              color: Colors.green,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 700,
                    height: 300,
                    child: Card(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Dados do evento", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 25,
                              children: [
                                CustomTextFormField(controller: controller.eventNameController, hint: 'Evento', icon: const Icon(Icons.event), label: "Evento", width: 300, height: 40),
                                CustomTextFormField(controller: controller.eventDateController, hint: 'Data', icon: const Icon(Icons.calendar_today), label: "Data", width: 300, height: 40),
                                CustomTextFormField(controller: controller.eventTeacherNameController, hint: 'Professor', icon: const Icon(Icons.takeout_dining_sharp), label: "Professor", width: 300, height: 40),
                                CustomTextFormField(controller: controller.eventTeacherEmailController, hint: 'Email', icon: const Icon(Icons.email), label: "Email", width: 300, height: 40),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () => controller.addEvent(),
                              child: const Text("Cadastrar evento"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 700,
                    height: 300,
                    child: Obx(
                      () {
                        return Card(
                          child: ListView.separated(
                            separatorBuilder: (context, index) => const Divider(height: 2, indent: 2, endIndent: 2),
                            shrinkWrap: true,
                            itemCount: controller.events.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text("${controller.events[index].eventName}"),
                                subtitle: Text("${controller.events[index].eventDate}"),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () async {
                                        await dialogToAddParticipants();
                                      },
                                      icon: const Icon(Icons.add_reaction_outlined),
                                      splashRadius: 20,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        controller.events.remove(controller.events[index]);
                                      },
                                      icon: const Icon(Icons.delete_forever),
                                      splashRadius: 20,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Obx(() {
                    return SizedBox(
                      width: 700,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          controller.participants.isNotEmpty
                              ? ElevatedButton(
                                  onPressed: () {
                                    controller.addEvent();
                                    controller.goToListaSolicitacoes();
                                  },
                                  child: const Text("Cadastrar evento"),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> dialogToAddParticipants() async {
    await Get.dialog(Dialog(
      backgroundColor: Colors.white,
      child: Container(
        width: screen.isDesktop ? 700 : 100,
        padding: screen.isDesktop ? const EdgeInsets.symmetric(horizontal: 12) : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 35,
              children: [
                CustomTextFormField(controller: controller.participantNameController, hint: 'Nome', icon: const Icon(Icons.takeout_dining_sharp), label: "Nome", width: 300, height: 40),
                CustomTextFormField(controller: controller.participantEmailController, hint: 'Email', icon: const Icon(Icons.takeout_dining_sharp), label: "Email", width: 300, height: 40),
                ElevatedButton(
                  onPressed: () => controller.addParticipante(),
                  child: const Text("Cadastrar"),
                ),
              ],
            ),
            SizedBox(
              width: 700,
              height: 300,
              child: Obx(
                () {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(height: 2, indent: 2, endIndent: 2),
                    shrinkWrap: true,
                    itemCount: controller.participants.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${controller.participants[index].name}"),
                        subtitle: Text("${controller.participants[index].email}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.events.remove(controller.participants[index]);
                              },
                              icon: const Icon(Icons.delete_forever),
                              splashRadius: 20,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              width: 700,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.addParticipante(),
                    child: const Text("Concluir cadastro"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
