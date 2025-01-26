import 'package:flutter/material.dart';
import 'estudiante.dart';
import 'home.dart';
import 'configuracion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Mobile',
      home: const Home(),
      routes: {
        '/estudiante': (context) => const Estudiante(),
        '/configuracion': (context) => const Configuracion(),
      },
    );
  }
}