import 'package:front_flutter/pages/event_detail/event_detail_binding.dart';
import 'package:front_flutter/pages/event_detail/event_detail_page.dart';
import 'package:front_flutter/pages/home/home_binding.dart';
import 'package:front_flutter/pages/home/home_page.dart';
import 'package:front_flutter/pages/lista_solicitacoes/lista_solicitacoes_binding.dart';
import 'package:front_flutter/pages/lista_solicitacoes/lista_solicitacoes_page.dart';
import 'package:front_flutter/pages/login/login_binding.dart';
import 'package:front_flutter/pages/login/login_page.dart';
import 'package:front_flutter/pages/signup/signup_binding.dart';
import 'package:front_flutter/pages/signup/signup_page.dart';
import 'package:front_flutter/pages/solicitar_certificado/solicitar_certificado_binding.dart';
import 'package:front_flutter/pages/solicitar_certificado/solicitar_certificado_page.dart';
import 'package:front_flutter/pages/unknown/unknown_page.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(name: "/login", page: () => LoginPage(), binding: LoginBinding(), preventDuplicates: true, participatesInRootNavigator: true),
    GetPage(name: "/signup", page: () => SignupPage(), binding: SignupBinding(), preventDuplicates: true, participatesInRootNavigator: true),
    GetPage(name: "/home", page: () => HomePage(), binding: HomeBinding(), preventDuplicates: true, participatesInRootNavigator: true),
    GetPage(name: "/solicitar_certificado", page: () => SolicitarCertificadoPage(), binding: SolicitarCertificadoBinding(), preventDuplicates: true, participatesInRootNavigator: true),
    GetPage(name: "/listaSolicitacoes", page: () => ListaSolicitacoesPage(), binding: ListaSolicitacoesBinding(), preventDuplicates: true, participatesInRootNavigator: true),
    GetPage(name: "/event-detail", page: () => EventDetailPage(), binding: EventDetailBinding(), preventDuplicates: true, participatesInRootNavigator: true),
    GetPage(name: "/unknown", page: () => const UnknownPage()),
  ];
}
