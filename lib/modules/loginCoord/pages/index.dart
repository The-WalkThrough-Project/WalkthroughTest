import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../home/pages/index.dart';

class RouteCoordenador extends StatefulWidget {
  const RouteCoordenador({Key? key}) : super(key: key);

  @override
  _RouteCoordenadorState createState() => _RouteCoordenadorState();
}

class _RouteCoordenadorState extends State<RouteCoordenador> {

  @override
  Widget build(BuildContext context) {
    Widget campoForm(String texto, double paddingtop, bool senha) {
      return Padding(
        padding: EdgeInsets.only(top: paddingtop),
        child: Theme(
          data: ThemeData(primarySwatch: Colors.red),
          child: TextFormField(
            cursorColor: const Color.fromARGB(255, 139, 0, 0),
            obscureText: senha,
            style: const TextStyle(
              color: Color.fromARGB(255, 139, 0, 0),
            ),
            decoration: InputDecoration(
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 168, 0, 0)),
              hintText: texto,
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 168, 0, 0)),
                  borderRadius: BorderRadius.circular(10.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 139, 0, 0),
                    width: 1.6,
                  ),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário do coordenador'),
        backgroundColor: const Color.fromARGB(255, 139, 0, 0),
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
                    color: Color.fromARGB(255, 139, 0, 0),
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
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 139, 0, 0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Color.fromARGB(255, 139, 0, 0)),
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
