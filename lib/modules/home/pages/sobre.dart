import 'package:flutter/material.dart';

import 'quemsomos.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre o WalkThrough"),
      ),
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(55, 150, 55, 0),
          child: Text(
            "Tendo notado vários problemas relacionados à gestão de acesso e "
            "controle dos laboratórios do Campus v do CEFET-MG, foi pensado em desenvolver, "
            "por meio de pesquisa aplicada, uma tecnologia baseada em Internet das Coisas (IoT) "
            "para auxiliar no controle de acesso dos usuários a locais em que há necessidade de "
            "monitoramento de pessoas.",
            style: TextStyle(fontSize: 18, color: Colors.deepPurple),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(70, 50, 70, 0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuemSomosPage()));
              },
              style: ElevatedButton.styleFrom(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Quem Somos?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        )
      ]),
    );
  }
}
