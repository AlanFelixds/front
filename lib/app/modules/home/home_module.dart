import 'package:flutter_modular/flutter_modular.dart';
import 'package:front_flutter/app/modules/dashboard/dashboard_page.dart';
import 'package:front_flutter/app/modules/home/home_page.dart';
import 'package:front_flutter/app/modules/solicitar_certificado/solicitar_certificado_controller.dart';
import 'package:front_flutter/app/modules/solicitar_certificado/solicitar_certificado_page.dart';
import 'package:front_flutter/app/modules/solicitar_certificado/solicitar_certificado_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => SolicitarCertificadoRepository(i())),
        Bind.singleton((i) => SolicitarCertificadoController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage(), children: [
          ChildRoute('/dashboard/', child: (context, args) => const DashboardPage()),
          ChildRoute('/solicitar_certificado/', child: (context, args) => const SolicitarCertificadoPage()),
        ])
      ];
}
