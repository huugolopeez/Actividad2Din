import 'package:flutter/material.dart';

class PostGridCellView extends StatelessWidget {

  final String sTitulo;
  final String sCuerpo;
  final int iColorCode;
  final double dFontSize;

  PostGridCellView({Key? key,
    required this.sTitulo,
    required this.sCuerpo,
    required this.iColorCode,
    required this.dFontSize,
  });

  @override
  Widget build(BuildContext context) {

    return FractionallySizedBox(
        child: Container(
          color: Colors.deepPurple[iColorCode],
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  sTitulo,
                  style: TextStyle(
                    fontSize: dFontSize
                  )),
                Text(
                  sCuerpo,
                  style: TextStyle(
                    fontSize: dFontSize
                  ))
              ]
            )
          )
        )
    );
  }
}