import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BotaoHorario extends StatefulWidget {
  final horario;
  final disciplina;
  final turma;

  const BotaoHorario({
    Key? key,
    required this.horario,
    required this.disciplina,
    this.turma
  }) : super(key: key);

  @override
  State<BotaoHorario> createState() => _BotaoHorarioState();
}

class _BotaoHorarioState extends State<BotaoHorario> {
  bool _mostraConteudo = false;
  String valorDrop = '3° A';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: ElevatedButton(
        onPressed: () {},
        child: IgnorePointer(
          ignoring: widget.turma.toString().contains(" ") ? true : false,
          child: ExpansionTile(
            onExpansionChanged: (value) =>
                setState(() => _mostraConteudo = value),
            trailing: widget.turma.toString().contains(" ") ? Icon(null) : Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Icon(
                _mostraConteudo
                    ? Icons.expand_less_rounded
                    : Icons.expand_more_rounded,
                color: Colors.white,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 12,
                        child: Text(
                          widget.horario,
                          style: const TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          widget.turma ?? "",
                          style: const TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    widget.disciplina,
                    style: TextStyle(
                        fontStyle: widget.disciplina.toString().contains("vago") ? FontStyle.italic : null,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                )
              ],
            ),
            children: [
              const Divider(
                height: 10,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  'Digite sua disciplina:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Theme(
                  data: ThemeData(primarySwatch: Colors.deepPurple),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      label: const Text(
                        'Disciplina',
                        style: TextStyle(
                            color: Color.fromARGB(255, 233, 228, 228)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 233, 228, 228)),
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 60,
                thickness: 2,
                indent: 0,
                endIndent: 0,
                color: Colors.white,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      'Selecione a turma:',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: DropdownButton<String>(
                      value: valorDrop,
                      icon: const Icon(
                        Icons.expand_more_rounded,
                        color: Colors.white,
                      ),
                      elevation: 16,
                      style: const TextStyle(color: Colors.white),
                      dropdownColor: Colors.deepPurple,
                      underline: Container(
                        height: 2,
                        color: Colors.white,
                      ),
                      onChanged: (String? novoValor) {
                        setState(() {
                          valorDrop = novoValor!;
                        });
                      },
                      items: <String>[
                        '3° A',
                        '3° B',
                        '3° C',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 30),
                child: Container(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    child: const Text(
                      'Agendar horário',
                      style:
                          TextStyle(fontSize: 20, color: Colors.deepPurple),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(milliseconds: 1500),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.deepPurple,
                          content: Text(
                            'Horário agendado com sucesso!',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
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
