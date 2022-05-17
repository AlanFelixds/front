import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/core/database/interface_web_client.dart';
import 'package:front_flutter/app/core/storage/local.dart';
import 'package:front_flutter/app/modules/home/home_module.dart';
import 'package:front_flutter/app/modules/login/login_controller.dart';
import 'package:front_flutter/app/modules/login/login_page.dart';
import 'package:front_flutter/app/modules/login/login_repository.dart';
import 'package:front_flutter/app/modules/signup/signup_page.dart';
import 'package:front_flutter/app/modules/unknown/unknown_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/database/web_client_dio.dart';

class MainModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //GLOBAL
        AsyncBind((i) => SharedPreferences.getInstance()),
        Bind.singleton((i) => Local()),

        //CLIENTE HTTP
        Bind.factory((i) => Dio()),
        Bind.factory<IWebClient>((i) => WebClientDio(i())),

        //LOGIN
        Bind.singleton((i) => LoginRepository(i())),
        Bind.singleton((i) => LoginController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/login', child: (context, args) => const LoginPage(), transition: TransitionType.noTransition),
        ChildRoute('/signup', child: (context, args) => SignupPage(), transition: TransitionType.noTransition),
        ModuleRoute('/home', module: HomeModule(), transition: TransitionType.noTransition),
        WildcardRoute(child: (contex, args) => const UnknownPage(), transition: TransitionType.noTransition),
      ];
}
