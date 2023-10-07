import 'package:flutter/material.dart';

import 'main/HomeView.dart';
import 'onBoarding/LoginView.dart';
import 'onBoarding/RegisterView.dart';

class Actividad2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: '2DIN',
      routes: {
        '/loginview': (context) => LoginView(),
        '/registerview': (context) => RegisterView(),
        '/homeview': (context) => HomeView()
      },
      initialRoute: '/loginview',
      debugShowCheckedModeBanner: false
    );
  }
}