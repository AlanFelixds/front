import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final GlobalKey<FormState> formDash = GlobalKey<FormState>();
  final TextEditingController eventNameController = TextEditingController();

  // final UserModel argumentos = Modular.args.data;

  DashboardController();
}
