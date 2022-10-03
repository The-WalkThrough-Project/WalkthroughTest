import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:walkthrough/modules/agenda/controllers/controller.dart';
import 'package:walkthrough/shared/databases/BD.dart';

class FormTeste extends StatefulWidget {
  final String lab;

  const FormTeste({Key? key, required this.lab}) : super(key: key);

  @override
  State<FormTeste> createState() => _FormTesteState();
}

class _FormTesteState extends State<FormTeste> {
  final _controller = HorarioController();

  @override
  void initState() {
    super.initState();

    _controller.lab.text = widget.lab; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Nome do professor"
              ),
              controller: _controller.nomeProfessor
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Nome da disciplina"
              ),
              controller: _controller.nomeDisciplina
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Horário"
              ),
              controller: _controller.horario
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Laboratório"
              ),
              controller: _controller.lab
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Dia da Semana"
              ),
              controller: _controller.diaSemana
            ),
            ElevatedButton(onPressed: () {
              _controller.salvarHorario(sucesso: (){
                Navigator.pop(context, true);
              }, falha: (motivo){});
            }, child: Text("Cadastrar"))
          ],
        )
      ),
    );
  }
}