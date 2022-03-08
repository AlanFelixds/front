import 'package:flutter/material.dart';
import 'package:front_flutter/pages/home/home_controller.dart';
import 'package:front_flutter/utils/routes/navigator_content.dart';
import 'package:front_flutter/utils/widgets/drawer_menu.dart';
import 'package:get/get.dart';

class HomePage extends GetResponsiveView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(builder: (context, delegate, currentRoute) {
      return Scaffold(
        body: Row(
          children: [
            DrawerMenu(),
            const Flexible(
              child: Center(child: NavigatorContent()),
            ),
          ],
        ),
      );
    });
  }
}
