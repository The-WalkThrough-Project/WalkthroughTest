import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:walkthrough/modules/agenda/controllers/controller.dart';
import 'package:walkthrough/shared/databases/BD.dart';
import 'dart:ui';

class FormTeste extends StatefulWidget {
  final String lab;

  const FormTeste({Key? key, required this.lab}) : super(key: key);

  @override
  State<FormTeste> createState() => _FormTesteState();
}

class _FormTesteState extends State<FormTeste> {
  final _controller = HorarioController();
  String valorHorario = '';
  String valorDia = '';
  String valorLab = '';

  @override
  void initState() {
    super.initState();
    valorDia = 'Segunda-Feira';
    valorHorario = '07:00 - 08:40 : 1M2M';
    valorLab = widget.lab;
    _controller.lab.text = widget.lab;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                style: TextStyle(color: Colors.deepPurple),
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.deepPurple),
                    labelText: "Nome do professor",
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 166, 140, 211)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 144, 117, 189)),
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  controller: _controller.nomeProfessor),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextFormField(
                style: TextStyle(color: Colors.deepPurple),
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(color: Colors.deepPurple),
                    labelText: "Nome da disciplina",
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(255, 166, 140, 211)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 144, 117, 189)),
                        borderRadius: BorderRadius.circular(10.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  controller: _controller.nomeDisciplina),
            ),
            Row(
              children: [
                const Expanded(
                    child: Text(
                  "Horário: ",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
                Expanded(
                  flex: 2,
                  child: DropdownButton<String>(
                    value: valorHorario,
                    items: <String>[
                      '07:00 - 08:40 : 1M2M',
                      '08:55 - 10:35 : 3M4M',
                      '10:50 - 12:30 : 5M6M',
                      '13:50 - 15:30 : 1T2T',
                      '15:50 - 17:30 : 3T4T',
                      '16:40 - 18:20 : 4T5T',
                      '19:00 - 20:40 : 1N2N',
                      '20:55 - 22:35 : 2N3N',
                    ].map<DropdownMenuItem<String>>((String valor1) {
                      return DropdownMenuItem<String>(
                        value: valor1,
                        child: Text(valor1),
                      );
                    }).toList(),
                    onChanged: (String? novoValor) {
                      setState(() {
                        valorHorario = novoValor!;
                        _controller.horario.text = valorHorario.substring(16);
                      });
                    },
                    icon: const Icon(
                      Icons.expand_more_rounded,
                      color: Colors.deepPurple,
                    ),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    dropdownColor: Colors.white,
                    underline: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                    child: Text("Laboratório: ",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                            fontSize: 16))),
                Expanded(
                  flex: 2,
                  child: DropdownButton<String>(
                    value: valorLab,
                    icon: const Icon(
                      Icons.expand_more_rounded,
                      color: Colors.deepPurple,
                    ),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    dropdownColor: Colors.white,
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    onChanged: (String? novoValor) {
                      setState(() {
                        valorLab = novoValor!;
                        _controller.lab.text = valorLab;
                      });
                    },
                    items: <String>[
                      '304',
                      '602',
                      '604',
                      '606',
                      '608',
                      '609',
                    ].map<DropdownMenuItem<String>>((String valor2) {
                      return DropdownMenuItem<String>(
                        value: valor2,
                        child: Text(valor2),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Expanded(
                    child: Text(
                  "Dia da Semana: ",
                  style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )),
                Expanded(
                  flex: 2,
                  child: DropdownButton<String>(
                    value: valorDia,
                    items: <String>[
                      'Segunda-Feira',
                      'Terça-Feira',
                      'Quarta-Feira',
                      'Quinta-Feira',
                      'Sexta-Feira',
                    ].map<DropdownMenuItem<String>>((String valor3) {
                      return DropdownMenuItem<String>(
                        value: valor3,
                        child: Text(valor3),
                      );
                    }).toList(),
                    onChanged: (String? novoValor) {
                      setState(() {
                        valorDia = novoValor!;
                        _controller.diaSemana.text = valorDia;
                      });
                    },
                    icon: const Icon(
                      Icons.expand_more_rounded,
                      color: Colors.deepPurple,
                    ),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    dropdownColor: Colors.white,
                    underline: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  _controller.salvarHorario(
                      sucesso: () {
                        Navigator.pop(context, true);
                      },
                      falha: (motivo) {});
                },
                child: const Text("Cadastrar"))
          ],
        )),
      ),
    );
  }
}
