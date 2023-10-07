import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        onClickCancel();
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

  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
        appBar: AppBar(
            title: Center(child: Text('Register')),
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
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
                  child: TextFormField(
                      controller: tecRepass,
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'Confirm password',
                          border: OutlineInputBorder()
                      )
                  )
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          onClickRegister();
                        },
                        child: Text('Register'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.deepPurple),
                            foregroundColor: MaterialStateProperty.all(
                                Colors.white)
                        )
                    ),
                    TextButton(
                        onPressed: () {
                          onClickCancel();
                        },
                        child: Text('Cancel'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.deepPurple),
                            foregroundColor: MaterialStateProperty.all(
                                Colors.white)
                        )
                    )
                  ]
              )
            ]
        )
    );
  }
}