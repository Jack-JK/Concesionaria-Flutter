import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<int> _inicializarContador(String coleccion) async {
    DocumentReference contadorRef = _db.collection("Contador").doc(coleccion);

    DocumentSnapshot doc = await contadorRef.get();
    if (!doc.exists) {
      await contadorRef.set({'valor': 0});
      return 1;
    } else {
      return (doc.data() as Map<String, dynamic>?)?['valor'] ?? 0;
    }
  }

  static Future<int> _asignarID(String coleccion) async {
    int valorActual = await _inicializarContador(coleccion);
    int nuevoID = valorActual + 1;

    DocumentReference contadorRef = _db.collection("Contador").doc(coleccion);
    await _db.runTransaction((transaction) async {
      await transaction.get(contadorRef);
      transaction.update(contadorRef, {'valor': nuevoID});
    });

    return nuevoID;
  }

  static Future<void> guardar(String coleccion, Map<String, dynamic> datos) async {
    int nuevoID = await _asignarID(coleccion);

    await _db.collection(coleccion).doc(nuevoID.toString()).set({
      'id': nuevoID,
      ...datos,
    });
  }


  //TABLA MARCA  
  static Future<void> guardarMarca(String marca) async {
    await guardar('Marca', {'Marca': marca});
  }

  static Future<List<Map<String, dynamic>>> leerMarcas() async {
    QuerySnapshot querySnapshot = await _db.collection('Marca').get();

    return querySnapshot.docs.map((doc) {
      return {
        'ID': doc.id,
        'Marca': doc['Marca'],
      };
    }).toList();
  }

  // TABLA MODELO
  static Future<void> guardarModelo(String modelo, String idMarca) async {
    await guardar('Modelo', {
      'Modelo': modelo,
      'Id_Marca': _db.collection('Marca').doc(idMarca), // Guardar la referencia a la marca
    });
  }

  // TABLA MODELO
  static Future<List<Map<String, dynamic>>> leerModelos() async {
    QuerySnapshot querySnapshot = await _db.collection('Modelo').get();

    return Future.wait(querySnapshot.docs.map((doc) async {
      DocumentSnapshot marcaDoc = await doc['Id_Marca'].get();
      String marca = marcaDoc['Marca'];

      return {
        'ID': doc.id,
        'Modelo': doc['Modelo'],
        'Marca': marca,
      };
    }).toList());
  }
  //Leer modelo para venta y compra
  static Future<List<Map<String, dynamic>>> leerModelos2(String idMarca) async {
    QuerySnapshot querySnapshot = await _db
        .collection('Modelo')
        .where('Id_Marca', isEqualTo: _db.collection('Marca').doc(idMarca))
        .get();

    return querySnapshot.docs.map((doc) {
      return {
        'ID': doc.id,
        'Modelo': doc['Modelo'],
      };
    }).toList();
  }

  // TABLA PROVEEDOR
  static Future<void> guardarProveedor(String razonSocial, int telefono, String direccion) async {
    int nuevoID = await _asignarID('Proveedor');

    await _db.collection('Proveedor').doc(nuevoID.toString()).set({
      'Razon_Social': razonSocial,
      'Telefono': telefono,
      'Direccion': direccion,
    });
  }

  static Future<List<Map<String, dynamic>>> leerProveedores() async {
    QuerySnapshot querySnapshot = await _db.collection('Proveedor').get();

    return querySnapshot.docs.map((doc) {
      return {
        'ID': doc.id,
        'Razon_Social': doc['Razon_Social'],
        'Telefono': doc['Telefono'],
        'Direccion': doc['Direccion'],
      };
    }).toList();
  }

  //CLIENTES
  static Future<List<Map<String, dynamic>>> leerClientes() async {
    QuerySnapshot querySnapshot = await _db.collection('Cliente').get();

    return querySnapshot.docs.map((doc) {
      return {
        'ID': doc.id,
        'Nombre': doc['Nombre'],
        'Apellido': doc['Apellido'],
        'CI': doc['CI'],
        'Fecha_Nacimiento': doc['Fecha_Nacimiento'],
        'Estado': doc['Estado'],
        'Telefono': doc['Telefono'],
      };
    }).toList();
  }

  // TABLA VEHICULOS
  static Future<List<Map<String, dynamic>>> leerVehiculosPorModeloEstado(String idModelo) async {
    QuerySnapshot querySnapshot = await _db
        .collection('Vehiculo')
        .where('Id_Modelo', isEqualTo: _db.collection('Modelo').doc(idModelo))
        .where('Estado', isEqualTo: true)
        .get();

    return querySnapshot.docs.map((doc) {
      return {
        'ID': doc.id,
        'Anio': doc['Anio'],
        'Chasis': doc['Chasis'],
        'Cilindrada': doc['Cilindrada'],
        'Precio': doc['Precio'],
        'Transmision': doc['Transmision'],
      };
    }).toList();
  }

  static Future<int> guardarV(String coleccion, Map<String, dynamic> datos) async {
    int nuevoID = await _asignarID(coleccion);

    await _db.collection(coleccion).doc(nuevoID.toString()).set({
      'id': nuevoID,
      ...datos,
    });

    return nuevoID;
  }

  static Future<void> actualizarEstadoVehiculo(String idVehiculo, bool nuevoEstado) async {
    await FirebaseFirestore.instance
        .collection('Vehiculo')
        .doc(idVehiculo)
        .update({'Estado': nuevoEstado});
  }

}

