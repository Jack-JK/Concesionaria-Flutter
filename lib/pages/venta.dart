import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/pages/compra.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/marca.dart';
import 'package:flutter_application_1/pages/modelo.dart';
import 'package:flutter_application_1/pages/proveedor.dart';
import 'package:flutter_application_1/pages/rol.dart';
import 'package:flutter_application_1/service/firebase_service.dart';

class VentaPage extends StatefulWidget {
  const VentaPage({Key? key}) : super(key: key);

  @override
  State<VentaPage> createState() => _VentaPageState();
}

class _VentaPageState extends State<VentaPage> {
  List<Map<String, dynamic>> _clientes = [];
  List<Map<String, dynamic>> _marcas= [];
  List<Map<String, dynamic>> _modelos= [];
  List<Map<String, dynamic>> _vehiculos = [];
  List<Map<String, dynamic>> _detalleVenta = [];
  String? _selectedMarca;
  String? _selectedModelo;

  @override
  void initState() {
    super.initState();
    _cargarClientes();
    _cargarMarcas();
  }

  void _cargarClientes() {
    FirebaseService.leerClientes().then((clientes) {
      setState(() {
        _clientes = clientes;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Error al cargar clientes: $error');
      }
    });
  }

  void _cargarMarcas() {
    FirebaseService.leerMarcas().then((marcas) {
      setState(() {
        _marcas = marcas;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Error al cargar marcas: $error');
      }
    });
  }

  void _cargarModelos(String idMarca) {
    FirebaseService.leerModelos2(idMarca).then((modelos) {
      setState(() {
        _modelos = modelos;
        _selectedModelo = null;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Error al cargar modelos: $error');
      }
    });
  }

  void _cargarVehiculos() {
    if (_selectedModelo == null) {
      return;
    }

    FirebaseService.leerVehiculosPorModeloEstado(_selectedModelo!).then((vehiculos) {
      setState(() {
        _vehiculos = vehiculos;
      });
    }).catchError((error) {
      if (kDebugMode) {
        print('Error al cargar vehículos: $error');
      }
    });
  }


  void _agregarDetalleVenta(Map<String, dynamic> vehiculo) {
    double costo = double.parse(vehiculo['Precio'].toString());
    double subtotal = 1 * costo;

    setState(() {
      _detalleVenta.add({
        'Id_Vehiculo': vehiculo['ID'],
        'Cantidad': 1,
        'Costo': costo,
        'Subtotal': subtotal,
      });
    });
  }

  void _guardarVenta() {
    // Lógica para guardar la venta en Firebase
  }

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
        child: Padding(
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
                items: _clientes.map((cliente) {
                  return DropdownMenuItem<String>(
                    value: cliente['ID'].toString(), // Asegúrate de convertir el ID a String si no lo es
                    child: Text('${cliente['Nombre']} ${cliente['Apellido']}'),
                  );
                }).toList(),
                onChanged: (value) {
                  // Aquí puedes usar el valor seleccionado
                  if (kDebugMode) {
                    print(value);
                  }
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Marca:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedMarca, // Valor seleccionado de la marca
                items: _marcas.map((marca) {
                  return DropdownMenuItem<String>(
                    value: marca['ID'].toString(),
                    child: Text(marca['Marca']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedMarca = value!;
                  });
                  _cargarModelos(value!); // Cargar modelos al seleccionar una marca
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Modelo:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _selectedModelo, // Valor seleccionado del modelo
                items: _modelos.map((modelo) {
                  return DropdownMenuItem<String>(
                    value: modelo['ID'].toString(),
                    child: Text(modelo['Modelo']),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedModelo = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_selectedMarca != null && _selectedModelo != null) {
                    _cargarVehiculos();
                  }
                },
                child: const Text('Buscar Vehículos'),
              ),
              const SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Cilindrada')),
                    DataColumn(label: Text('Transmisión')),
                    DataColumn(label: Text('Año')),
                    DataColumn(label: Text('Chasis')),
                    DataColumn(label: Text('Precio')),
                    DataColumn(label: Text('Acciones')),
                  ],
                  rows: _vehiculos.map((vehiculo) {
                    return DataRow(
                      cells: [
                        DataCell(Text(vehiculo['ID'].toString())),
                        DataCell(Text(vehiculo['Cilindrada'])),
                        DataCell(Text(vehiculo['Transmision'])),
                        DataCell(Text(vehiculo['Anio'].toString())),
                        DataCell(Text(vehiculo['Chasis'])),
                        DataCell(Text('\$${vehiculo['Precio']}')),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              _agregarDetalleVenta(vehiculo);
                            },
                            child: const Text('Agregar'),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
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
                rows: _detalleVenta.map((detalle) {
                  return DataRow(
                    cells: [
                      DataCell(Text(detalle['Id_Vehiculo'].toString())),
                      DataCell(Text(detalle['Cantidad'].toString())),
                      DataCell(Text('\$${detalle['Costo']}')),
                      DataCell(Text('\$${detalle['Subtotal']}')),
                    ],
                  );
                }).toList(),
                columnSpacing: 20,
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
                onPressed: _guardarVenta,
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
                      itemCount: _detalleVenta.length,
                      itemBuilder: (context, index) {
                        final detalle = _detalleVenta[index];
                        return Text('Id Vehículo: ${detalle['Id_Vehiculo']}, Cantidad: ${detalle['Cantidad']}, Costo: ${detalle['Costo']}, Subtotal: ${detalle['Subtotal']}');
                      },
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