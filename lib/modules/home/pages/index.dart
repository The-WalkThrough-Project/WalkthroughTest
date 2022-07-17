import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:walkthrough/modules/agenda/pages/index.dart';
import 'package:walkthrough/modules/home/pages/sobre.dart';

import '../../acesso/pages/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget botao(String texto, {void Function()? onPressed}){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: onPressed, 
          child: Text(texto,
            style: 
              const TextStyle(
                fontSize: 18
              ),
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(300, 90),
            shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: const BorderSide(color: Colors.deepPurple),
                      ),
                    ),
          )
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bem vindo',
        ),
        actions: <Widget>[
            TextButton.icon(
              icon: const Icon(
                Icons.question_mark,
                color: Colors.white,
              ),
              label: Text(""),
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SobrePage(),)
                );
              },
            ),
          ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            botao("Agenda", onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const AgendaPage()));
            },
            ),
            botao("Acesso", onPressed: () {
              Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => BluetoothApp())
              );
            }),
          ],
        ),
      ),
    );
  }
}