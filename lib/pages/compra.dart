import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/marca.dart';
import 'package:flutter_application_1/pages/modelo.dart';
import 'package:flutter_application_1/pages/proveedor.dart';
import 'package:flutter_application_1/pages/rol.dart';
import 'package:flutter_application_1/pages/venta.dart';

class CompraPage extends StatelessWidget {
  const CompraPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Compras de Vehículos'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Fecha:',
                style: TextStyle(fontSize: 16),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Proveedor:',
                style: TextStyle(fontSize: 16),
              ),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: '1', child: Text('Proveedor 1')),
                  DropdownMenuItem(value: '2', child: Text('Proveedor 2')),
                  DropdownMenuItem(value: '3', child: Text('Proveedor 3')),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              const Text(
                'Marca:',
                style: TextStyle(fontSize: 16),
              ),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: '1', child: Text('Marca 1')),
                  DropdownMenuItem(value: '2', child: Text('Marca 2')),
                  DropdownMenuItem(value: '3', child: Text('Marca 3')),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              const Text(
                'Modelo:',
                style: TextStyle(fontSize: 16),
              ),
              DropdownButtonFormField<String>(
                items: const [
                  DropdownMenuItem(value: '1', child: Text('Modelo 1')),
                  DropdownMenuItem(value: '2', child: Text('Modelo 2')),
                  DropdownMenuItem(value: '3', child: Text('Modelo 3')),
                ],
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              const Text(
                'Detalles de Vehículo:',
                style: TextStyle(fontSize: 16),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Cilindrada',
                  border: OutlineInputBorder(),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Transmisión',
                  border: OutlineInputBorder(),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Año',
                  border: OutlineInputBorder(),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Chasis',
                  border: OutlineInputBorder(),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Precio',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic to add vehicle details
                },
                child: const Text('Agregar Vehículo'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Detalles de Compra:',
                style: TextStyle(fontSize: 16),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Año')),
                    DataColumn(label: Text('Chasis')),
                    DataColumn(label: Text('Cilindrada')),
                    DataColumn(label: Text('Transmisión')),
                    DataColumn(label: Text('Precio')),
                    DataColumn(label: Text('Modelo')),
                    DataColumn(label: Text('Cantidad')),
                    DataColumn(label: Text('Costo')),
                    DataColumn(label: Text('Subtotal')),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text('2022')),
                      DataCell(Text('ABC123')),
                      DataCell(Text('2000 cc')),
                      DataCell(Text('Manual')),
                      DataCell(Text('\$10,000')),
                      DataCell(Text('Modelo 1')),
                      DataCell(Text('1')),
                      DataCell(Text('\$10,000')),
                      DataCell(Text('\$10,000')),
                    ]),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Glosa:',
                style: TextStyle(fontSize: 16),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Total:',
                style: TextStyle(fontSize: 16),
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic to save the purchase
                },
                child: const Text('Guardar Compra'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
