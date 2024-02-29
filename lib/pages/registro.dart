import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';

void main() {
  runApp(const MaterialApp(
    home: RegisterPage(),
  ));
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Apellido'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'CI'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Fecha de Nacimiento'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Estado'),
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your registration logic here
              },
              child: const Text('Registrarse'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage(title: 'Inicio de Sesión')),
                );
              },
              child: const Text('¿Ya tienes una cuenta? Inicia sesión aquí'),
            ),
          ],
        ),
      ),
    );
  }
}