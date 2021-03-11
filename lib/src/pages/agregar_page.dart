import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ttm2/src/models/producto_model_2.dart';
import 'package:ttm2/src/providers/db_provider.dart';

class AgregarItemPage extends StatefulWidget {
  @override
  _AgregarState createState() => _AgregarState();
}

String _nombre = '';
String _valor = '';
String _tipo = '';

class _AgregarState extends State<AgregarItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondoApp(),
          Container(
            child: Center(
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  //color: Color.fromRGBO(108, 192, 218, 0.50),
                  child: Column(
                    children: <Widget>[
                      _agregarText(),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(color: Colors.black),
                      SizedBox(
                        height: 100,
                      ),
                      _crearTextField("Nombre", TextInputType.text),
                      _crearTextField2("valor", TextInputType.number),
                      _crearTextField3("tipo", TextInputType.text),
                      SizedBox(
                        height: 10,
                      ),
                      _boton(),
                      _botonAtras(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _agregarText() {
    return Text(
      'Agregar Item',
      style: TextStyle(
        color: Colors.black,
        fontSize: 38,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _crearTextField(String nombre, keyboardType) {
    return Container(
      padding: EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 10,
      ),
      child: TextField(
        textAlign: TextAlign.center,
        autofocus: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: nombre,
            hintStyle: TextStyle(color: Colors.white)
            //helperText: 'Correo@gmail.com',
            ),
        onChanged: (value) {
          setState(() {
            _nombre = value;
            print(_nombre);
          });
        },
      ),
    );
  }

  Widget _crearTextField2(String nombre, keyboardType) {
    return Container(
      padding: EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 7,
      ),
      child: TextField(
        textAlign: TextAlign.center,
        autofocus: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: nombre,
            hintStyle: TextStyle(color: Colors.white)
            //helperText: 'Correo@gmail.com',
            ),
        onChanged: (value) {
          setState(() {
            _valor = value;
            print(_nombre);
          });
        },
      ),
    );
  }

  Widget _crearTextField3(String nombre, keyboardType) {
    return Container(
      padding: EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 0,
      ),
      child: TextField(
        textAlign: TextAlign.center,
        autofocus: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            counterText: "",
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: nombre,
            hintStyle: TextStyle(color: Colors.white)
            //helperText: 'Correo@gmail.com',
            ),
        onChanged: (value) {
          setState(() {
            _tipo = value;
            print(_nombre);
          });
        },
      ),
    );
  }

  Widget _boton() {
    return RaisedButton(
      onPressed: () {
        ProductoModel2 product =
            ProductoModel2(nombre: _nombre, tipo: _tipo, valor: _valor);

        DBProvider.db.nuevoProducto(product);
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
        child: const Text('Agregar', style: TextStyle(fontSize: 20)),
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
