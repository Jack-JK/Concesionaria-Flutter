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
      DocumentSnapshot doc = await transaction.get(contadorRef);
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

  static Future<void> guardarMarca(String marca) async {
    await guardar('Marca', {'Marca': marca});
  }
}