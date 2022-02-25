import 'package:flutter/material.dart';
import 'package:front_flutter/utils/controller/routeController.dart';
import 'package:front_flutter/utils/customs/custom_button_drawer.dart';
import 'package:front_flutter/utils/themes/color_palette.dart';
import 'package:get/get.dart';

class CustomMenu2 extends GetView<RouteController> {
  const CustomMenu2({Key? key, this.routeCall}) : super(key: key);

  final VoidCallback? routeCall;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<RouteController>(() => RouteController());
    return SizedBox(
      height: Get.height,
      child: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: 300,
                  height: Get.height,
                  color: ThemeColors.appDrawer,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 220,
                        height: 220,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset('assets/images/logo_drawer.png'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomButtonDrawer(label: 'Home', icon: const Icon(Icons.home), onPressed: () => controller.goToHome()),
                      CustomButtonDrawer(label: 'Solicitações', icon: const Icon(Icons.description), onPressed: () => controller.goToSolicitarCertificado()),
                      CustomButtonDrawer(label: 'Logout', icon: const Icon(Icons.logout), onPressed: () => controller.goToLogout()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonDrawer(String label) {
    return MaterialButton(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      minWidth: 200,
      // padding: const EdgeInsets.symmetric(vertical: 25),
      color: ThemeColors.appBackground,
      hoverColor: ThemeColors.appDrawer.withOpacity(0.4),
      splashColor: Colors.red,
      onPressed: () {},
      child: Row(
        children: [
          const Icon(Icons.home),
          Text(label),
        ],
      ),
    );
  }

  Widget buttonDrawer2(String label) {
    return SizedBox(
      width: 200,
      height: 30,
      child: Material(
        borderRadius: BorderRadius.circular(5),
        elevation: 3,
        color: ThemeColors.appBackground,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          splashColor: Colors.red,
          hoverColor: ThemeColors.appDrawer.withOpacity(0.4),
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 5),
              const Icon(Icons.home),
              const SizedBox(width: 10),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
