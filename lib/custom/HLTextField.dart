import 'package:flutter/material.dart';

class HLTextField extends StatelessWidget {

  String sHint;
  TextEditingController tecController;
  bool bObsucure;

  HLTextField({Key? key, required this.sHint, required this.tecController, this.bObsucure=false}) : super(key : key);

  @override
  Widget build(BuildContext context) {

    return Row(
        children: [
          Flexible(child: TextFormField(
              controller: tecController,
              obscureText: bObsucure,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: sHint
              )
          ))
        ]
    );
  }
}