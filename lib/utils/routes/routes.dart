import 'package:front_flutter/pages/event_detail/event_detail_binding.dart';
import 'package:front_flutter/pages/event_detail/event_detail_page.dart';
import 'package:front_flutter/pages/home/home_binding.dart';
import 'package:front_flutter/pages/home/home_page.dart';
import 'package:front_flutter/pages/lista_solicitacoes/lista_solicitacoes_binding.dart';
import 'package:front_flutter/pages/lista_solicitacoes/lista_solicitacoes_page.dart';
import 'package:front_flutter/pages/login/login_binding.dart';
import 'package:front_flutter/pages/login/login_page.dart';
import 'package:front_flutter/pages/perfil/perfil_page.dart';
import 'package:front_flutter/pages/signup/signup_binding.dart';
import 'package:front_flutter/pages/signup/signup_page.dart';
import 'package:front_flutter/pages/solicitar_certificado/solicitar_certificado_binding.dart';
import 'package:front_flutter/pages/solicitar_certificado/solicitar_certificado_page.dart';
import 'package:front_flutter/pages/unknown/unknown_page.dart';
import 'package:front_flutter/utils/customs/custom_menu2.dart';
import 'package:get/get.dart';

class Routes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String requestCertification = '/request_certification';
  static const String requestList = '/request_list';
  static const String eventDetail = '/event_detail';
  static const String perfil = '/perfil';
  static const String unknown = '/unknown';
  static const String customMenu = '/customMenu';

  static List<GetPage> pages = [
    GetPage(name: login, page: () => LoginPage(), binding: LoginBinding(), preventDuplicates: true, participatesInRootNavigator: true),
    GetPage(name: signup, page: () => SignupPage(), binding: SignupBinding(), preventDuplicates: true, participatesInRootNavigator: true),
    GetPage(
      name: home,
      page: () => HomePage(),
      binding: HomeBinding(),
      preventDuplicates: true,
      transition: Transition.noTransition,
      participatesInRootNavigator: true,
      children: [
        GetPage(name: requestCertification, page: () => SolicitarCertificadoPage(), binding: SolicitarCertificadoBinding(), preventDuplicates: true, participatesInRootNavigator: true),
        GetPage(
          name: requestList,
          page: () => ListaSolicitacoesPage(),
          binding: ListaSolicitacoesBinding(),
          preventDuplicates: true,
          participatesInRootNavigator: true,
          children: [
            GetPage(name: eventDetail, page: () => EventDetailPage(), binding: EventDetailBinding(), preventDuplicates: true, participatesInRootNavigator: true),
          ],
        ),
        GetPage(name: perfil, page: () => const PerfilPage(), preventDuplicates: true, participatesInRootNavigator: true),
      ],
    ),
    GetPage(transition: Transition.noTransition, name: unknown, page: () => const UnknownPage()),
    GetPage(name: "/customMenu", page: () => const CustomMenu2()),
  ];
}
