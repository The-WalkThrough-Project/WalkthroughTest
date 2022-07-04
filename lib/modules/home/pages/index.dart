import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:walkthrough/modules/acesso/pages/index.dart';
import 'package:walkthrough/modules/acesso/pages/selecionarDispositivo.dart';

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
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            botao("Agenda", onPressed: () {}),
            botao("Acesso", onPressed: () {
              Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => DiscoveryPage())
              );
            }),
          ],
        ),
      ),
    );
  }
}