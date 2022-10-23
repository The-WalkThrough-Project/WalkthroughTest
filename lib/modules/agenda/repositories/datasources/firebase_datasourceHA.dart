import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:walkthrough/modules/agenda/models/horario_agendado_model.dart';
import 'package:walkthrough/modules/agenda/repositories/datasources/datasource_ds_agendado.dart';
import 'package:walkthrough/shared/databases/BD.dart';

class FirebaseDataSourceHA extends DataSourceBaseA {
  final FirebaseFirestore _firebasefirestore = FirebaseFirestore.instance;

  @override
  Future<void> alterar(Map<String, dynamic>? horarioAgendado) async {
    QuerySnapshot qs = await _firebasefirestore
        .collection("horáriosAgendados")
        .where("nomeProfessor", isEqualTo: horarioAgendado?['nomeProfessor'])
        .where('lab', isEqualTo: horarioAgendado?['lab'])
        .where('data', isEqualTo: horarioAgendado?['data'])
        .get();

    if (horarioAgendado == null) {
      return null;
    }

    await _firebasefirestore
        .collection("horáriosAgendados")
        .doc(qs.docs.last.id)
        .update(horarioAgendado);
  }

  @override
  Future<bool?> existeHorario(Map<String, dynamic>? horarioAgendado) async{
    String string = horarioAgendado?['data'];
    string = string.substring(0, 10);
    QuerySnapshot qs = await _firebasefirestore
        .collection("horáriosAgendados")
        .where('lab', isEqualTo: horarioAgendado?['lab'])
        .where('data', isEqualTo: string)
        .where('horarioInicial', isEqualTo: horarioAgendado?['horarioInicial'])
        .get();

    if (qs.size == 0) {
      return false;
    }    
    return true;
  }

  @override
  Future<void> excluir(Map<String, dynamic>? horarioAgendado) async {
    QuerySnapshot qs = await _firebasefirestore
        .collection("horáriosAgendados")
        .where("nomeProfessor", isEqualTo: horarioAgendado?['nomeProfessor'])
        .where('lab', isEqualTo: horarioAgendado?['lab'])
        .where('data', isEqualTo: horarioAgendado?['data'])
        .where('horarioInicial', isEqualTo: horarioAgendado?['horarioInicial'])
        .where('isTemp', isEqualTo: horarioAgendado?['isTemp'])
        .get();

    await _firebasefirestore
        .collection("horáriosAgendados")
        .doc(qs.docs.last.id)
        .delete();
  }

  @override
  Future<int> incluir(Map<String, dynamic>? horarioAgendado) async {
    String string = horarioAgendado?['data'];
    string = string.substring(0, 10);
    _firebasefirestore.collection("horáriosAgendados").add({
            'id': horarioAgendado?['id'],
            'data': string,
            'lab': horarioAgendado?['lab'],
            'horarioInicial': horarioAgendado?['horarioInicial'],
            'horarioFinal': horarioAgendado?['horarioFinal'],
            'nomeProfessor': horarioAgendado?['nomeProfessor'],
            'isTemp': horarioAgendado?['isTemp']
          });
    return horarioAgendado?['id'];
  }

  @override
  Future<Map<String, dynamic>?> selecionar(int id) async {}

  @override
  Future<List<Map<String, dynamic>?>?> selecionarTodos() async {
    var qs = await _firebasefirestore
        .collection('horáriosAgendados')
        .get();
        return qs.docs.map((e) => 
        HorarioAgendado(
          id: e.data()['id'],
          nomeProfessor: e.data()['nomeProfessor'], 
          horarioInicial: e.data()['horarioInicial'], 
          horarioFinal: e.data()['horarioFinal'], 
          data: e.data()['data'], 
          lab: e.data()['lab'],
          isTemp: e.data()['isTemp']
          ).toMap()
        ).toList();
  }
  
  @override
  Future<List<Map<String, dynamic>?>?> selecionarTodosTemp() async {
    var qs = await _firebasefirestore
        .collection('horáriosAgendados')
        .get();
        return qs.docs.map((e) => HorarioAgendado(
          id: e.data()['id'],
          nomeProfessor: e.data()['nomeProfessor'], 
          horarioInicial: e.data()['horarioInicial'], 
          horarioFinal: e.data()['horarioFinal'], 
          data: e.data()['data'], 
          lab: e.data()['lab'],
          isTemp: e.data()['isTemp']
          ).toMap()
        ).toList();
  }
}
