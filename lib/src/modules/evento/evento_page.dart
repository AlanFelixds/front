import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:front_flutter/src/core/themes/color_pallete.dart';
import 'package:front_flutter/src/core/utils/scroll/touch_scroll.dart';
import 'package:front_flutter/src/core/widgets/customs/title/custom_title.dart';
import 'package:front_flutter/src/modules/evento/components/card_to_list_events.dart';
import 'package:front_flutter/src/modules/evento/components/dialog_to_add_participant.dart';
import 'package:front_flutter/src/modules/evento/components/form_to_create_event.dart';
import 'package:front_flutter/src/modules/evento/evento_controller.dart';
import 'package:get/get.dart';

class EventoPage extends StatefulWidget {
  const EventoPage({Key? key}) : super(key: key);

  @override
  State<EventoPage> createState() => _EventoPageState();
}

class _EventoPageState extends State<EventoPage> {
  final controller = Modular.get<EventoController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.listaEvent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.appBackground,
      body: Center(
        child: Container(
          width: 700,
          height: 570,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: const [BoxShadow(color: Colors.grey, offset: Offset(4, 6), blurRadius: 3, spreadRadius: 3)],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTitle(text: "Criar evento", color: Colors.black, paddingVertical: 12),
                Divider(color: Colors.grey[800]),
                FormToCreateEvent(controller: controller),
                Divider(color: Colors.grey[800]),
                const CustomTitle(text: "Lista de eventos", color: Colors.black, paddingVertical: 12),
                Obx(() {
                  return Center(
                    child: Container(
                      height: 350,
                      width: 700,
                      child: Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.events.length,
                          itemBuilder: (context, index) {
                            return CardToListEvents(
                              text: "${controller.events[index].nome}",
                              addParticipant: () async {
                                await controller.listaParticipantes(eventID: controller.events[index].id!);
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
        ),
      ),
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
                          text: "${controller.events[index].nome}",
                          addParticipant: () async {
                            await controller.listaParticipantes(eventID: controller.events[index].id!);
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
