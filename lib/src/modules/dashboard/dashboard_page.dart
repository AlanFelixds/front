import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/src/modules/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardPage extends GetResponsiveView<DashboardController> {
  DashboardPage({Key? key}) : super(key: key);

  @override
  Widget builder() {
    final controller = Modular.get<DashboardController>();

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: 700,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                // child: Text("Nome:"),
                child: Text(
                  "Bem vindo, Admin",
                  // "Bem vindo, ${controller.argumentos.name!.capitalizeFirst}",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
