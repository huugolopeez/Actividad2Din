import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      Navigator.of(_context).popAndPushNamed('/homeview');
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

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login')),
        backgroundColor: Colors.deepPurple,
        shadowColor: Colors.deepPurpleAccent
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            child: TextField(
              controller: tecEmail,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder()
              )
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
            child: TextFormField(
              controller: tecPass,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder()
              )
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () { onClickLogin(); },
                  child: Text('Login'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                      foregroundColor: MaterialStateProperty.all(Colors.white)
                  )
              ),
              TextButton(
                  onPressed: () { onClickRegister(); },
                  child: Text('Register'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                    foregroundColor: MaterialStateProperty.all(Colors.white)
                  )
              )
            ]
          )
        ]
      )
    );
  }
}