import 'package:flutter/material.dart';

class HLTextButton extends StatelessWidget {

  Function(int indice)? evento;
  Widget sText0;
  Widget sText1;

  HLTextButton({Key? key,
    required this.sText0,
    required this.sText1,
    this.evento
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () => evento!(0),
          child: sText0,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
            foregroundColor: MaterialStateProperty.all(Colors.white)
          )),
        TextButton(
          onPressed: () => evento!(1),
          child: sText1,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
            foregroundColor: MaterialStateProperty.all(Colors.white)
          ))
      ]
    );
  }
}