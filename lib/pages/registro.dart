import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {
  runApp(MaterialApp(
    home: RegisterPage(),
  ));
}

class RegisterPage extends StatelessWidget {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController ciController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController fechaNacimientoController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  RegisterPage({super.key});

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
              controller: nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: apellidoController,
              decoration: const InputDecoration(labelText: 'Apellido'),
            ),
            TextFormField(
              controller: ciController,
              decoration: const InputDecoration(labelText: 'CI'),
            ),
            TextFormField(
              controller: fechaNacimientoController,
              decoration: const InputDecoration(labelText: 'Fecha de Nacimiento'),
            ),
            TextFormField(
              controller: estadoController,
              decoration: const InputDecoration(labelText: 'Estado'),
            ),
            TextFormField(
              controller: correoController,
              decoration: const InputDecoration(labelText: 'Correo'),
            ),
            TextFormField(
              controller: contrasenaController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
            ElevatedButton(
              onPressed: () {
                // Llamar a la función para guardar el cliente
                guardarCliente(context);
              },
              child: const Text('Registrarse'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Navegar a la página de inicio de sesión
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(title: 'Inicio de Sesión')));
              },
              child: const Text('¿Ya tienes una cuenta? Inicia sesión aquí'),
            ),
          ],
        ),
      ),
    );
  }

  void guardarCliente(BuildContext context) async {
    try {
      // Obtener los valores de los controladores
      var nombre = nombreController.text;
      var apellido = apellidoController.text;
      var ci = int.tryParse(ciController.text) ?? 0; // Convertir a entero o usar 0 si es nulo
      var telefono = int.tryParse(telefonoController.text) ?? 0; // Convertir a entero o usar 0 si es nulo
      var fechaNacimiento = fechaNacimientoController.text;
      var estado = estadoController.text;
      var correo = correoController.text;
      var contrasena = contrasenaController.text;

      // Crear el usuario en Firebase Authentication
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: correo,
        password: contrasena,
      );

      // Obtener el valor actual del contador para los clientes
      var contador = await FirebaseFirestore.instance.collection("Contador").doc("Cliente").get();
      var nuevoID = 1;

      if (contador.exists) {
        // Si existe el contador, obtener su valor y aumentarlo en 1
        nuevoID = contador.data()!['valor'] + 1;
        await FirebaseFirestore.instance.collection("Contador").doc("Cliente").update({'valor': nuevoID});
      } else {
        // Si no existe el contador, inicializarlo con 1
        await FirebaseFirestore.instance.collection("Contador").doc("Cliente").set({'valor': nuevoID});
      }

      // Guardar el documento con el nuevo ID único en la colección "Cliente"
      await FirebaseFirestore.instance.collection("Cliente").doc(nuevoID.toString()).set({
        'Nombre': nombre,
        'Apellido': apellido,
        'CI': ci,
        'Telefono': telefono,
        'Fecha_Nacimiento': fechaNacimiento,
        'Estado': estado,
      });

      // Redireccionar a la página de inicio de sesión
       // ignore: use_build_context_synchronously
       Navigator.push(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(title: 'login')),
              );
    } catch (error) {
      // ignore: avoid_print
      print("Error en el registro: $error");
      // Mostrar mensaje de error al usuario
    }
  }
}
