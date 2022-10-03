import 'dart:convert';

class HorarioAgendado {

  final int? id;
  final String? nomeProfessor;
  final String? horarioInicio;
  final String? horarioFim;
  final String? data;
  final String? lab;

  HorarioAgendado({
    this.id,
    this.nomeProfessor,
    this.horarioInicio,
    this.horarioFim,
    this.data,
    this.lab,
  });


  HorarioAgendado copyWith({
    int? id,
    String? nomeProfessor,
    String? horarioInicio,
    String? horarioFim,
    String? data,
    String? lab,
  }) {
    return HorarioAgendado(
      id: id ?? this.id,
      nomeProfessor: nomeProfessor ?? this.nomeProfessor,
      horarioInicio: horarioInicio ?? this.horarioInicio,
      horarioFim: horarioFim ?? this.horarioFim,
      data: data ?? this.data,
      lab: lab ?? this.lab,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(nomeProfessor != null){
      result.addAll({'nomeProfessor': nomeProfessor});
    }
    if(horarioInicio != null){
      result.addAll({'horarioInicio': horarioInicio});
    }
    if(horarioFim != null){
      result.addAll({'horarioFim': horarioFim});
    }
    if(data != null){
      result.addAll({'data': data});
    }
    if(lab != null){
      result.addAll({'lab': lab});
    }
  
    return result;
  }

  factory HorarioAgendado.fromMap(Map<String, dynamic> map) {
    return HorarioAgendado(
      id: map['id']?.toInt(),
      nomeProfessor: map['nomeProfessor'],
      horarioInicio: map['horarioInicio'],
      horarioFim: map['horarioFim'],
      data: map['data'],
      lab: map['lab'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HorarioAgendado.fromJson(String source) => HorarioAgendado.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HorarioAgendado(id: $id, nomeProfessor: $nomeProfessor, horarioInicio: $horarioInicio, horarioFim: $horarioFim, data: $data, lab: $lab)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is HorarioAgendado &&
      other.id == id &&
      other.nomeProfessor == nomeProfessor &&
      other.horarioInicio == horarioInicio &&
      other.horarioFim == horarioFim &&
      other.data == data &&
      other.lab == lab;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nomeProfessor.hashCode ^
      horarioInicio.hashCode ^
      horarioFim.hashCode ^
      data.hashCode ^
      lab.hashCode;
  }

  bool isValid(){
    if(nomeProfessor == null || nomeProfessor!.isEmpty){
      throw Exception("Nome do professor não informado.");
    }
    if(horarioInicio == null || horarioInicio!.isEmpty){
      throw Exception("Horário de início não informado.");
    }
    if(horarioFim == null || horarioFim!.isEmpty){
      throw Exception("Horário de fim não informado.");
    }
    if(data == null || data!.isEmpty){
      throw Exception("Data não informada.");
    }
    if(lab == null || lab!.isEmpty){
      throw Exception("Laboratório não informado.");
    }
    return true;
  }
}
