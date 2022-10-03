import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:walkthrough/modules/loginProf/controllers/controller.dart';
import 'package:walkthrough/modules/loginProf/pages/index.dart';
import 'package:walkthrough/shared/providers/auth_provider.dart';
import 'package:walkthrough/shared/providers/firebaseAuth_provider.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool alterar = true;
  bool alterar2 = true;
  final _controller = UserProfController();

  @override
  Widget build(BuildContext context) {
    final FireBaseAuthProvider auth = FireBaseAuthProvider();
    final Future<String?>? idLogado = Provider.of(context)?.auth?.getCurrentUID();
    //final Future<DocumentSnapshot<Object?>?> dados = _controller.getDados(context);
    //final dados = ;

    return StreamBuilder(
      stream: auth.onAuthStatedChanged,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Seu Perfil"),
              actions: [
                TextButton.icon(
                    onPressed: () {
                      _controller.logOut();
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => true);
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    label: Text(""))
              ],
            ),
            body: ListView(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text('Seu nome atual:',
                  style: TextStyle(
                    fontSize: 18
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField (
                    //initialValue: dados['nome'],
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        margin: const EdgeInsets.only(left: 8),
                        decoration: const BoxDecoration(
                          border: Border(left: BorderSide(color: Colors.deepPurple))
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              alterar = false;
                            });
                          }, 
                          icon: Icon(Icons.edit, color: Colors.deepPurple,)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.deepPurple)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    readOnly: alterar,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text('Seu email atual:',
                  style: TextStyle(
                    fontSize: 18,
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: TextFormField(
                    //initialValue: dados['email'],
                    decoration: InputDecoration(
                      suffixIcon: Container(
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          border: Border(left: BorderSide(color: Colors.deepPurple))
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              alterar2 = false;
                            });
                          }, 
                          icon: Icon(Icons.edit, color: Colors.deepPurple,)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.deepPurple)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    readOnly: alterar2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          alterar = true;
                          alterar2 = true;
                        });
                      }, 
                      child: Text('Confirmar')),
                  ),
                )
              ],
            )
          )
        );
      }
    );
  }
}
