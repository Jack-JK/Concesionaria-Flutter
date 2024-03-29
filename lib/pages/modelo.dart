import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/marca.dart';
import 'package:flutter_application_1/pages/proveedor.dart';
import 'package:flutter_application_1/pages/venta.dart';
import 'package:flutter_application_1/service/firebase_service.dart';

class ModeloPage extends StatefulWidget {
  const ModeloPage({Key? key}) : super(key: key);

  @override
  State<ModeloPage> createState() => _ModeloPageState();
}

class _ModeloPageState extends State<ModeloPage> {
  List<Map<String, dynamic>> _modelos = [];
  final modeloController = TextEditingController();
  String? selectedMarca;

  void _leerModelos() {
    FirebaseService.leerModelos().then((modelos) {
      setState(() {
        _modelos = modelos;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Error al leer modelos: $error');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Modelo'),
      ),
            drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Marca'),
              onTap: () {
                // Navegación a Marca
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MarcaPage())
                );
              },
            ),
            ListTile(
              title: const Text('Modelo'),
              onTap: () {
                // Navegación a Modelo
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ModeloPage())
                );
              },
            ),
            ListTile(
              title: const Text('Proveedor'),
              onTap: () {
                // Navegación a Proveedor
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProveedorPage())
                );
              },
            ),
            ListTile(
              title: const Text('Venta'),
              onTap: () {
                // Navegación a Venta
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VentaPage())
                );
              },
            ),
            ListTile(
              title: const Text('Cerrar sesión'),
              onTap: () {
                // Navegación a home
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage())
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: modeloController,
              decoration: const InputDecoration(labelText: 'Nombre del Modelo'),
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: FirebaseService.leerMarcas(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Map<String, dynamic>> marcas = snapshot.data!;
                  return DropdownButton<String>(
                    hint: const Text('Seleccione una marca'),
                    value: selectedMarca,
                    items: marcas.map((marca) {
                      return DropdownMenuItem<String>(
                        value: marca['ID'].toString(),
                        child: Text(marca['Marca']),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedMarca = value;
                      });
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (modeloController.text.isNotEmpty && selectedMarca != null) {
                  FirebaseService.guardarModelo(modeloController.text, selectedMarca!).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Modelo guardado correctamente')),
                    );
                    modeloController.clear();
                    setState(() {
                      selectedMarca = null;
                    });
                    //_leerModelos(); // Actualizar la lista de modelos después de guardar uno nuevo
                  }).catchError((error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error al guardar el modelo: $error')),
                    );
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Por favor, ingrese el nombre del modelo y seleccione una marca')),
                  );
                }
              },
              child: const Text('Guardar Modelo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _leerModelos,
              child: const Text('Cargar Modelos'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tabla de Modelos:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Modelo')),
                  DataColumn(label: Text('Marca')),
                ],
                rows: _modelos.map((modelo) {
                  return DataRow(
                    cells: [
                      DataCell(Text(modelo['ID'].toString())),
                      DataCell(Text(modelo['Modelo'])),
                      DataCell(Text(modelo['Marca'])),
                    ],
                  );
                }).toList(),
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
