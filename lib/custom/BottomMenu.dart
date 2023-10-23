import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: () => print('Lista'), child: Icon(Icons.list, color: Colors.deepPurpleAccent)),
        TextButton(onPressed: () => print('Grid'), child: Icon(Icons.grid_view, color: Colors.deepPurpleAccent))
      ],
    );
  }

}