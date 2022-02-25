import 'package:flutter/material.dart';
import 'package:front_flutter/pages/home/home_controller.dart';
import 'package:front_flutter/utils/customs/custom_menu2.dart';
import 'package:front_flutter/utils/themes/color_palette.dart';
import 'package:get/get.dart';

class HomePage extends GetResponsiveView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const CustomMenu2(),
      body: Row(
        children: [
          CustomMenu2(
            routeCall: () => controller.goToSolicitar(),
          ),
          Expanded(
            child: Container(
              color: ThemeColors.appBackground,
              child: Text("${controller.user.user}"),
            ),
          ),
        ],
      ),
    );
  }
}
