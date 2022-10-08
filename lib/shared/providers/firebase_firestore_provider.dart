import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:walkthrough/modules/agenda/repositories/datasources/datasource_ds_fixo.dart';
import 'package:walkthrough/modules/loginProf/models/prof_model.dart';

class FireBaseFirestoreProvider {
  FirebaseFirestore _firebasefirestore = FirebaseFirestore.instance;

  Future<UserProf> getDadosUsuario(String? id) async {
    try {
      var qs = await _firebasefirestore
          .collection('usuários')
          .doc(id)
          .get();
      UserProf user = UserProf.fromMap(qs.data());
      return user;
    } on Exception catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  
  
}
