import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    return super.redirectDelegate(route);
  }
}
