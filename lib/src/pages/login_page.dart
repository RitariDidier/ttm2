import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ttm2/src/models/producto_model_2.dart';

class LoginPage extends StatelessWidget {
  //List<ProductoModel2> listaP;

  @override
  Widget build(BuildContext context) {
    //DBProvider.db.getTodosProductos().then((listaP) => this.listaP = listaP);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          _inputs(context),
        ],
      ),
    );
  }

  Widget _inputs(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _crearEmail(),
            _crearPassword(),
            SizedBox(
              height: 20,
            ),
            _botonLogin(context),
          ],
        ),
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

Widget _crearEmail() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 10.0),
        child: TextFormField(
          autofocus: false,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: Colors.white,
          ),
          cursorColor: Colors.amber,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20)),
            hintText: 'Email',
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            suffixStyle: TextStyle(color: Colors.white),

            //labelText: 'Email',
          ),
        ),
      ),
    ),
  );
}

Widget _crearPassword() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 10.0),
        child: TextField(
          autofocus: false,
          obscureText: true,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20)),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            suffixIcon: Icon(
              Icons.lock_open,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget _botonLogin(BuildContext context) {
  return RaisedButton(
    onPressed: () {
      Navigator.pushReplacementNamed(context, 'inventario');
    },
    textColor: Colors.white,
    padding: const EdgeInsets.all(0.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
    child: Container(
      decoration: const BoxDecoration(
        //color: Colors.transparent,
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 1.0),
          end: FractionalOffset(-1.0, 0.2),
          colors: <Color>[
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ],
        ),

        borderRadius: BorderRadius.all(Radius.circular(80.0)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: const Text('Ingresar', style: TextStyle(fontSize: 20)),
    ),
  );
}
