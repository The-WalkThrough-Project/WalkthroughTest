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

  String? horarioIsValid(HorarioAgendado horarioAgendado){
    if((int.parse(horarioAgendado.horarioInicial.substring(0, 2)) >= 7 && int.parse(horarioAgendado.horarioInicial.substring(0, 2)) <= 22) && (int.parse(horarioAgendado.horarioFinal.substring(0, 2)) >= 7 && int.parse(horarioAgendado.horarioFinal.substring(0, 2)) <= 22)){
       
    } else {
      return 'Favor inserir um horário entre 07:00 e 22:35!';
    } 
    if ((int.parse(horarioAgendado.horarioInicial.substring(0, 2)) == 22)) {
      if (int.parse(horarioAgendado.horarioInicial.substring(3)) <= 35) {
        
      } else {
        return 'Favor inserir um horário entre 07:00 e 22:35!';
      } 
    } 
    if (int.parse(horarioAgendado.horarioFinal.substring(0, 2)) == 22) {
      if (int.parse(horarioAgendado.horarioFinal.substring(3)) <= 35) {
          
      } else {
        return 'Favor inserir um horário entre 07:00 e 22:35!';
      } 
    } 
    if(int.parse(horarioAgendado.horarioInicial.substring(0, 2)) <= int.parse(horarioAgendado.horarioFinal.substring(0, 2))){
      if(int.parse(horarioAgendado.horarioInicial.substring(0, 2)) == int.parse(horarioAgendado.horarioFinal.substring(0, 2))){
        if(int.parse(horarioAgendado.horarioInicial.substring(3)) >= int.parse(horarioAgendado.horarioFinal.substring(3))){
          return 'Favor inserir um horário final posterior ao horário inicial!';
        }
      }
    } else {
      return 'Favor inserir um horário final posterior ao horário inicial!';
    }

    if (int.parse(horarioAgendado.horarioFinal.substring(0, 2)) - int.parse(horarioAgendado.horarioInicial.substring(0, 2)) == 0) {
      if (int.parse(horarioAgendado.horarioFinal.substring(3)) - int.parse(horarioAgendado.horarioInicial.substring(3)) < 50) {
        return 'Favor inserir um horário de 50min a 1h40min!';
      }
    } else if (int.parse(horarioAgendado.horarioFinal.substring(0, 2)) - int.parse(horarioAgendado.horarioInicial.substring(0, 2)) == 1) {
      if ((60 - int.parse(horarioAgendado.horarioInicial.substring(3))) + int.parse(horarioAgendado.horarioFinal.substring(3)) < 50) {
        return 'Favor inserir um horário de 50min a 1h40min!';
      } else if ((60 - int.parse(horarioAgendado.horarioInicial.substring(3))) + int.parse(horarioAgendado.horarioFinal.substring(3)) > 100) {
        return 'Favor inserir um horário de 50min a 1h40min!';
      }
    } else if (int.parse(horarioAgendado.horarioFinal.substring(0, 2)) - int.parse(horarioAgendado.horarioInicial.substring(0, 2)) >= 2) {
      if ((60 - int.parse(horarioAgendado.horarioInicial.substring(3))) + int.parse(horarioAgendado.horarioFinal.substring(3)) + 60 > 100) {
        return 'Favor inserir um horário de 50min a 1h40min!';
      }
    }
    
  }

  void cadastraHorarios(HorarioAgendado horarioAgendado){
    _repositoryA.incluir(horarioAgendado);
  }

  existeHorario(HorarioAgendado horarioAgendado) async{
    return await _repositoryA.selecionarTodosDiaLab(horarioAgendado.toMap());
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
