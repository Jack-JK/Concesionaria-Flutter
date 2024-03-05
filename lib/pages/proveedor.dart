import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/compra.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/marca.dart';
import 'package:flutter_application_1/pages/modelo.dart';
import 'package:flutter_application_1/pages/rol.dart';
import 'package:flutter_application_1/pages/venta.dart';
import 'package:flutter_application_1/service/firebase_service.dart';

class ProveedorPage extends StatefulWidget {
  const ProveedorPage({Key? key}) : super(key: key);

  @override
  State<ProveedorPage> createState() => _ProveedorPageState();
}

class _ProveedorPageState extends State<ProveedorPage> {
  List<Map<String, dynamic>> _proveedores = [];
  final razonSocialController = TextEditingController();
  final telefonoController = TextEditingController();
  final direccionController = TextEditingController();

  void _limpiarCampos() {
    razonSocialController.clear();
    telefonoController.clear();
    direccionController.clear();
  }

  void _leerProveedores() {
    FirebaseService.leerProveedores().then((proveedores) {
      setState(() {
        _proveedores = proveedores;
      });
    }).catchError((error) {
      print('Error al leer proveedores: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Proveedores'),
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
              title: const Text('Compra'),
              onTap: () {
                // Navegación a Compra
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CompraPage())
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
              title: const Text('Rol'),
              onTap: () {
                // Navegación a Rol
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RolPage())
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Registro de Proveedores',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: razonSocialController,
                decoration: const InputDecoration(
                  labelText: 'Razón Social',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: telefonoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: direccionController,
                decoration: const InputDecoration(
                  labelText: 'Dirección',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String razonSocial = razonSocialController.text;
                  int telefono = int.tryParse(telefonoController.text) ?? 0;
                  String direccion = direccionController.text;

                  if (razonSocial.isNotEmpty && telefono != 0 && direccion.isNotEmpty) {
                    FirebaseService.guardarProveedor(razonSocial, telefono, direccion).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Proveedor guardado correctamente')),
                      );
                      _limpiarCampos();
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error al guardar el proveedor: $error')),
                      );
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, complete todos los campos')),
                    );
                  }
                },
                child: const Text('Guardar Proveedor'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _leerProveedores,
                child: const Text('Leer Proveedores'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Tabla de Proveedores:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      DataColumn(label: Text('Razón Social')),
                      DataColumn(label: Text('Teléfono')),
                      DataColumn(label: Text('Dirección')),
                    ],
                    rows: _proveedores.map((proveedor) {
                      return DataRow(
                        cells: [
                          DataCell(Text(proveedor['ID'].toString())),
                          DataCell(Text(proveedor['Razon_Social'])),
                          DataCell(Text(proveedor['Telefono'].toString())),
                          DataCell(Text(proveedor['Direccion'])),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
