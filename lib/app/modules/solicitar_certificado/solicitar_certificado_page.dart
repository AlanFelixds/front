import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:front_flutter/app/core/widgets/customs/button/custom_button.dart';
import 'package:front_flutter/app/core/widgets/customs/button/custom_icon_buttom.dart';
import 'package:front_flutter/app/core/widgets/customs/dialogs_form/dialog_add_participante.dart';
import 'package:front_flutter/app/core/widgets/customs/text-form-field/custom_text_form_field.dart';
import 'package:front_flutter/app/modules/solicitar_certificado/solicitar_certificado_controller.dart';
import 'package:get/get.dart';

class SolicitarCertificadoPage extends StatefulWidget {
  const SolicitarCertificadoPage({Key? key}) : super(key: key);

  @override
  State<SolicitarCertificadoPage> createState() => _SolicitarCertificadoPageState();
}

class _SolicitarCertificadoPageState extends State<SolicitarCertificadoPage> {
  final controller = Modular.get<SolicitarCertificadoController>();
  RxString nome = "".obs;

  @override
  void initState() {
    super.initState();
    debugPrint("teste");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.buscarDeliveries();
    });
    // Future.delayed(const Duration(seconds: 3)).then((value) {});
    // controller.buscarDeliveries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF636Ec5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .65,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 400,
                      height: 200,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5),
                          CustomTextFormField(
                            textController: controller.itemNameController,
                            label: "Event name",
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              CustomButton(
                                onPressed: () async {
                                  await controller.createDelivery();
                                  await controller.buscarDeliveries();
                                },
                                height: 30,
                                width: 30,
                                text: "New Delivery",
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 300,
                      height: 200,
                      color: Colors.white,
                      child: Obx(() {
                        return ListView.builder(
                          itemCount: controller.deliveries.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              hoverColor: Colors.grey,
                              title: Text(
                                "${controller.deliveries[index]['item_name']}".capitalizeFirst ?? "",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomIconButtom(
                                    icon: const Icon(Icons.person_add_alt_rounded),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return DialogAddParticipante(controller: controller.nomeParticipanteController);
                                        },
                                      );
                                    },
                                  ),
                                  CustomIconButtom(
                                    icon: const Icon(Icons.delete_forever_rounded),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
