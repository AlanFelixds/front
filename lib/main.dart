import 'package:flutter/material.dart';
import 'package:front_flutter/utils/routes/routes.dart';
import 'package:get/get.dart';

// void main() {
//   runApp(
//     GetMaterialApp(
//       getPages: Routes.pages,
//       initialRoute: Routes.login,
//       unknownRoute: Routes.pages[3],
//       enableLog: true,
//     ),
//   );
// }

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      enableLog: true,
      getPages: Routes.pages,
      unknownRoute: Routes.pages[3],
      routeInformationParser: GetInformationParser(initialRoute: Routes.login),
      routerDelegate: GetDelegate(),
    );
  }
}
