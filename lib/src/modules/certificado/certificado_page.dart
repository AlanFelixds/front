import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './certificado_controller.dart';

class CertificadoPage extends GetView<CertificadoController> {
    
    const CertificadoPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('CertificadoPage'),),
            body: Container(),
        );
    }
}