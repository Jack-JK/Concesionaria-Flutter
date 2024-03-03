import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/compra.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/marca.dart';
import 'package:flutter_application_1/pages/modelo.dart';
import 'package:flutter_application_1/pages/proveedor.dart';
import 'package:flutter_application_1/pages/rol.dart';

class VentaPage extends StatelessWidget {
  const VentaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Ventas de Vehículos'),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Cliente:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    items: const [],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Marca:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    items: const [],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Modelo:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    items: const [],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Buscar Vehículos'),
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Id')),
                        DataColumn(label: Text('Cilindrada')),
                        DataColumn(label: Text('Transmisión')),
                        DataColumn(label: Text('Año')),
                        DataColumn(label: Text('Chasis')),
                        DataColumn(label: Text('Precio')),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('1')),
                          DataCell(Text('2000 cc')),
                          DataCell(Text('Manual')),
                          DataCell(Text('2022')),
                          DataCell(Text('ABC123')),
                          DataCell(Text('\$10,000')),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Detalles de Venta:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  DataTable(
                    columns: const [
                      DataColumn(label: Text('Id Vehículo')),
                      DataColumn(label: Text('Cantidad')),
                      DataColumn(label: Text('Costo')),
                      DataColumn(label: Text('Subtotal')),
                    ],
                    rows: const [],
                    columnSpacing: 20, // Ajusta el espaciado entre columnas
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Fecha:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Razón Social:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(),
                  const SizedBox(height: 16),
                  const Text(
                    'NIT:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(),
                  const SizedBox(height: 16),
                  const Text(
                    'Método de Pago:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    items: const [
                      DropdownMenuItem(value: 'efectivo', child: Text('Efectivo')),
                      DropdownMenuItem(value: 'tarjeta', child: Text('Tarjeta de Crédito/Débito')),
                      DropdownMenuItem(value: 'transferencia', child: Text('Transferencia Bancaria')),
                      DropdownMenuItem(value: 'cheque', child: Text('Cheque')),
                    ],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Guardar Venta'),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Factura', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        const Text('Razon Social:'),
                        const SizedBox(height: 8),
                        const Text('Nit:'),
                        const SizedBox(height: 8),
                        const Text('Fecha:'),
                        const SizedBox(height: 8),
                        const Text('Total:'),
                        const SizedBox(height: 8),
                        const Text('Detalles', style: TextStyle(fontSize: 18)),
                        const SizedBox(height: 8),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Text('Detalle $index');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
