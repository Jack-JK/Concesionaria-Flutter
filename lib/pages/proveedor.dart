import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/marca.dart';
import 'package:flutter_application_1/pages/modelo.dart';
import 'package:flutter_application_1/pages/rol.dart';


class ProveedorPage extends StatelessWidget {
  const ProveedorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                    MaterialPageRoute(builder: (context) => const MarcaPage())
                  );
                },
              ),
              ListTile(
                title: const Text('Venta'),
                onTap: () {
                  // Navegación a Venta
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MarcaPage())
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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Registro de Proveedores',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Razón Social',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Teléfono',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Dirección',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Agregar lógica para guardar proveedor
                    },
                    child: const Text('Guardar'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Agregar lógica para leer proveedor
                    },
                    child: const Text('Leer'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Tabla de Proveedores:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Razón Social')),
                      DataColumn(label: Text('Teléfono')),
                      DataColumn(label: Text('Dirección')),
                    ],
                    rows: const [
                      // Agregar filas dinámicamente
                      DataRow(cells: [
                        DataCell(Text('1')),
                        DataCell(Text('Razón Social 1')),
                        DataCell(Text('Teléfono 1')),
                        DataCell(Text('Dirección 1')),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('2')),
                        DataCell(Text('Razón Social 2')),
                        DataCell(Text('Teléfono 2')),
                        DataCell(Text('Dirección 2')),
                      ]),
                    ],
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
