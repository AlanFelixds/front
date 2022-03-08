import 'package:front_flutter/models/user_model.dart';
import 'package:front_flutter/pages/home/home_repository.dart';
import 'package:front_flutter/utils/routes/routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository;
  HomeController(this.homeRepository);

  final arguments = Get.arguments;

  UserModel user = Get.arguments;
}
