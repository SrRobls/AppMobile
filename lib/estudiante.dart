import 'package:flutter/material.dart';

class Estudiante extends StatelessWidget{
  const Estudiante({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: const Text("Johan Sebastian Robles Rincon"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Correo: joroblesr@unal.edu.co', style: TextStyle(fontSize: 20, color: Colors.black)),
              Text('Edad : 22 Años', style: TextStyle(fontSize: 20, color: Colors.green))
            ],
          ),
        ),
      );
  }

}