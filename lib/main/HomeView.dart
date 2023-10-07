import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        shadowColor: Colors.deepPurpleAccent,
        title: Center(child: Text('Home'))
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Padding(padding: EdgeInsets.only(bottom: 16),
                child: Text('Bienvenido al home de Actividad1', textScaleFactor: 2),
              )
          ),
          Center(
            child: Image.asset('resources/gatoElegante.jpg', width: 200),
          )
        ],
      ),
    );
  }
}