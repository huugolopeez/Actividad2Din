import 'package:flutter/material.dart';

import 'Actividad2.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  initFB();
  runApp(Actividad2());
}

void initFB() async {
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
}