import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:walkthrough/modules/home/pages/index.dart';
import 'package:walkthrough/modules/loginProf/models/prof_model.dart';
import 'package:walkthrough/modules/loginProf/repositories/profUser_repository.dart';
import 'package:walkthrough/shared/providers/auth_provider.dart';
import 'package:walkthrough/shared/providers/firebaseAuth_provider.dart';
import 'package:walkthrough/shared/providers/firebase_firestore_provider.dart';

class UserProfController extends ChangeNotifier {
  final login = TextEditingController();
  final senha = TextEditingController();
  final _repository = ProfUserRepository();
  final _firebaseAuthProvider = FireBaseAuthProvider();
  final _firebaseFirestoreProvider = FireBaseFirestoreProvider();

  Future<DocumentSnapshot<Object?>?> getDados(BuildContext context) async {
    try {
      final Future<String>? userId = Provider.of(context)?.auth?.getCurrentUID();
      DocumentSnapshot<Object?>? dados =
          await _firebaseFirestoreProvider.getDadosUsuario(userId as String?);
      return dados;
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> validarLogin(
      {required VoidCallback? sucesso(),
      required VoidCallback? falha(String motivo),
      required BuildContext context}) async {
    try {
      final email = login.text.trim();
      final usuario = UserProf(
        email: email,
        senha: senha.text,
      );
      usuario.isValid();
      print(email + ' ' + senha.text);

      await _firebaseAuthProvider.efetuarLogin(email, senha.text);
      redirecionaLogado(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Não há usuário cadastrado com este email.');
        falha('Não há usuário cadastrado com este email.');
      } else if (e.code == 'wrong-password') {
        print('Login ou senha incorretos.');
        falha('Login ou senha incorretos.');
      } else if (e.code == 'invalid-email') {
        print('Informe um email válido.');
        falha('Informe um email válido.');
      } else if (e.code == 'user-disabled') {
        print('Este usuário está desabilitado.');
        falha('Este usuário está desabilitado.');
      }
    } catch (e) {
      falha(e.toString().substring(11));
    }
  }

  void redirecionaLogado(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.deepPurple,
        content: Text(
          'Bem vindo!',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<void> logOut() async {
    _firebaseAuthProvider.logOut();
  }

  /*Future<void> entrarLogin(context) async {
    _repository.getConexaoAuth().authStateChanges().listen((User? user) async { 
      if (user == null) {
        print('Usuário está deslogado!');
      } else {
        print('Usuário está logado!');
        DocumentSnapshot dados = await _repository.getConexao().collection('usuários').doc(user.uid).get();
        print(dados.data());
        String? userNome = dados['nome'];
        
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: 1500),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.deepPurple,
            content: Text(
              'Bem vindo $userNome!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
    });    
  }*/
}
