import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ttm2/src/models/producto_model_2.dart';
import 'package:ttm2/src/providers/db_provider.dart';

class EditarItem extends StatefulWidget {
  String nombre;
  String valor;
  String tipo;
  int id;
  EditarItem({
    this.nombre,
    this.valor,
    this.tipo,
    this.id,
  });
  @override
  _EditarItemState createState() => _EditarItemState();
}

String _nombre = '';
String _valor = '';
String _tipo = '';

class _EditarItemState extends State<EditarItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _fondoApp(),
        Container(
          //color: Color.fromRGBO(108, 192, 218, 1.0),
          padding: EdgeInsets.only(top: 20, right: 10),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                _agregarHeader(),
                SizedBox(
                  height: 10,
                ),
                Divider(color: Colors.black),
                _disabledInputItemData(widget.id.toString()),
                _inputItemData(widget.nombre, TextInputType.text),
                _inputItemData2(widget.valor, TextInputType.number),
                _inputItemData3(widget.tipo, TextInputType.text),
                SizedBox(
                  height: 30,
                ),
                _botonEditar(),
                SizedBox(
                  height: 100,
                ),
                _botonAtras(),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _agregarHeader() {
    return Text(
      'Editar item',
      style: TextStyle(color: Colors.black, fontSize: 38),
    );
  }

  Widget _inputItemData(String field, keyboardType) {
    return Container(
      padding: EdgeInsets.only(top: 30, right: 25, left: 25),
      child: TextField(
        textAlign: TextAlign.center,
        //autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: field,
            hintStyle: TextStyle(color: Colors.white)),
        onChanged: (value) {
          setState(() {
            _nombre = value;
          });
        },
      ),
    );
  }

  Widget _inputItemData2(String field, keyboardType) {
    return Container(
      padding: EdgeInsets.only(top: 30, right: 25, left: 25),
      child: TextField(
        textAlign: TextAlign.center,
        //autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: field,
            hintStyle: TextStyle(color: Colors.white)),
        //suffixIcon: Icon(Icons.search)),
        onChanged: (value) {
          setState(() {
            _valor = value;
          });
        },
      ),
    );
  }

  Widget _inputItemData3(String field, keyboardType) {
    return Container(
      padding: EdgeInsets.only(top: 30, right: 25, left: 25),
      child: TextField(
        textAlign: TextAlign.center,
        //autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: field,
            hintStyle: TextStyle(color: Colors.white)),
        onChanged: (value) {
          setState(() {
            _tipo = value;
          });
        },
        //suffixIcon: Icon(Icons.search)),
      ),
    );
  }

  Widget _disabledInputItemData(String field) {
    return Container(
      padding: EdgeInsets.only(top: 50, right: 25, left: 25),
      child: TextField(
        textAlign: TextAlign.center,
        enabled: false,
        //autofocus: false,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            hintText: field,
            hintStyle: TextStyle(color: Colors.white)),
        //suffixIcon: Icon(Icons.search)),
      ),
    );
  }

  Widget _botonEditar() {
    return RaisedButton(
      onPressed: () {
        ProductoModel2 product1 = ProductoModel2(
            nombre: widget.nombre, tipo: widget.tipo, valor: widget.valor);

        ProductoModel2 product2 = ProductoModel2(
            nombre: _nombre, tipo: _tipo, valor: _valor, id: widget.id);

        if (product1.nombre != product2.nombre ||
            product1.valor != product2.valor ||
            product1.tipo != product2.tipo) {
          DBProvider.db.updateProducto(product2);
          Navigator.pushReplacementNamed(context, 'inventario');
        } else {
          print('Sin Cambios');
        }
      },
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF0D47A1),
                Color(0xFF1976D2),
                Color(0xFF42A5F5),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(80.0))),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: const Text('Editar item', style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Widget _botonAtras() {
    return Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'inventario');
          //Navigator.pop(context);
        },
      ),
    );
  }
}

Widget _fondoApp() {
  final gradiente = Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.6),
            end: FractionalOffset(0.0, 1.0),
            colors: [
          Color.fromRGBO(52, 54, 101, 1.0),
          Color.fromRGBO(35, 37, 57, 1.0),
        ])),
  );

  final caja = Transform.rotate(
    angle: -pi / 6.0,
    child: Container(
      height: 460,
      width: 460,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(85.0),
        gradient: LinearGradient(colors: [
          Color.fromRGBO(20, 20, 82, .0),
          Color.fromRGBO(50, 50, 205, 1.0),
        ]),
      ),
    ),
  );

  return Stack(
    children: <Widget>[
      gradiente,
      Positioned(top: 200, left: -225, child: caja),
    ],
  );
}
