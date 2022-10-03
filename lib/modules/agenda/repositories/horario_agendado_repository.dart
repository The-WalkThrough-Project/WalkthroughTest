import 'package:walkthrough/modules/agenda/models/horario_agendado_model.dart';
import 'package:walkthrough/modules/agenda/repositories/datasources/datasource_ds_agendado.dart';

class HorarioAgendadoRepository{

  final DataSourceBaseA? _db = null;

  Future<void> incluir(HorarioAgendado horarioAgendado) async{
    //Validações
    horarioAgendado.isValid();
    //Persistência
    _db!.incluir(horarioAgendado.toMap());
  }

  Future<void> excluir(HorarioAgendado horarioAgendado) async{
    _db!.excluir(horarioAgendado.toMap());
  }

  Future<void> alterar(HorarioAgendado horarioAgendado) async{
    horarioAgendado.isValid();
    _db!.alterar(horarioAgendado.toMap());
  }

  Future<HorarioAgendado> selecionar(String data, String horarioInicio, String lab) async{
    final map = await _db!.selecionar(data, horarioInicio, lab);
  
    return HorarioAgendado.fromMap(map);
  }

  Future<List<HorarioAgendado>> selecionarTodos() async{
    final maps = await _db!.selecionarTodos();
    var retorno = <HorarioAgendado>[];
    for (var map in maps) {
      final horarioAgendado = HorarioAgendado.fromMap(map);
      retorno.add(horarioAgendado);
    }
    
    return retorno;
  }
}