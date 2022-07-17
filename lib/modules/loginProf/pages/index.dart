import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../home/pages/index.dart';

class RouteProfessor extends StatefulWidget {
  const RouteProfessor({Key? key}) : super(key: key);

  @override
  _RouteProfessorState createState() => _RouteProfessorState();
}

class _RouteProfessorState extends State<RouteProfessor> {

  @override
  Widget build(BuildContext context) {
    Widget campoForm(String texto, double paddingtop, bool senha) {
      return Padding(
        padding: EdgeInsets.only(top: paddingtop),
        child: TextFormField(
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário dos professores'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(90, 0, 90, 0),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Entre",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 40,
                    fontFamily: 'Roboto'),
              ),
              campoForm("Login", 20, false),
              campoForm("Senha", 10, true),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  },
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
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.deepPurple),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
