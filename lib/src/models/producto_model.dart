// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) =>
    ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  ProductoModel({
    this.codigo,
    this.nombre,
    this.precio,
    this.categoriaId,
    this.tiendaId,
  });

  String codigo;
  String nombre;
  int precio;
  int categoriaId;
  int tiendaId;

  factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        codigo: json["codigo"],
        nombre: json["nombre"],
        precio: json["precio"],
        categoriaId: json["categoria_id"],
        tiendaId: json["tienda_id"],
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "nombre": nombre,
        "precio": precio,
        "categoria_id": categoriaId,
        "tienda_id": tiendaId,
      };
}
