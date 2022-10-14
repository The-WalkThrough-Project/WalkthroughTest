import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:walkthrough/modules/loginProf/controllers/controller.dart';
import 'package:walkthrough/modules/loginProf/models/prof_model.dart';
import 'package:walkthrough/modules/loginProf/pages/index.dart';
import 'package:walkthrough/modules/novoLogin/controllers/controller.dart';
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
  final _controller2 = NovoLoginController();
  UserProf user = UserProf();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getDados1();
  }

  getDados1() async {
    setState(() {
      isLoading = true;
    });

    user = await _controller.getDados();
    print(user);
    setState(() {
      user;
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final FireBaseAuthProvider auth = FireBaseAuthProvider();

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
                            _controller.removeToken();
                            _controller.logOut();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                                (route) => false);
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          label: const Text(""))
                    ],
                  ),
                  body: !isLoading
                      ? ListView(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Text(
                                'Seu nome:',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: TextFormField(
                                controller: _controller2.nome,
                                decoration: InputDecoration(
                                  hintText: user.nome,
                                  suffixIcon: Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                color: Colors.deepPurple))),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            alterar = false;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.deepPurple,
                                        )),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.deepPurple,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                readOnly: alterar,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Text(
                                'Seu email:',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: TextFormField(
                                controller: _controller2.email,
                                decoration: InputDecoration(
                                  hintText: user.email,
                                  suffixIcon: Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                color: Colors.deepPurple))),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            alterar2 = false;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.deepPurple,
                                        )),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.deepPurple)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.deepPurple,
                                        width: 2,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                ),
                                readOnly: alterar2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                              child: Row(
                                children: [
                                  const Text(
                                    'Assinale caso queira alterar a sua senha: ',
                                    style: TextStyle(
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                  Checkbox(
                                      activeColor: Colors.deepPurple,
                                      value: _controller2.hasSenha,
                                      onChanged: (value) {
                                        setState(() {
                                          _controller2.hasSenha =
                                              !_controller2.hasSenha;
                                        });
                                      }),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Center(
                                child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        _controller2.nome.text.isNotEmpty
                                            ? null
                                            : _controller2.nome.text =
                                                user.nome ?? '';
                                        _controller2.email.text.isNotEmpty
                                            ? null
                                            : _controller2.email.text =
                                                user.email ?? '';
                                      });
                                      _controller2.atualizaDados(
                                          sucesso: () {
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              duration:
                                                  Duration(milliseconds: 2500),
                                              behavior: SnackBarBehavior.floating,
                                              backgroundColor:
                                                  Colors.deepPurple,
                                              content: Text(
                                                'Dados Atualizados com sucesso!',
                                                textAlign: TextAlign.center,
                                              ),
                                            ));
                                            if(_controller2.hasSenha) {
                                              MotionToast.success(
                                              toastDuration: Duration(seconds: 5),
                                              title: const Text(
                                                'Erro',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              description: const Text('Verifique seu email para alterar sua senha. \nLembre-se de checar o spam!'),
                                              animationType:
                                                  AnimationType.fromTop,
                                              position: MotionToastPosition.top,
                                              barrierColor:
                                                  Colors.black.withOpacity(0.3),
                                              width: 300,
                                              height: 80,
                                              dismissable: true,
                                            ).show(context);
                                            }
                                          },
                                          falha: (motivo) {
                                            MotionToast.error(
                                              title: const Text(
                                                'Erro',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              description: Text(motivo),
                                              animationType:
                                                  AnimationType.fromLeft,
                                              position: MotionToastPosition.top,
                                              barrierColor:
                                                  Colors.black.withOpacity(0.3),
                                              width: 300,
                                              height: 80,
                                              dismissable: true,
                                            ).show(context);
                                          },
                                          usuario: user);
                                      setState(() {
                                        alterar = true;
                                        alterar2 = true;
                                      });
                                    },
                                    child: const Text('Confirmar')),
                              ),
                            )
                          ],
                        )
                      : const Center(
                          child: const CircularProgressIndicator(
                          color: Colors.deepPurple,
                        ))));
        });
  }
}
