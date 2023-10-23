import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom/HLTextButton.dart';
import '../custom/HLTextField.dart';

class RegisterView extends StatelessWidget {

  late BuildContext _context;
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPass = TextEditingController();
  TextEditingController tecRepass = TextEditingController();

  throwSnackBar(String error) {
    SnackBar snackBar = SnackBar(content: Text(error));
    ScaffoldMessenger.of(_context).showSnackBar(snackBar);
  }

  onClickCancel() {
    Navigator.of(_context).popAndPushNamed('/loginview');
  }

  onClickRegister() async {
    if(tecPass.text == tecRepass.text) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: tecEmail.text,
          password: tecPass.text
        );
        Navigator.of(_context).popAndPushNamed('/perfilview');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print(' --> La contraseña es muy debil.');
          throwSnackBar('-- La contraseña es muy debil --');
        } else if (e.code == 'email-already-in-use') {
          print(' --> El correo electronico ya esta en uso.');
          throwSnackBar('-- El correo electronico ya esta en uso --');
        }
      } catch (e) {
        print(e);
      }
    } else {
      print(' --> Las contraseñas no coinciden.');
      throwSnackBar('-- Las contraseñas no coinciden --');
    }
  }

  void onHLTextutton(int indice) {
    if(indice == 0) onClickRegister();
    else if(indice == 1) onClickCancel();
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          shadowColor: Colors.deepPurpleAccent
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HLTextField(sLabel: 'Username', tecController: tecEmail),
            HLTextField(sLabel: 'Password', tecController: tecPass, blIsPassword: true),
            HLTextField(sLabel: 'Confirm password', tecController: tecRepass, blIsPassword: true),
            HLTextButton(sText0: Text('Register'), sText1: Text('Cancel'), evento: onHLTextutton)
          ]
        )
    );
  }
}