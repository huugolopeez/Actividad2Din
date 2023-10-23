import 'package:actividad2/custom/HLTextButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom/HLTextField.dart';

class LoginView extends StatelessWidget {

  late BuildContext _context;
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPass = TextEditingController();

  throwSnackBar(String error) {
    SnackBar snackBar = SnackBar(content: Text(error));
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }

  onClickRegister() {
    Navigator.of(_context).popAndPushNamed('/registerview');
  }

  onClickLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: tecEmail.text,
        password: tecPass.text
      );
      Navigator.of(_context).popAndPushNamed('/splashview');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        print(' --> Formato del email incorrecto.');
        throwSnackBar('-- Formato del email incorrecto --');
      } else if (e.code == 'invalid-login-credentials') {
        print(' --> Credenciales incorrectas.');
        throwSnackBar('-- Credenciales incorrectas --');
      }
    }
  }

  void onHLTextutton(int indice) {
    if(indice == 0) onClickLogin();
    else if(indice == 1) onClickRegister();
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        shadowColor: Colors.deepPurpleAccent
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HLTextField(sLabel: 'Username', tecController: tecEmail),
          HLTextField(sLabel: 'Password', tecController: tecPass, blIsPassword: true),
          HLTextButton(sText0: Text('Login'), sText1: Text('Register'), evento: onHLTextutton)
        ]
      )
    );
  }
}