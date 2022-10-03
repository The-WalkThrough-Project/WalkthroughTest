import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthProvider{
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  

  Stream<User?> get onAuthStatedChanged => _firebaseauth.authStateChanges();

  Future<String> getCurrentUID() async {
    return _firebaseauth.currentUser!.uid;
  }

  Future<Map> efetuarLogin(String email, String senha) async {
    try {
      final userCredential = await _firebaseauth.signInWithEmailAndPassword(email: email, password: senha); 
        return {
          'id': userCredential.user?.uid,
          'displayName': userCredential.user?.displayName,
          'email': userCredential.user?.email,
          'photoURL': userCredential.user?.photoURL,
          'phoneNumber': userCredential.user?.phoneNumber
        };
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == 'user-not-found') {
        throw Exception('Não há usuário cadastrado com este email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Login ou senha incorretos.');
      } else if (e.code == 'invalid-email'){
        throw Exception('Informe um email válido.');
      } else if (e.code == 'user-disabled'){
        throw Exception('Este usuário está disabilitado.');
      }
      return {};
    }
  }

  Future<void> logOut() async{
    try {
      await _firebaseauth.signOut();
    } on Exception catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> atualizarEmail(User user, String emailNovo) async{
    try {
      await user.updateEmail(emailNovo);
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> atualizarSenha(String email) async{
    try {
      await _firebaseauth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<User?> getDados() async{
    _firebaseauth.authStateChanges().listen((User? user) async{
      
    });
  }
}