import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseFirestoreProvider {
  FirebaseFirestore _firebasefirestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot?> getDadosUsuario(String? id) async {
    try {
      return await _firebasefirestore
          .collection('usuários')
          .doc(id)
          .get();
    } on Exception catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
