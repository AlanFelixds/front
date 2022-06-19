import 'package:front_flutter/src/core/database/interface_web_client.dart';

class SolicitacoesRepository {
  final IWebClient _webService;
  SolicitacoesRepository(this._webService);

  Future<dynamic> listEvent() async {
    final response = await _webService.get(url: '/evento');
    return response;
  }
}
