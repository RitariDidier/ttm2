import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class InventarioPage extends StatefulWidget {
  @override
  _InventarioPageState createState() => _InventarioPageState();
}

class _InventarioPageState extends State<InventarioPage> {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: <Widget>[
                  _agregarBotones(context),
                  _widgetBusqueda(),
                  _widgetStock(),
                  _widgetLista(_screenSize),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buttonNavigationBar(context),
    );
  }

  Widget _agregarBotones(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(top: 15),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: screensize.width * 0.36,
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                //color: Color.fromRGBO(500, 66, 107, 0.7),
                gradient: LinearGradient(
                  // begin: FractionalOffset(0.0, 1.0),
                  // end: FractionalOffset(1.0, 0),
                  colors: <Color>[
                    Color.fromRGBO(50, 50, 205, 0.4),
                    Color.fromRGBO(45, 50, 205, 1.0),
                  ],
                ),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.add,
                  size: 40,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _widgetStock() {
    return SafeArea(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          //padding: EdgeInsets.only(top: 210, right: 25, left: 25),
          child: Row(
            children: <Widget>[
              Text(
                'Resultados',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                width: 55,
              ),
              Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromRGBO(50, 50, 205, 0.4),
                      Color.fromRGBO(45, 50, 205, 1.0),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Stock',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(
                      Icons.auto_awesome_mosaic,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _widgetLista(Size _screenSize) {
    return Container(
      height: _screenSize.height * 0.7, //500,
      width: _screenSize.height * 0.7, //400,
      child: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, i) => ListTile(
            //leading: IconButton(icon: , onPressed: ,),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Titulo',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                SizedBox(
                  width: _screenSize.width * 0.35,
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print('Delete');
                  },
                ),
              ],
            ),
            subtitle: Text(
              'ID:' + '$i',
              style: TextStyle(color: Colors.white70),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
              size: 30,
            ),

            onTap: () => print('funcion'),
          ),
        ),
      ),
    );
  }

  Widget _buttonNavigationBar(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 85, 1.0),
        primaryColor: Color.fromRGBO(0, 184, 230, 1),
        textTheme: Theme.of(context).textTheme.copyWith(
            caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))),
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 30.0),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart, size: 30.0),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 30.0),
            title: Container(),
          ),
        ],
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

Widget _widgetBusqueda() {
  return SafeArea(
    child: Container(
      //padding: EdgeInsets.only(top: 120, right: 25, left: 25),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 10.0),
          child: TextField(
            //autofocus: false,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Producto',
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              suffixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
      ),
    ),
  );
}
