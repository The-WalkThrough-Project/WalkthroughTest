import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:walkthrough/modules/agenda/models/horario_fixo_model.dart';
import 'package:walkthrough/modules/agenda/repositories/datasources/datasource_ds_fixo.dart';
import 'package:walkthrough/shared/databases/BD.dart';

class FirebaseDataSource extends DataSourceBaseF {
  final FirebaseFirestore _firebasefirestore = FirebaseFirestore.instance;
  final _bancoSQL = BancoHorarios.instance;


  @override
  Future<void> alterar(Map<String, dynamic> horarioFixo) async {
    final doc = _firebasefirestore
        .collection("horáriosFixos")
        .where("diaSemana", isEqualTo: horarioFixo['diaSemana'])
        .where('lab', isEqualTo: horarioFixo['lab'])
        .where('horario', isEqualTo: horarioFixo['horario']).limit(1);
  }

  @override
  Future<void> excluir(Map<String, dynamic> horarioFixo) async {}

  @override
  Future<void> incluir(Map<String, dynamic> horarioFixo) async {
    String? horarioUid;
    _firebasefirestore.collection("horáriosFixos").add({
      'diaSemana': horarioFixo['diaSemana'],
      'lab': horarioFixo['lab'],
      'horario': horarioFixo['horario'],
      'nomeDisciplina': horarioFixo['nomeDisciplina'],
      'nomeProfessor': horarioFixo['nomeProfessor'],
    }).then((value) => horarioUid = value.id);
    horarioFixo.update('uid', (value) => horarioUid);
    await _bancoSQL.insertHorarioFixo(HorarioFixo.fromMap(horarioFixo));
  }

  @override
  Future<Map<String, dynamic>?> selecionar(
      String lab, String diaSemana, String horario) async {}

  @override
  Future<List<Map<String, dynamic>>?> selecionarTodos() async {}
  
  @override
  Future<Query<Map<String, dynamic>>?> selecionarTodosPLab(String lab) async {
    return _firebasefirestore.collection("horáriosFixos").where('lab', isEqualTo: lab);
  }
}
