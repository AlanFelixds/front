import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:front_flutter/src/core/widgets/customs/drawer/custom_drawer.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      drawer: MediaQuery.of(context).size.width < 900 ? const CustomDrawer() : null,
      body: Row(
        children: [
          MediaQuery.of(context).size.width >= 900 ? const CustomDrawer() : const SizedBox(),
          const Expanded(
            child: RouterOutlet(),
          )
        ],
      ),
    );
  }
}
