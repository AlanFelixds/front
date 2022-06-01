import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/src/core/widgets/customs/button/custom_elevated_button.dart';
import 'package:front_flutter/src/modules/solicitacoes/solicitacoes_controller.dart';

class SolicitacoesPage extends StatefulWidget {
  const SolicitacoesPage({Key? key}) : super(key: key);

  @override
  State<SolicitacoesPage> createState() => _SolicitacoesPageState();
}

class _SolicitacoesPageState extends State<SolicitacoesPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<SolicitacoesController>();

    return Scaffold(
      body: Center(
        child: Container(
          width: 700,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text("Event"),
                      Text("Status"),
                      Text("Data"),
                      Text("Edit/Delete"),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  );
                },
                itemCount: 3,
              ),
              CustomElevatedButton(
                  label: 'Criar PDF',
                  onPressed: () {
                    controller.createPDF();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
