import 'package:flutter/material.dart';
import 'package:front_flutter/utils/controller/router_controller.dart';
import 'package:get/get.dart';

class DrawerMenu extends GetResponsiveView<RouterController> {
  DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: Get.height,
      child: Column(
        children: [
          SizedBox(
            width: 220,
            height: 220,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset('assets/images/logo_drawer.png'),
            ),
          ),
          const SizedBox(height: 20),
          GetRouterOutlet.builder(
            builder: (context, delegate, currentRoute) {
              // debugPrint("${currentRoute!.location!.startsWith(drw.label.page)}");
              return ElevatedButton(onPressed: () => controller.indexRoute(0), child: const Text("Home"));
            },
          ),
          const SizedBox(height: 20),
          GetRouterOutlet.builder(
            builder: (context, delegate, currentRoute) {
              // debugPrint("${currentRoute!.location!.startsWith(drw.label.page)}");
              return ElevatedButton(onPressed: () => controller.indexRoute(1), child: const Text("Solicitar certificado"));
            },
          ),
          const SizedBox(height: 20),
          GetRouterOutlet.builder(
            builder: (context, delegate, currentRoute) {
              // debugPrint("${currentRoute!.location!.startsWith(drw.label.page)}");
              return ElevatedButton(onPressed: () => controller.indexRoute(2), child: const Text("Lista de Solicitações"));
            },
          ),
          const SizedBox(height: 20),
          GetRouterOutlet.builder(
            builder: (context, delegate, currentRoute) {
              // debugPrint("${currentRoute!.location!.startsWith(drw.label.page)}");
              return ElevatedButton(onPressed: () => controller.indexRoute(3), child: const Text("Perfil"));
            },
          ),
          const SizedBox(height: 20),
          GetRouterOutlet.builder(
            builder: (context, delegate, currentRoute) {
              // debugPrint("${currentRoute!.location!.startsWith(drw.label.page)}");
              return ElevatedButton(onPressed: () => controller.indexRoute(4), child: const Text("Sair"));
            },
          ),
        ],
      ),
    );
  }
}
