import 'package:front_flutter/app/core/database/interface_web_client.dart';
import 'package:front_flutter/app/core/models/product_model.dart';

class SolicitarCertificadoRepository {
  final IWebClient _webService;
  SolicitarCertificadoRepository(this._webService);

  Future<dynamic> createDelivery(ProductModel itemName) async {
    Map body = itemName.toMap();
    final response = await _webService.post(url: '/delivery', body: body);
    return response;
  }

  Future<dynamic> buscarDeliveries() async {
    final response = await _webService.get(url: '/client/deliveries');
    return response;
  }
}
