import 'package:flutter/cupertino.dart';
import 'package:walkthrough/modules/agenda/models/horario_agendado_model.dart';
import 'package:walkthrough/modules/agenda/models/horario_fixo_model.dart';
import 'package:walkthrough/modules/agenda/repositories/horario_agendado_repository.dart';
import 'package:walkthrough/modules/agenda/repositories/horario_fixo_repository.dart';
import 'package:walkthrough/shared/databases/BD.dart';

class HorariosAgendadosController extends ChangeNotifier {
  final horarioInicial = TextEditingController();
  final horarioFinal = TextEditingController();
  final nomeProfessor = TextEditingController();
  final lab = TextEditingController();
  final _repositoryA = HorarioAgendadoRepository();

  Future<Map<String, List<HorarioAgendado>>?> getHorariosA() async {
    var horarios = await _repositoryA.selecionarTodos();
    print('horarios map: ' + horarios.toString());
    return horarios;
  }

  void cadastraHorarios(HorarioAgendado horarioAgendado){
    _repositoryA.incluir(horarioAgendado);
  }
}
