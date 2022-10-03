import 'dart:convert';

class UserProf {

  int? id;
  String? senha;
  String? nome;
  String? codigo;
  String? email;

  UserProf({
    this.id,
    this.senha,
    this.nome,
    this.codigo,
    this.email,
  });

  UserProf copyWith({
    int? id,
    String? senha,
    String? nome,
    String? codigo,
    String? email,
  }) {
    return UserProf(
      id: id ?? this.id,
      senha: senha ?? this.senha,
      nome: nome ?? this.nome,
      codigo: codigo ?? this.codigo,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    if(id != null){
      result.addAll({'id': id});
    }
    if(senha != null){
      result.addAll({'senha': senha});
    }
    if(nome != null){
      result.addAll({'nome': nome});
    }
    if(codigo != null){
      result.addAll({'codigo': codigo});
    }
    if(email != null){
      result.addAll({'email': email});
    }
  
    return result;
  }

  factory UserProf.fromMap(Map<String, dynamic> map) {
    return UserProf(
      id: map['id']?.toInt(),
      senha: map['senha'],
      nome: map['nome'],
      codigo: map['codigo'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProf.fromJson(String source) => UserProf.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserProf(id: $id, senha: $senha, nome: $nome, codigo: $codigo, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserProf &&
      other.id == id &&
      other.senha == senha &&
      other.nome == nome &&
      other.codigo == codigo &&
      other.email == email;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      senha.hashCode ^
      nome.hashCode ^
      codigo.hashCode ^
      email.hashCode;
  }

  bool isValid(){
    if((senha == null || senha!.isEmpty) && (email == null || email!.isEmpty)){
        throw Exception("Preencha os campos!");
    }
    if(senha == null || senha!.isEmpty){
      throw Exception("Senha não informada.");
    }
    if(email == null || email!.isEmpty){
      throw Exception("Login não informado.");
    }
    return true;
  }
}
