import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {

  Function(int indice)? evento;

  BottomMenu({Key? key, required this.evento}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: () => evento!(0), child: Icon(Icons.list, color: Colors.deepPurpleAccent)),
        TextButton(onPressed: () => evento!(1), child: Icon(Icons.grid_view, color: Colors.deepPurpleAccent))
      ],
    );
  }

}