import 'package:flutter/material.dart';
import 'package:front_flutter/utils/routes/const_named_routes.dart';
import 'package:front_flutter/utils/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  // runApp(
  //   GetMaterialApp(
  //     initialRoute: NamedRoutes.LOGIN,

  //     getPages: Routes.pages,
  //     unknownRoute: Routes.pages[3],
  //   ),
  // );

  runApp(GetMaterialApp(
    initialRoute: NamedRoutes.LOGIN,
    getPages: Routes.pages,
    unknownRoute: Routes.pages[3],
    enableLog: true,

    // routerDelegate: RouterDelegate().popRoute(),
    // routeInformationParser: RouteInformationParser(),

    // onGenerateRoute: (settings) {

    //   print(settings.name);
    //   if (settings.name == '/login') {
    //     return MaterialPageRoute(builder: (context) => LoginPage());
    //   }
    //   if (settings.name == '/signup') {
    //     return MaterialPageRoute(builder: (context) => SignupPage());
    //   }

    //   return MaterialPageRoute(builder: (context) => const UnknownPage());
    // },
    // backButtonDispatcher: RootBackButtonDispatcher(),
  ));
}
