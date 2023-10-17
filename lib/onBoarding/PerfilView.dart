import 'package:actividad2/FirestoreObjects/FbUsuario.dart';
import 'package:actividad2/custom/HLTextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PerfilView extends StatelessWidget {

  FirebaseFirestore db = FirebaseFirestore.instance;
  late BuildContext _context;
  TextEditingController tecName = TextEditingController();
  TextEditingController tecAge = TextEditingController();

  Future<void> onClickAceptar() async {

    FbUsuario usuario = new FbUsuario(nombre: tecName.text, edad: int.parse(tecAge.text));

    String uidUser = FirebaseAuth.instance.currentUser!.uid;
    await db.collection("Usuarios").doc(uidUser).set(usuario.toFirestore());
    Navigator.of(_context).popAndPushNamed('/homeview');
  }

  void onClickCancelar() {
    Navigator.of(_context).popAndPushNamed('/loginview');
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        centerTitle: true,
        shadowColor: Colors.deepPurpleAccent,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HLTextField(sLabel: 'Name', tecController: tecName),
          HLTextField(sLabel: 'Age', tecController: tecAge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: onClickAceptar,
                child: Text('Aceptar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  foregroundColor: MaterialStateProperty.all(Colors.white)
                )),
              TextButton(
                onPressed: onClickCancelar,
                child: Text('Cancelar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                  foregroundColor: MaterialStateProperty.all(Colors.white)
                ))
            ]
          )
        ]
      )
    );
  }
}