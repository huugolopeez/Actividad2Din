import 'package:flutter/material.dart';

class HLTextField extends StatelessWidget {

  String sLabel;
  TextEditingController tecController;
  bool blIsPassword;

  HLTextField({Key? key, required this.sLabel, required this.tecController, this.blIsPassword=false}) : super(key : key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Flexible(child: TextFormField(
          controller: tecController,
          obscureText: blIsPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: sLabel
          )
        ))
      ]
    );
  }
}