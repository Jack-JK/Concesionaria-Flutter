import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/modelo.dart';
import 'package:flutter_application_1/pages/proveedor.dart';
import 'package:flutter_application_1/pages/venta.dart';
import 'package:flutter_application_1/service/firebase_service.dart';

class MarcaPage extends StatefulWidget {
  const MarcaPage({Key? key}) : super(key: key);

  @override
  State<MarcaPage> createState() => _MarcaPageState();
}

class _MarcaPageState extends State<MarcaPage> {
  List<Map<String, dynamic>> _marcas = [];
  final marcaController = TextEditingController();

  void _limpiarCampo() {
    marcaController.clear();
  }

  void _leerMarcas() {
    FirebaseService.leerMarcas().then((marcas) {
      setState(() {
        _marcas = marcas;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Error al leer marcas: $error');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Marca'),
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
            ElevatedButton(
              onPressed: () {
                _limpiarCampo();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Nueva Marca'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: marcaController,
                            decoration: const InputDecoration(labelText: 'Nombre de la Marca'),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _limpiarCampo();
                          },
                          child: const Text('Cancelar'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (marcaController.text.isNotEmpty) {
                              FirebaseService.guardarMarca(marcaController.text).then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Marca guardada correctamente')),
                                );
                                Navigator.of(context).pop();
                                _limpiarCampo();
                              }).catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Error al guardar la marca: $error')),
                                );
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Por favor, ingrese el nombre de la marca')),
                              );
                            }
                          },
                          child: const Text('Guardar Marca'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Crear nueva Marca'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _leerMarcas,
              child: const Text('Leer Marcas'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tabla de Marcas:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Marca')),
                ],
                rows: _marcas.map((marca) {
                  return DataRow(
                    cells: [
                      DataCell(Text(marca['ID'].toString())),
                      DataCell(Text(marca['Marca'])),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
