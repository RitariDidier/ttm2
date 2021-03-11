import 'dart:convert';

ProductoModel productoModelFromJson(String str) =>
    ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  ProductoModel({
    this.id,
    this.nombre,
    this.tipo,
    this.valor,
    //this.cantidad,
  });

  int id;
  String nombre;
  String tipo;
  String valor;
  //int cantidad;

  factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        id: json["id"],
        nombre: json["nombre"],
        tipo: json["tipo"],
        valor: json["valor"],
        //cantidad: json["cantidad"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "tipo": tipo,
        "valor": valor,
        //"cantidad": cantidad,
      };
  @override
  String toString() {
    // TODO: implement toString
    return 'Nombre: ' + nombre + ', Tipo: ' + tipo + ' Valor: ' + valor;
  }
}
