import 'dart:math';

import 'package:flutter/material.dart';

class TiendaPage extends StatefulWidget {
  @override
  _TiendaPageState createState() => _TiendaPageState();
}

class _TiendaPageState extends State<TiendaPage> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        _fondoApp(),
        _widgetImagen(_screenSize),
      ],
    );
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

  Widget _widgetImagen(Size screenSize) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Row(
          children: [
            Container(
              height: screenSize.height * 0.15,
              width: screenSize.width * 0.15,
              child: Image(
                image: NetworkImage(
                    'https://www.w3schools.com/howto/img_avatar.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
