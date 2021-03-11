import 'dart:convert';

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  UsuarioModel({
    this.id,
    this.correo,
    this.clave,
  });

  int id;
  String correo;
  String clave;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        correo: json["correo"],
        clave: json["clave"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "correo": correo,
        "clave": clave,
      };
}
