import 'package:flutter/material.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({ Key? key }) : super(key: key);

  @override
  State<SobrePage> createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre a Equipe"),
      ),
      body: const Center(
        child: Text("O Grupo da WalkThrough é Composto por:\nGuilherme Alvarenga de Azevedo,\nPedro Militão Mello reis,\nRafael Morais de Carvalho e\nThúlio Carvalho Dias.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),)
      ),
    );
  }
}