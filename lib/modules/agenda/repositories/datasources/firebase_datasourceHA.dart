import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:walkthrough/modules/agenda/models/horario_agendado_model.dart';
import 'package:walkthrough/modules/agenda/repositories/datasources/datasource_ds_agendado.dart';
import 'package:walkthrough/shared/databases/BD.dart';

class FirebaseDataSourceHA extends DataSourceBaseA {
  final FirebaseFirestore _firebasefirestore = FirebaseFirestore.instance;
  final _bancoSQL = BancoHorarios.instance;

  @override
  Future<void> alterar(Map<String, dynamic> horarioFixo) async {
    QuerySnapshot qs = await _firebasefirestore
        .collection("horáriosFixos")
        .where("diaSemana", isEqualTo: horarioFixo['diaSemana'])
        .where('lab', isEqualTo: horarioFixo['lab'])
        .where('horario', isEqualTo: horarioFixo['horario'])
        .get();

    await _firebasefirestore
        .collection("horáriosFixos")
        .doc(qs.docs.last.id)
        .update(horarioFixo);
  }

  @override
  Future<void> excluir(Map<String, dynamic> horarioFixo) async {
    QuerySnapshot qs = await _firebasefirestore
        .collection("horáriosFixos")
        .where("diaSemana", isEqualTo: horarioFixo['diaSemana'])
        .where('lab', isEqualTo: horarioFixo['lab'])
        .where('horario', isEqualTo: horarioFixo['horario'])
        .get();

    await _firebasefirestore
        .collection("horáriosFixos")
        .doc(qs.docs.last.id)
        .delete();
  }

  @override
  Future<void> incluir(Map<String, dynamic> horarioAgendado) async {
    String string = horarioAgendado['data'];
    string = string.substring(0, 10);
    _firebasefirestore.collection("horáriosAgendados").add({
            'data': string,
            'lab': horarioAgendado['lab'],
            'horarioInicial': horarioAgendado['horarioInicial'],
            'horarioFinal': horarioAgendado['horarioFinal'],
            'nomeProfessor': horarioAgendado['nomeProfessor'],
          });
  }

  @override
  Future<Map<String, dynamic>?> selecionar(
      String lab, String diaSemana, String horario) async {}

  @override
  Future<List<Map<String, dynamic>>?> selecionarTodos() async {
    var qs = await _firebasefirestore
        .collection('horáriosAgendados')
        .get();
        return qs.docs.map((e) => HorarioAgendado(
          nomeProfessor: e.data()['nomeProfessor'], 
          horarioInicial: e.data()['horarioInicial'], 
          horarioFinal: e.data()['horarioFinal'], 
          data: e.data()['data'], 
          lab: e.data()['lab']).toMap()
        ).toList();
  }
}
