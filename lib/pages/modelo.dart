import 'package:flutter/material.dart';


class ModeloPage extends StatelessWidget {
  const ModeloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Modelo'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Marca'),
              onTap: () {
                // Add navigation logic here
              },
            ),
            ListTile(
              title: const Text('Modelo'),
              onTap: () {
                // Add navigation logic here
              },
            ),
            ListTile(
              title: const Text('Proveedor'),
              onTap: () {
                // Add navigation logic here
              },
            ),
            ListTile(
              title: const Text('Compra'),
              onTap: () {
                // Add navigation logic here
              },
            ),
            ListTile(
              title: const Text('Venta'),
              onTap: () {
                // Add navigation logic here
              },
            ),
            ListTile(
              title: const Text('Rol'),
              onTap: () {
                // Add navigation logic here
              },
            ),
            ListTile(
              title: const Text('Cerrar sesión'),
              onTap: () {
                // Add logout logic here
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
                  labelText: 'ID',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Modelo',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Marca',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add logic to save modelo
                },
                child: const Text('Guardar'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Tabla de Modelos:',
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
                    DataColumn(label: Text('Modelo')),
                    DataColumn(label: Text('Marca')),
                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('1')),
                        DataCell(Text('Modelo 1')),
                        DataCell(Text('Marca 1')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('2')),
                        DataCell(Text('Modelo 2')),
                        DataCell(Text('Marca 2')),
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
