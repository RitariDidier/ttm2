// To parse this JSON data, do
//
//     final productoModel2 = productoModel2FromJson(jsonString);

import 'dart:convert';

ProductoModel2 productoModel2FromJson(String str) =>
    ProductoModel2.fromJson(json.decode(str));

String productoModel2ToJson(ProductoModel2 data) => json.encode(data.toJson());

class ProductoModel2 {
  ProductoModel2({
    this.id,
    this.nombre,
    this.tipo,
    this.valor,
  });

  int id;
  String nombre;
  String tipo;
  String valor;

  factory ProductoModel2.fromJson(Map<String, dynamic> json) => ProductoModel2(
        id: json["id"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "tipo": tipo,
        "valor": valor,
      };
}
