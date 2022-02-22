import 'package:flutter/material.dart';
import 'package:front_flutter/utils/themes/color_palette.dart';
import 'package:get/get.dart';

class CustomMenu2 extends GetView {
  const CustomMenu2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Row(
        children: [
          Container(
            width: 300,
            height: Get.height,
            color: ThemeColors.appDrawer,
            child: Column(
              children: [
                buttonDrawer2('Home'),
                buttonDrawer2('Solicitações'),
                buttonDrawer2('Sair'),
              ],
            ),
          ),
          const Expanded(
              child: Center(
            child: Text("body"),
          ))
        ],
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
        mainAxisSize: MainAxisSize.min,
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
              const Icon(Icons.home),
              Text(label),
            ],
          ),
        ),
      ),
    );
  }
}
