import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:intl/locale.dart';

class HorarioAgendado {

  final String nomeProfessor;
  final String horarioInicial;
  final String horarioFinal;
  final String data;
  final String lab;

  HorarioAgendado({
    required this.nomeProfessor,
    required this.horarioInicial,
    required this.horarioFinal,
    required this.data,
    required this.lab,
  });



  HorarioAgendado copyWith({
    String? nomeProfessor,
    String? horarioInicial,
    String? horarioFinal,
    String? data,
    String? lab,
  }) {
    return HorarioAgendado(
      nomeProfessor: nomeProfessor ?? this.nomeProfessor,
      horarioInicial: horarioInicial ?? this.horarioInicial,
      horarioFinal: horarioFinal ?? this.horarioFinal,
      data: data ?? this.data,
      lab: lab ?? this.lab,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'nomeProfessor': nomeProfessor});
    result.addAll({'horarioInicial': horarioInicial});
    result.addAll({'horarioFinal': horarioFinal});
    result.addAll({'data': data});
    result.addAll({'lab': lab});
  
    return result;
  }

  factory HorarioAgendado.fromMap(Map<String, dynamic> map) {
    return HorarioAgendado(
      nomeProfessor: map['nomeProfessor'] ?? '',
      horarioInicial: map['horarioInicial'] ?? '',
      horarioFinal: map['horarioFinal'] ?? '',
      data: map['data'] ?? '',
      lab: map['lab'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory HorarioAgendado.fromJson(String source) => HorarioAgendado.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HorarioAgendado(nomeProfessor: $nomeProfessor, horarioInicial: $horarioInicial, horarioFinal: $horarioFinal, data: $data, lab: $lab)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HorarioAgendado &&
      other.nomeProfessor == nomeProfessor &&
      other.horarioInicial == horarioInicial &&
      other.horarioFinal == horarioFinal &&
      other.data == data &&
      other.lab == lab;
  }

  @override
  int get hashCode {
    return nomeProfessor.hashCode ^
      horarioInicial.hashCode ^
      horarioFinal.hashCode ^
      data.hashCode ^
      lab.hashCode;
  }

  bool isValid(){
    if(nomeProfessor.isEmpty){
      throw Exception("Nome do professor não informado.");
    }
    if(horarioInicial.isEmpty){
      throw Exception("Horário de início não informado.");
    }
    if(horarioFinal.isEmpty){
      throw Exception("Horário de fim não informado.");
    }
    if(lab.isEmpty){
      throw Exception("Laboratório não informado.");
    }
    return true;
  }
}
