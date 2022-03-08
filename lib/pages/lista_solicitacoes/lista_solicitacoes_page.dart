import 'package:flutter/material.dart';
import 'package:front_flutter/pages/solicitar_certificado/solicitar_certificado_controller.dart';
import 'package:get/get.dart';

class ListaSolicitacoesPage extends GetResponsiveView<SolicitarCertificadoController> {
  ListaSolicitacoesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Row(
          children: [
            // Container(
            //   width: 300,
            //   height: Get.height,
            //   color: Colors.green,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Get.toNamed('/solicitar_certificado');
            //     },
            //     child: const Text("data"),
            //   ),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Card(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Solicitações", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Obx(
                            () {
                              return ListView.separated(
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
                                          onPressed: () {
                                            controller.goToEventDetail();
                                          },
                                          icon: const Icon(Icons.edit),
                                          splashRadius: 20,
                                        ),
                                        IconButton(
                                          onPressed: () {},
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
