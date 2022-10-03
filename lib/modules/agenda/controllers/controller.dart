import 'package:flutter/cupertino.dart';
import 'package:walkthrough/modules/agenda/models/horario_agendado_model.dart';
import 'package:walkthrough/modules/agenda/models/horario_fixo_model.dart';
import 'package:walkthrough/shared/databases/BD.dart';

class HorarioController extends ChangeNotifier{
  
  final nomeProfessor = TextEditingController();
  final nomeDisciplina = TextEditingController();
  final horario = TextEditingController();
  final lab = TextEditingController();
  final diaSemana = TextEditingController();
  final List<HorarioFixo> horariosF = [];

  /*@override
  void dispose() {
    BancoHorarios.instance.close();
    
    super.dispose();
  }*/

  void salvarHorario(
    {required VoidCallback sucesso,
    required VoidCallback? falha(String motivo)}) {
    
    try {
      final horarioF = HorarioFixo(
        nomeProfessor: nomeProfessor.text.trim(),
        nomeDisciplina: nomeDisciplina.text.trim(),
        diaSemana: diaSemana.text.trim(),
        lab: lab.text.trim(),
        horario: horario.text.trim()
      );
      horarioF.isValid();
      BancoHorarios.instance.insertHorarioFixo(horarioF);
      sucesso();

    } catch (e) {
      falha(e.toString());
    }
  }
}