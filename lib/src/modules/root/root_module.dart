import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/src/modules/dashboard/dashboard_controller.dart';
import 'package:front_flutter/src/modules/dashboard/dashboard_page.dart';
import 'package:front_flutter/src/modules/root/root_page.dart';
import 'package:front_flutter/src/modules/solicitacao/solicitacao_controller.dart';
import 'package:front_flutter/src/modules/solicitacao/solicitacao_page.dart';
import 'package:front_flutter/src/modules/solicitacao/solicitacao_repository.dart';
import 'package:front_flutter/src/modules/solicitacoes/solicitacoes_controller.dart';
import 'package:front_flutter/src/modules/solicitacoes/solicitacoes_page.dart';

class RootModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        //HOME
        Bind.singleton((i) => SolicitacaoController(i())),
        Bind.singleton((i) => SolicitacaoRepository(i())),

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
            ChildRoute('/solicitar_certificado/', child: (context, args) => const SolicitacaoPage()),
            ChildRoute('/solicitacoes/', child: (context, args) => const SolicitacoesPage()),
          ],
        ),
      ];
}
