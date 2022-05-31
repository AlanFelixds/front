import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:front_flutter/src/core/themes/color_pallete.dart';
import 'package:front_flutter/src/modules/solicitacao/components/card_to_list_events.dart';
import 'package:front_flutter/src/modules/solicitacao/components/dialog_to_add_participant.dart';
import 'package:front_flutter/src/modules/solicitacao/components/form_to_create_event.dart';
import 'package:front_flutter/src/modules/solicitacao/solicitacao_controller.dart';
import 'package:get/get.dart';

class SolicitacaoPage extends StatefulWidget {
  const SolicitacaoPage({Key? key}) : super(key: key);

  @override
  State<SolicitacaoPage> createState() => _SolicitacaoPageState();
}

class _SolicitacaoPageState extends State<SolicitacaoPage> {
  final controller = Modular.get<SolicitacaoController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.listEvent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.appBackground,
      body: uiDesktop(),
    );
  }

  Widget uiDesktop() {
    return Center(
      child: Container(
        width: 700,
        height: 570,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.grey, offset: Offset(4, 6), blurRadius: 3, spreadRadius: 3)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Criar evento", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            FormToCreateEvent(controller: controller),
            const Divider(),
            const Text("Lista de eventos", style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            const SizedBox(height: 8),
            Obx(() {
              return SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.events.length,
                      itemBuilder: (context, index) {
                        return CardToListEvents(
                          text: "${controller.events[index].eventName}",
                          addParticipant: () async {
                            await controller.listParticipants(eventID: controller.events[index].id!);
                            await showDialog(
                              context: context,
                              builder: (context) {
                                return DialogToAddParticipante(controller: controller, indexEvent: index);
                              },
                            );
                          },
                          delEvent: () {},
                        );
                      },
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
