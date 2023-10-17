import 'package:flutter/material.dart';

class PostCellView extends StatelessWidget {

  final String sText;
  final int iColorCode;
  final double dFontSize;

  PostCellView({Key? key,
    required this.sText,
    required this.iColorCode,
    required this.dFontSize
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.amber[iColorCode],
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
            sText,
            style: TextStyle(
                fontSize: dFontSize
            ))
      )
    );
  }
}