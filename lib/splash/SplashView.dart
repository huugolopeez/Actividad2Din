import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView> {

  late BuildContext _context;

  void checkSession() async {
    await Future.delayed(Duration(seconds: 4));
    if (FirebaseAuth.instance.currentUser != null) Navigator.of(_context).popAndPushNamed('/homeview');
    else Navigator.of(_context).popAndPushNamed('/loginview');
  }

  @override
  void initState() {
    super.initState();
    checkSession();
  }

  @override
  Widget build(BuildContext context) {

    _context = context;

    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('resources/gatoElegante.jpg', width: 300, height: 400),
        CircularProgressIndicator()
      ]
    );
  }
}