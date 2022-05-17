import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/main_module.dart';
import 'package:front_flutter/app/main_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Modular.setInitialRoute('/login');
  runApp(
    ModularApp(
      child: const MainWidget(),
      module: MainModule(),
    ),
  );
}
