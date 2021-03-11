import 'package:flutter/material.dart';
import 'package:ttm2/src/pages/agregar_page.dart';
import 'package:ttm2/src/pages/editar_page.dart';
import 'package:ttm2/src/pages/inventario_page.dart';

import 'package:ttm2/src/pages/login_page.dart';
import 'package:ttm2/src/pages/tienda_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'login': (BuildContext context) => LoginPage(),
    'inventario': (BuildContext context) => InventarioPage(),
    'tienda': (BuildContext context) => TiendaPage(),
    'agregar': (BuildContext context) => AgregarItemPage(),
    'editar': (BuildContext context) => EditarItem(),
  };
}
