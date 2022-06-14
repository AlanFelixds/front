import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/src/modules/dashboard/dashboard_controller.dart';
import 'package:front_flutter/src/modules/dashboard/dashboard_page.dart';
import 'package:front_flutter/src/modules/evento/evento_controller.dart';
import 'package:front_flutter/src/modules/evento/evento_page.dart';
import 'package:front_flutter/src/modules/evento/evento_repository.dart';
import 'package:front_flutter/src/modules/root/root_page.dart';
import 'package:front_flutter/src/modules/solicitacoes/solicitacoes_controller.dart';
import 'package:front_flutter/src/modules/solicitacoes/solicitacoes_page.dart';

class RootModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //HOME
        Bind.singleton((i) => EventoController(i())),
        Bind.singleton((i) => EventoRepository(i())),

        //DASHBOARD
        Bind.singleton((i) => DashboardController()),

        //SOLICITAÇÕES
        Bind.singleton((i) => SolicitacoesController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const RootPage(),
          children: [
            ChildRoute('/dashboard/', child: (context, args) => DashboardPage()),
            ChildRoute('/evento/', child: (context, args) => const EventoPage()),
            ChildRoute('/solicitacoes/', child: (context, args) => const SolicitacoesPage()),
          ],
        ),
      ];
}
