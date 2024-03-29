import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/compra.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/marca.dart';
import 'package:flutter_application_1/pages/modelo.dart';
import 'package:flutter_application_1/pages/proveedor.dart';
import 'package:flutter_application_1/pages/venta.dart';


class RolPage extends StatelessWidget {
  const RolPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Rol'),
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre del Rol',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic to save rol
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save),
                    SizedBox(width: 5),
                    Text('Guardar Rol'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add logic to save rol
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.read_more),
                    SizedBox(width: 5),
                    Text('Leer Rol'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Tabla de Roles:',
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
                    DataColumn(label: Text('Nombre del Rol')),
                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('1')),
                        DataCell(Text('Rol 1')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('2')),
                        DataCell(Text('Rol 2')),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
