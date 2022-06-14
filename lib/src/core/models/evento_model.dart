import 'dart:convert';

import 'package:front_flutter/src/core/enum/status.dart';

class EventoModel {
  String? id;
  String? nome;
  DateTime? data;
  String? template;
  String? cargaHoraria;
  String? tipo;
  String? palestrante;
  Status? status;

  EventoModel({
    this.id,
    this.nome,
    this.data,
    this.template,
    this.cargaHoraria,
    this.tipo,
    this.palestrante,
    this.status,
  });

  factory EventoModel.fromMap(Map<String, dynamic> json) {
    return EventoModel(
      id: json['id'],
      nome: json['nome'],
      data: json['data'] != null ? DateTime.tryParse(json['data']) : null,
      template: json['template'],
      cargaHoraria: json['carga_horaria'],
      tipo: json['tipo'],
      palestrante: json['palestrante'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "data": data!.millisecondsSinceEpoch,
      "tipo": tipo,
      "template": template,
      "carga_horaria": cargaHoraria,
      "palestrante": palestrante,
      "status": status,
    };
  }
}
