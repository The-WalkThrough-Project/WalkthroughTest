import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:walkthrough/modules/agenda/controllers/controllerHorarioF.dart';
import 'package:walkthrough/modules/agenda/models/horario_fixo_model.dart';
import 'package:walkthrough/modules/agenda/pages/formTest.dart';
import 'package:walkthrough/modules/loginProf/models/prof_model.dart';
import 'package:walkthrough/shared/components/tabela_horario_dia/tabelaHorario.dart';
import 'package:walkthrough/shared/databases/BD.dart';
class HorariosPage extends StatefulWidget {
  final UserProf user;

  const HorariosPage({Key? key, required this.user}) : super(key: key);

  @override
  State<HorariosPage> createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  String dropdownValue = 'Lab 304';
  late List<HorarioFixo>? horarios = [];
  //late List<HorarioFixo>? horariosOff = [];
  bool isLoading = false;
  final _controller = HorarioController();

  @override
  void initState() {
    super.initState();
    refreshHorarios();
  }

  Future refreshHorarios() async {
    setState(() {
      isLoading = true;
    });

    horarios = await _controller.getHorariosF(dropdownValue.substring(4));
    //horariosOff = await BancoHorarios.instance.readTodosHorariosFixosLab(dropdownValue.substring(4));
    setState(() {
      horarios;
      //horariosOff;
    });
    print(horarios.toString());
    //print(horariosOff.toString());

    setState(() {
      isLoading = false;
    });
  }

  Widget titulo(String titulo) {
    return Text(
      titulo,
      style: const TextStyle(
          color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 20),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("horáriosFixos").where('lab', isEqualTo: dropdownValue.substring(4)).snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Selecione um laboratório: ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                          DropdownButton<String>(
                            value: dropdownValue,
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
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                                refreshHorarios();
                              });
                            },
                            items: <String>[
                              'Lab 304',
                              'Lab 602',
                              'Lab 604',
                              'Lab 606',
                              'Lab 608',
                              'Lab 609',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: widget.user.tipoUsuario == 'Gerenciador' ? ElevatedButton(
                          onPressed: () async {
                            var result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) =>
                                        FormTeste(lab: dropdownValue.substring(4)))));
                            result == true ? refreshHorarios() : null;
                          },
                          child: const Text("CADASTRAR")
                      ) : null
                    ),
                        snapshot.hasData && isLoading == false 
                        //horarios != null && horarios!.isNotEmpty && isLoading == false 
                        ? Column(children: [
                            TabelaHorarios(
                              diaSemana: "Segunda-Feira",
                              horarios: snapshot.data.docs ?? [],
                              lab: dropdownValue.substring(4),
                            ),
                            TabelaHorarios(
                              diaSemana: "Terça-Feira",
                              horarios: snapshot.data.docs ?? [],
                              lab: dropdownValue.substring(4),
                            ),
                            TabelaHorarios(
                              diaSemana: "Quarta-Feira",
                              horarios: snapshot.data.docs ?? [],
                              lab: dropdownValue.substring(4),
                            ),
                            TabelaHorarios(
                              diaSemana: "Quinta-Feira",
                              horarios: snapshot.data.docs ?? [],
                              lab: dropdownValue.substring(4),
                            ),
                            TabelaHorarios(
                              diaSemana: "Sexta-Feira",
                              horarios: snapshot.data.docs ?? [],
                              lab: dropdownValue.substring(4),
                            ),
                          ])
                        : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.deepPurple,
                          ),
                        )
                  ]));
      }
    );
  }
}