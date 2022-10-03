import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:walkthrough/modules/loginProf/controllers/controller.dart';

import '../../home/pages/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = UserProfController();
  //var dados = _controller.dadosUsuario['nome'];
  bool isDesativado = false;

  @override
  void initState() {
    super.initState();
    isDesativado = false;
  }

  @override
  Widget build(BuildContext context) {
    Widget campoForm(String texto, double paddingtop, bool senha,
        TextEditingController controller) {
      return Padding(
        padding: EdgeInsets.only(top: paddingtop),
        child: TextFormField(
          controller: controller,
          obscureText: senha,
          style: const TextStyle(
            color: Colors.deepPurple,
          ),
          decoration: InputDecoration(
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 144, 117, 189)),
            hintText: texto,
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 144, 117, 189)),
                borderRadius: BorderRadius.circular(10.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.deepPurple,
                  width: 1.6,
                ),
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(90, 0, 90, 0),
          child: Form(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: !isDesativado
                    ? [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Image.asset(
                            'assets/images/WT.png',
                          ),
                        ),
                        const Text(
                          "Faça seu login",
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 40,
                              fontFamily: 'Roboto'),
                        ),
                        campoForm("Login", 20, false, _controller.login),
                        campoForm("Senha", 10, true, _controller.senha),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            onPressed: (() async {
                              if (!isDesativado) {
                                setState(() {
                                  isDesativado = true;
                                });
                                _controller
                                    .validarLogin(
                                        sucesso: () {},
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
                                        context: context)
                                    .then((value) => setState(() {
                                          isDesativado = false;
                                        }));
                              }
                            }),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: const BorderSide(
                                      color: Colors.deepPurple),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]
                    : [
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(
                                color: Colors.deepPurple,
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Carregando...',
                                  style: TextStyle(
                                      color: Colors.deepPurple, fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
          ),
        ),
      ),
    );
  }
}
