import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:walkthrough/modules/loginProf/models/prof_model.dart';
import 'package:walkthrough/modules/loginProf/repositories/profUser_repository.dart';
import 'package:walkthrough/shared/providers/firebaseAuth_provider.dart';

class NovoLoginController extends ChangeNotifier {
  final nome = TextEditingController();
  final email = TextEditingController();
  final _repository = ProfUserRepository();
  final _firebase_auth = FireBaseAuthProvider();

  atualizaDados(
      {required VoidCallback? sucesso(),
      required VoidCallback? falha(String motivo),
      required UserProf usuario}) async {
    try {
      final user = UserProf(
          nome: nome.text.trim(),
          email: email.text.trim(),
          codigo: usuario.codigo,
          id: usuario.id
      );
      user.isValidUser();

      User? currentUser = await _firebase_auth.getCurrentUser();
      await _repository.alterar(user);
      
      await _firebase_auth.atualizarEmail(currentUser, user.email);

      sucesso();
    } on Exception catch (e) {
      falha(e.toString().substring(11));
    }
  }
}
