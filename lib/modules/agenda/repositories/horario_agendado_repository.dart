import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:walkthrough/modules/agenda/models/horario_agendado_model.dart';
import 'package:walkthrough/modules/agenda/repositories/datasources/datasource_ds_agendado.dart';
import 'package:walkthrough/modules/agenda/repositories/datasources/firebase_datasourceHA.dart';

class HorarioAgendadoRepository{

  final DataSourceBaseA? _db = FirebaseDataSourceHA();

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

  Future<HorarioAgendado?> selecionar(String data, String horarioInicio, String lab) async{
    final map = await _db!.selecionar(data, horarioInicio, lab);
    if(map == null){
      return null;
    }
    return HorarioAgendado.fromMap(map);
  }

  /*Future<Map<DateTime, List<HorarioAgendado>>?> selecionarTodos(DateTime diaSelecionado) async{
    final maps = await _db!.selecionarTodos();
    print('maps: ' + maps.toString());
    var lista = <HorarioAgendado>[];
    Map<DateTime, List<HorarioAgendado>> retorno = {};
    if(maps == null){
      return null;
    }
    for (var map in maps) {
      var horarioAgendado = HorarioAgendado.fromMap(map);
      (horarioAgendado.data + '.000Z') == diaSelecionado.toString() ? lista.add(horarioAgendado) : null;
    }
    retorno.addAll({diaSelecionado: lista});
    print('retorno map: ' + retorno.toString());
    
    return retorno;
  }*/

  Future<Map<String, List<HorarioAgendado>>?> selecionarTodos() async{
    final maps = await _db!.selecionarTodos();
    print('maps: ' + maps.toString());
    var lista = <HorarioAgendado>[];
    Map<String, List<HorarioAgendado>> retorno = {};
    if(maps == null){
      return null;
    }
    for (var map in maps) {
      var horarioAgendado = HorarioAgendado.fromMap(map);
      lista.add(horarioAgendado);
    }

    print(lista.toString());

    for (var item in lista) {
      if(!retorno.containsKey(item.data)) {
        retorno.addAll({item.data: [item]});
      } else {
        List<HorarioAgendado>? lista2 = <HorarioAgendado>[];
        lista2 = retorno.containsKey(item.data) ? retorno[item.data] : [];
        lista2!.add(item);
        retorno.addAll({item.data: lista2});
      }
    }
    
    print('retorno map: ' + retorno.toString());
    
    return retorno;
  }
}