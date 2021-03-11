import 'package:flutter/cupertino.dart';
import 'package:ttm2/src/models/producto_model.dart';
import 'package:ttm2/src/models/producto_model_2.dart';

import 'package:ttm2/src/providers/db_provider.dart';

class ProductosListProvider extends ChangeNotifier {
  List<ProductoModel2> productos = [];
  String tipoSeleccionado = 'comida';

  // nuevoProducto(String valor, String nombre, String tipo) async {
  //   final nuevoProducto =
  //       new ProductoModel(valor: valor, tipo: tipo, nombre: nombre);
  //   final id = await DBProvider.db.nuevoProducto(nuevoProducto);

  //   //Asignar el ID de la base de datos al modelo

  //   nuevoProducto.id = id;

  //   this.productos.add(nuevoProducto);
  //   notifyListeners();
  // }

  cargarProducto() async {
    final productos = await DBProvider.db.getTodosProductos();
    this.productos = [...productos];
    notifyListeners();
  }

  cargarProductoPorTipo(String tipo) async {
    final productos = await DBProvider.db.getProductoByTipo(tipo);
    this.productos = [...productos];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodosProductos() async {
    await DBProvider.db.deleteAllProducto();
    this.productos = [];
    notifyListeners();
  }

  borrarProductoPorID(int id) async {
    await DBProvider.db.deleteProducto(id);
    this.cargarProductoPorTipo(this.tipoSeleccionado);
  }
}
