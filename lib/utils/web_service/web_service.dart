import 'package:get/get.dart';

class WebService extends GetConnect {
  Future<Response> postResponse(String url, Map data) async => await post('http://localhost:5555/$url', data);
  Future<Response> getResponse(String url) async => await get('http://localhost:5555/login');
}
