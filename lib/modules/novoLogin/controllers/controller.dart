import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:walkthrough/modules/loginProf/controllers/controller.dart';
import 'package:walkthrough/modules/loginProf/models/prof_model.dart';
import 'package:walkthrough/modules/loginProf/repositories/profUser_repository.dart';
import 'package:walkthrough/shared/providers/firebaseAuth_provider.dart';

class NovoLoginController extends ChangeNotifier {
  var nome = TextEditingController();
  var email = TextEditingController();
  bool hasSenha = false;
  final _repository = ProfUserRepository();
  final _firebase_auth = FireBaseAuthProvider();
  final _controllerLogout = UserProfController();

  atualizaDados(
      {required VoidCallback? sucesso(UserProf? usuario),
      required VoidCallback? falha(String motivo),
      required UserProf usuario}) async {
    try {
      final user = UserProf(
          nome: nome.text.trim(),
          email: email.text.trim(),
          codigo: usuario.codigo,
          id: usuario.id
      );

      User? currentUser = await _firebase_auth.getCurrentUser();
      
      if (email.text.trim() != '') {
        await _firebase_auth.atualizarEmail(currentUser, user.email);
      } else {
        user.email = usuario.email;
      }
      
      if (user.email != '' || user.nome != '') {
        user.codigo = '';
        await _repository.alterar(user);
      }

      hasSenha ? await _firebase_auth.atualizarSenha(user.email ?? '') : null;

      sucesso(user);
    } on Exception catch (e) {
      falha(e.toString().substring(11));
    }
  }
}
