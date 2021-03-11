// import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
import 'package:ttm2/src/models/producto_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async {
    //path de
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'productos.db');

    print(path);
    print('ctm');

    //Crear Database
    return await openDatabase(path, version: 2, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE productos(
            id INTEGER PRIMARY KEY,
            nombre TEXT,
            tipo TEXT,
            valor TEXT
          )
        ''');
    });
  }

  Future<int> nuevoProductoRaw(ProductoModel nuevoProducto) async {
    final id = nuevoProducto.id;
    final tipo = nuevoProducto.tipo;
    final valor = nuevoProducto.valor;
    //final cantidad = nuevoProducto.cantidad;
    //verificar base de datos
    final db = await database;

    final res = await db.rawInsert('''
      INSERT INTO productos( id, tipo, valor, cantidad )
        VALUES( $id, '$tipo', '$valor')
    ''');
    return res;
  }

  Future<int> nuevoProducto(ProductoModel nuevoProducto) async {
    final db = await database;
    final res = await db.insert('productos', nuevoProducto.toJson());

    print(res);

    return res;
  }

  Future<ProductoModel> getProductoByID(int id) async {
    final db = await database;
    final res = await db.query('productos', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ProductoModel.fromJson(res.first) : null;
  }

  Future<List<ProductoModel>> getTodosProductos() async {
    final db = await database;
    final res = await db.query('productos');

    return res.isNotEmpty
        ? res.map((p) => ProductoModel.fromJson(p)).toList()
        : [];
  }

  Future<List<ProductoModel>> getProductoByTipo(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM productos WHERE tipo = '$tipo'
    ''');

    return res.isNotEmpty
        ? res.map((p) => ProductoModel.fromJson(p)).toList()
        : [];
  }

  Future<int> updateProducto(ProductoModel newProducto) async {
    final db = await database;
    final res = await db.update('productos', newProducto.toJson(),
        where: 'id = ?', whereArgs: [newProducto.id]);

    return res;
  }

  Future<int> deleteProducto(int id) async {
    final db = await database;
    final res = await db.delete('productos', where: 'id = ?', whereArgs: [id]);

    return res;
  }

  Future<int> deleteAllProducto() async {
    final db = await database;
    final res = await db.rawDelete('''
      DELETE FROM productos
    ''');
    return res;
  }
}
