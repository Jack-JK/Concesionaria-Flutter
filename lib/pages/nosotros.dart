import 'package:flutter/material.dart';

class NosotrosPage extends StatelessWidget {
  const NosotrosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 171, 183, 243), // Color de fondo claro
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7), // Color de fondo semi-transparente
              borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Somos un equipo de desarrolladores dedicados a crear soluciones innovadoras en el mercado automotriz. ',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  'Hemos trabajado en el proyecto de la Concesionaria de Autos utilizando Flutter y Firebase para brindar una experiencia única a nuestros clientes.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24),
                ),

                SizedBox(height: 10),
                Text(
                  'Nuestro equipo está conformado por Jonathan Arias y Mario Terrazas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
