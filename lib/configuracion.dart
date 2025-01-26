import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Configuracion extends StatelessWidget {
  const Configuracion({Key? key}) : super(key: key);

  Future<void> _setBackgroundImage(String imagePath, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('background_image', imagePath);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Imagen actualizado')));
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/imagen1.png',
      'assets/imagen2.png',
      'assets/imagen3.png',
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Configuración'),
        ),
        body: ListView.builder(
          itemCount: imagePaths.length,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                _setBackgroundImage(imagePaths[index], context);
              },
              child: Card(
                child: Column(
                  children: [
                    Image.asset(
                      imagePaths[index],
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10,),
                    Text('Seleccionar Imagen ${index + 1}'),
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}
