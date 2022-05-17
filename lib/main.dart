import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/src/app_module.dart';
import 'package:front_flutter/src/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Modular.setInitialRoute('/login');

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
