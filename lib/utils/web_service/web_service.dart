import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WebService extends GetConnect {
  dynamic clientHttp() {
    httpClient.baseUrl = "http://localhost:5555";
    httpClient.defaultContentType = 'application/json';
    httpClient.timeout = const Duration(seconds: 120);

    // httpClient.addAuthenticator((dynamic request) async {
    //   Map<String, String> headers = {'Authorization': "Bearer $token"};
    //   await request.headers.addAll(headers);
    //   return request;
    // });
  }

  Future<dynamic> postResponse(String url, Map body) async {
    try {
      await clientHttp();
      Response response = await post(url, body);
      return manageResponse(response);
    } catch (e) {
      debugPrint('$e');
      rethrow;
    }
  }

  Future<dynamic> getResponse(String url) async {
    try {
      Response response = await get(url);
      return manageResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  dynamic manageResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw 'Bad request';
      case 401:
        throw 'Não autorizado';
      case 403:
        throw 'Não autorizado';
      case 500:
        throw 'Falha no servidor';
      default:
        throw 'Não feito';
    }
  }
}
