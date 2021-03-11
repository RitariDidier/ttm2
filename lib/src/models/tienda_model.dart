// To parse this JSON data, do
//
//     final tiendaModel = tiendaModelFromJson(jsonString);

import 'dart:convert';

TiendaModel tiendaModelFromJson(String str) =>
    TiendaModel.fromJson(json.decode(str));

String tiendaModelToJson(TiendaModel data) => json.encode(data.toJson());

class TiendaModel {
  TiendaModel({
    this.id,
    this.nombre,
    this.usuarioId,
  });

  int id;
  String nombre;
  int usuarioId;

  factory TiendaModel.fromJson(Map<String, dynamic> json) => TiendaModel(
        id: json["id"],
        nombre: json["nombre"],
        usuarioId: json["usuario_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "usuario_id": usuarioId,
      };
}
