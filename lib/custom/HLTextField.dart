import 'package:flutter/material.dart';

class HLTextField extends StatelessWidget {

  String sLabel;
  TextEditingController tecController;
  bool blIsPassword;
  double dPaddingH;
  double dPaddingV;

  HLTextField({Key? key,
    required this.sLabel,
    required this.tecController,
    this.blIsPassword = false,
    this.dPaddingH = 60,
    this.dPaddingV = 16
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: dPaddingH, vertical: dPaddingV),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
            controller: tecController,
            obscureText: blIsPassword,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: sLabel
            )))
        ]
      )
    );
  }
}