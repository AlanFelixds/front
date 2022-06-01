import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/src/core/widgets/customs/button/custom_elevated_button.dart';
import 'package:front_flutter/src/core/widgets/customs/text-form-field/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import './validar_certificado_controller.dart';

class ValidarCertificadoPage extends StatelessWidget {
  ValidarCertificadoPage({Key? key}) : super(key: key);

  final controller = Modular.get<ValidarCertificadoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('validação de certificado'),
      ),
      body: uiDesktop(),
    );
  }

  Widget uiDesktop() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Container(
            width: 300,
            height: 350,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(icon: const Icon(Icons.picture_as_pdf_rounded), textController: controller.codigoController, hint: 'Código de validação'),
                const SizedBox(height: 20),
              ],
            ),
          ),
          CustomElevatedButton(label: 'Validar', onPressed: () {})
        ],
      ),
    );
  }
}
