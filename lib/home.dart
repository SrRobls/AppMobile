import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Creamos la clase principal com¿mo stateFull ya que la imagen va a cambiar dinamicamente
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  //Home es la clase widget pero _homeState maneja el estado del widget
  @override
  State<Home> createState() => _HomeState();
}

//
class _HomeState extends State<Home> {
  String? _imagePath; //ES una variable privada por el _

  // ESta es una funciona que me dira el estado inicial del widget cuando se cree, el cual ejeucta una funcion
  @override
  void initState() {
    super.initState();
    _loadImageFromPreferences();
  }

  //Esta funcion cuando se inicie el widget obtendra la imagen bajo dl nombre background_image de SharedPreferences, si no hay, entinces agarra una por defecto
  //SharedPreferences es una herramienta para guardar y recuperar datos pequeños, como cadenas de texto, números, o bo
  Future<void> _loadImageFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _imagePath =
          prefs.getString('background_image') ?? 'assets/default_image.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: const Text('Inicio'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Inicio de la APP',
                style: TextStyle(fontSize: 50, color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/estudiante');
              },
              child: const Text('Ir a Estudiante'),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () async {
                //El await le dice a Flutter que espere hasta que el usuario regrese de la pantalla de configuración antes de continuar ejecutando el siguiente código.
                await Navigator.pushNamed(context, '/configuracion');
                _loadImageFromPreferences();
              },
              child: const Text('Ir a Configuración'),

            ),
            const SizedBox(height: 20,),
            if (_imagePath != null)
              Image.asset(
                _imagePath!,
                height: 700,
                fit: BoxFit.cover,
              )
            else
              const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
