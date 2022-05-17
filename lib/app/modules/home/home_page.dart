import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/core/widgets/customs/drawer/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Row(
        children: const [
          CustomDrawer(),
          Expanded(child: RouterOutlet()),
        ],
      ),
    );
  }
}
