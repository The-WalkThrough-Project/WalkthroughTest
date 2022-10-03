abstract class DataSourceBaseA{

  Future<void> incluir(Map<String, dynamic> horarioFixo);

  Future<void> excluir(Map<String, dynamic> horarioFixo);

  Future<void> alterar(Map<String, dynamic> horarioFixo);

  Future<Map<String, dynamic>> selecionar(String data, String horarioInicio, String lab);

  Future<List<Map<String, dynamic>>> selecionarTodos();
  
}