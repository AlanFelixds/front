import 'package:flutter/material.dart';
import 'package:front_flutter/utils/routes/const_named_routes.dart';
import 'package:front_flutter/utils/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: NamedRoutes.LOGIN,
    getPages: Routes.pages,
    unknownRoute: Routes.pages[3],
    enableLog: true,
  ));
}
