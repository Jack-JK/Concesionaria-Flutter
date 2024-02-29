import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/nosotros.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
        actions: [
          TextButton(
            onPressed: () {
              // Acción para "Iniciar Sesión"
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPage(title: 'login')),
              );
            },
            child: const Text('Iniciar Sesión'),
          ),
          TextButton(
            onPressed: () {
              // Acción para "Nosotros"
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NosotrosPage()),
              );
            },
            child: const Text('Nosotros'),
          ),
        ],
      ),
      body: Center(
        child: Image.asset('assets/logo.png'),
      ),
    );
  }
}
