abstract class DataSourceBaseF{

  Future<void> incluir(Map<String, dynamic> horarioFixo);

  Future<void> excluir(Map<String, dynamic> horarioFixo);

  Future<void> alterar(Map<String, dynamic> horarioFixo);

  Future<Map<String, dynamic>?> selecionar(String lab, String diaSemana, String horario);

  Future<List<Map<String, dynamic>>?> selecionarTodos();
  
}