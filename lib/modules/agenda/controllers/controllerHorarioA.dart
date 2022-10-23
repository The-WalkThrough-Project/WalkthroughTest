import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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

  Future<ValueNotifier<Map<String, List<HorarioAgendado>>?>> getHorariosA() async {
    var horarios = await _repositoryA.selecionarTodos();
    print('horarios map: ' + horarios.toString());
    return horarios;
  }

  void cadastraHorarios(HorarioAgendado horarioAgendado){
    _repositoryA.incluir(horarioAgendado);
  }

  Future<List<HorarioAgendado>?> getHorariosATemp() async {
    var horarios = await _repositoryA.selecionarTodosTemp();
    
    print('horarios map temp: ' + horarios.toString());
    return horarios;
  }

  excluirHorarioTemp(HorarioAgendado? horarioAgendado) async {
    _repositoryA.excluir(horarioAgendado);
  }

  atualizarHorarioTemp(HorarioAgendado? horarioAgendado) async {
    if (horarioAgendado == null) {
      return null;
    }
    _repositoryA.alterar(horarioAgendado);
  }
}
