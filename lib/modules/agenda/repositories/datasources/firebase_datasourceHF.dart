import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:walkthrough/modules/agenda/repositories/datasources/datasource_ds_fixo.dart';
import 'package:walkthrough/shared/databases/BD.dart';
import 'package:walkthrough/shared/providers/horario_agendado_to_fixo.dart';

class FirebaseDataSource extends DataSourceBaseF {
  final FirebaseFirestore _firebasefirestore = FirebaseFirestore.instance;
  final _bancoSQL = BancoHorarios.instance;

  @override
  Future<bool?> existeHorario(Map<String, dynamic>? horarioAgendado, String dia) async{
    String horarioInicialF = horarioAtoF(horarioAgendado?['horarioInicial']);
    QuerySnapshot qs = await _firebasefirestore
        .collection("horáriosFixos")
        .where('lab', isEqualTo: horarioAgendado?['lab'])
        .where('diaSemana', isEqualTo: dia)
        .where('horario', isEqualTo: horarioInicialF)
        .get();

    if (qs.size == 0) {
      return false;
    }    
    return true;
  }

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
  Future<void> incluir(Map<String, dynamic> horarioFixo) async {
    QuerySnapshot qs = await _firebasefirestore
        .collection("horáriosFixos")
        .where('diaSemana', isEqualTo: horarioFixo['diaSemana'])
        .where('lab', isEqualTo: horarioFixo['lab'])
        .where('horario', isEqualTo: horarioFixo['horario']).get();

    qs.docs.length > 0 ? _firebasefirestore
        .collection("horáriosFixos")
        .doc(qs.docs.last.id)
        .update(horarioFixo) :
    _firebasefirestore.collection("horáriosFixos").add({
      'diaSemana': horarioFixo['diaSemana'],
      'lab': horarioFixo['lab'],
      'horario': horarioFixo['horario'],
      'nomeDisciplina': horarioFixo['nomeDisciplina'],
      'nomeProfessor': horarioFixo['nomeProfessor'],
    });
  }

  @override
  Future<Map<String, dynamic>?> selecionar(
      String lab, String diaSemana, String horario) async {}

  @override
  Future<List<Map<String, dynamic>>?> selecionarTodos() async {}

  @override
  Future<Query<Map<String, dynamic>>> selecionarTodosPLab(String lab) async {
    return await _firebasefirestore.collection("horáriosFixos").where('lab', isEqualTo: lab);
  }
}
