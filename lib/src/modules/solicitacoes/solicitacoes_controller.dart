import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:get/get.dart';

class SolicitacoesController extends GetxController {
  void createPDF() async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text("Hello World"),
          ); // Center
        }));

    final file = File("C:\\Users\\Alan\\Documents\\pdf.pdf");
    await file.writeAsBytes(await pdf.save());
  }
}
