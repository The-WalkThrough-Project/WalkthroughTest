import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:walkthrough/modules/agenda/controllers/controller.dart';
import 'package:walkthrough/modules/agenda/models/horario_fixo_model.dart';
import 'package:walkthrough/modules/agenda/pages/formTest.dart';
import 'package:walkthrough/shared/components/tabela_horario_dia/tabelaHorario.dart';
import 'package:walkthrough/shared/databases/BD.dart';
class HorariosPage extends StatefulWidget {
  const HorariosPage({Key? key}) : super(key: key);

  @override
  State<HorariosPage> createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  String dropdownValue = 'Lab 304';
  late List<HorarioFixo>? horarios = [];
  late List<HorarioFixo>? horariosOff = [];
  bool isLoading = false;
  final _controller = HorarioController();

  @override
  void initState() {
    super.initState();
    refreshHorarios();
  }

  /*@override
  void dispose() {
    BancoHorarios.instance.close();
    
    super.dispose();
  }*/

  Future refreshHorarios() async {
    setState(() {
      isLoading = true;
    });

    horarios = await _controller.getHorariosF(dropdownValue.substring(4));
    horariosOff = await BancoHorarios.instance.readTodosHorariosFixosLab(dropdownValue.substring(4));
    setState(() {
      horarios = horarios;
      horariosOff = horariosOff;
    });
    print(horarios.toString());
    print(horariosOff.toString());

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
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 15, 0),
                      child: DropdownButton<String>(
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
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          var result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      FormTeste(lab: dropdownValue.substring(4)))));
                          result == true ? refreshHorarios() : null;
                        },
                        child: Text("CADASTRAR")),
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
                        : Container(
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Colors.deepPurple,
                              ),
                            ),
                          )
                  ]));
      }
    );
  }
}
    /* Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(5)),
            child: Column(children: [
              Container(
                padding: EdgeInsets.only(bottom: 2),
                child: titulo("SEGUNDA-FEIRA"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CelulaHorario(
                    content1: "1M",
                    content2: "7:00\n7:50",
                  ),
                  CelulaHorario(
                    content1: "2M",
                    content2: "7:50\n8:40",
                  ),
                  CelulaHorario(
                    content1: "--",
                    content2: "8:40\n8:55",
                  ),
                  CelulaHorario(
                    content1: "3M",
                    content2: "8:55\n9:45",
                  ),
                  CelulaHorario(
                    content1: "4M",
                    content2: "9:45\n10:35",
                  ),
                  CelulaHorario(
                    content1: "--",
                    content2: "10:35\n10:50",
                  ),
                  CelulaHorario(
                    content1: "5M",
                    content2: "10:50\n11:40",
                  ),
                  CelulaHorario(
                    content1: "6M",
                    content2: "11:40\n12:30",
                  ),
                  CelulaHorario(
                    content1: "--",
                    content2: "12:30\n13:50",
                  ),
                  CelulaHorario(
                    content1: "1T",
                    content2: "13:50\n14:40",
                  ),
                  CelulaHorario(
                    content1: "2T",
                    content2: "14:40\n15:30",
                  ),
                  CelulaHorario(
                    content1: "--",
                    content2: "15:30\n15:50",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CelulaHorario(
                    width: 60,
                    content1: "",
                    content2: "",
                  ),
                  CelulaHorario(),
                  CelulaHorario(
                    width: 60,
                    content1: "LCSD",
                    content2: "Thabbatta",
                  ),
                  CelulaHorario(),
                  CelulaHorario(
                    width: 60,
                    content1: "LSDC",
                    content2: "Alan",
                  ),
                  CelulaHorario(),
                  CelulaHorario(
                    width: 60,
                    content1: "LSDC",
                    content2: "Alan",
                  ),
                  CelulaHorario()
                ],
              ),
              Padding(padding: EdgeInsets.all(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CelulaHorario(
                    content1: "3T",
                    content2: "15:50\n16:40",
                  ),
                  CelulaHorario(
                    content1: "4T",
                    content2: "16:40\n17:30",
                  ),
                  CelulaHorario(
                    content1: "5T",
                    content2: "17:30\n18:20",
                  ),
                  CelulaHorario(
                    content1: "--",
                    content2: "18:20\n19:00",
                  ),
                  CelulaHorario(
                    content1: "1N",
                    content2: "19:00\n19:50",
                  ),
                  CelulaHorario(
                    content1: "2N",
                    content2: "19:50\n20:40",
                  ),
                  CelulaHorario(
                    content1: "--",
                    content2: "20:40\n20:55",
                  ),
                  CelulaHorario(
                    content1: "3N",
                    content2: "20:55\n21:45",
                  ),
                  CelulaHorario(
                    content1: "4N",
                    content2: "21:45\n22:35",
                  ),
                  CelulaHorario(width: 90),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CelulaHorario(
                    width: 60,
                    content1: "IoT",
                    content2: "Thabbatta",
                  ),
                  CelulaHorario(),
                  CelulaHorario(),
                  CelulaHorario(
                    width: 60,
                    content1: "CG",
                    content2: "Raulivan",
                  ),
                  CelulaHorario(),
                  CelulaHorario(
                    width: 60,
                    content1: "",
                    content2: "",
                  ),
                  CelulaHorario(width: 90),
                ],
              ),
            ]),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 2),
                  child: titulo("TERÇA-FEIRA"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      content1: "1M",
                      content2: "7:00\n7:50",
                    ),
                    CelulaHorario(
                      content1: "2M",
                      content2: "7:50\n8:40",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "8:40\n8:55",
                    ),
                    CelulaHorario(
                      content1: "3M",
                      content2: "8:55\n9:45",
                    ),
                    CelulaHorario(
                      content1: "4M",
                      content2: "9:45\n10:35",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "10:35\n10:50",
                    ),
                    CelulaHorario(
                      content1: "5M",
                      content2: "10:50\n11:40",
                    ),
                    CelulaHorario(
                      content1: "6M",
                      content2: "11:40\n12:30",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "12:30\n13:50",
                    ),
                    CelulaHorario(
                      content1: "1T",
                      content2: "13:50\n14:40",
                    ),
                    CelulaHorario(
                      content1: "2T",
                      content2: "14:40\n15:30",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "15:30\n15:50",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      width: 60,
                      content1: "IC",
                      content2: "Alisson",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "IHC",
                      content2: "Alberto",
                    ),
                    CelulaHorario()
                  ],
                ),
                Padding(padding: EdgeInsets.all(2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      content1: "3T",
                      content2: "15:50\n16:40",
                    ),
                    CelulaHorario(
                      content1: "4T",
                      content2: "16:40\n17:30",
                    ),
                    CelulaHorario(
                      content1: "5T",
                      content2: "17:30\n18:20",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "18:20\n19:00",
                    ),
                    CelulaHorario(
                      content1: "1N",
                      content2: "19:00\n19:50",
                    ),
                    CelulaHorario(
                      content1: "2N",
                      content2: "19:50\n20:40",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "20:40\n20:55",
                    ),
                    CelulaHorario(
                      content1: "3N",
                      content2: "20:55\n21:45",
                    ),
                    CelulaHorario(
                      content1: "4N",
                      content2: "21:45\n22:35",
                    ),
                    CelulaHorario(width: 90),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      width: 90,
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "SO",
                      content2: "Marcelo",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(width: 90),
                  ],
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 2),
                  child: titulo("QUARTA-FEIRA"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      content1: "1M",
                      content2: "7:00\n7:50",
                    ),
                    CelulaHorario(
                      content1: "2M",
                      content2: "7:50\n8:40",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "8:40\n8:55",
                    ),
                    CelulaHorario(
                      content1: "3M",
                      content2: "8:55\n9:45",
                    ),
                    CelulaHorario(
                      content1: "4M",
                      content2: "9:45\n10:35",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "10:35\n10:50",
                    ),
                    CelulaHorario(
                      content1: "5M",
                      content2: "10:50\n11:40",
                    ),
                    CelulaHorario(
                      content1: "6M",
                      content2: "11:40\n12:30",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "12:30\n13:50",
                    ),
                    CelulaHorario(
                      content1: "1T",
                      content2: "13:50\n14:40",
                    ),
                    CelulaHorario(
                      content1: "2T",
                      content2: "14:40\n15:30",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "15:30\n15:50",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      width: 60,
                      content1: "IC",
                      content2: "Alisson",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "SD",
                      content2: "Daniel",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "IAR",
                      content2: "Adriano / Jean",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "LP",
                      content2: "Charlene",
                    ),
                    CelulaHorario()
                  ],
                ),
                Padding(padding: EdgeInsets.all(2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      content1: "3T",
                      content2: "15:50\n16:40",
                    ),
                    CelulaHorario(
                      content1: "4T",
                      content2: "16:40\n17:30",
                    ),
                    CelulaHorario(
                      content1: "5T",
                      content2: "17:30\n18:20",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "18:20\n19:00",
                    ),
                    CelulaHorario(
                      content1: "1N",
                      content2: "19:00\n19:50",
                    ),
                    CelulaHorario(
                      content1: "2N",
                      content2: "19:50\n20:40",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "20:40\n20:55",
                    ),
                    CelulaHorario(
                      content1: "3N",
                      content2: "20:55\n21:45",
                    ),
                    CelulaHorario(
                      content1: "4N",
                      content2: "21:45\n22:35",
                    ),
                    CelulaHorario(width: 90),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      width: 90,
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "PWI",
                      content2: "André M.",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "SO",
                      content2: "Marcelo",
                    ),
                    CelulaHorario(width: 90),
                  ],
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 2),
                  child: titulo("QUINTA-FEIRA"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      content1: "1M",
                      content2: "7:00\n7:50",
                    ),
                    CelulaHorario(
                      content1: "2M",
                      content2: "7:50\n8:40",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "8:40\n8:55",
                    ),
                    CelulaHorario(
                      content1: "3M",
                      content2: "8:55\n9:45",
                    ),
                    CelulaHorario(
                      content1: "4M",
                      content2: "9:45\n10:35",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "10:35\n10:50",
                    ),
                    CelulaHorario(
                      content1: "5M",
                      content2: "10:50\n11:40",
                    ),
                    CelulaHorario(
                      content1: "6M",
                      content2: "11:40\n12:30",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "12:30\n13:50",
                    ),
                    CelulaHorario(
                      content1: "1T",
                      content2: "13:50\n14:40",
                    ),
                    CelulaHorario(
                      content1: "2T",
                      content2: "14:40\n15:30",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "15:30\n15:50",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      width: 60,
                      content1: "IC",
                      content2: "Alisson",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "PWII",
                      content2: "Daniel",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "FP",
                      content2: "Thiago",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "FP",
                      content2: "Thiago",
                    ),
                    CelulaHorario()
                  ],
                ),
                Padding(padding: EdgeInsets.all(2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      content1: "3T",
                      content2: "15:50\n16:40",
                    ),
                    CelulaHorario(
                      content1: "4T",
                      content2: "16:40\n17:30",
                    ),
                    CelulaHorario(
                      content1: "5T",
                      content2: "17:30\n18:20",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "18:20\n19:00",
                    ),
                    CelulaHorario(
                      content1: "1N",
                      content2: "19:00\n19:50",
                    ),
                    CelulaHorario(
                      content1: "2N",
                      content2: "19:50\n20:40",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "20:40\n20:55",
                    ),
                    CelulaHorario(
                      content1: "3N",
                      content2: "20:55\n21:45",
                    ),
                    CelulaHorario(
                      content1: "4N",
                      content2: "21:45\n22:35",
                    ),
                    CelulaHorario(width: 90),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      width: 90,
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "PWI",
                      content2: "André M.",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(width: 90),
                  ],
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 2),
                  child: titulo("SEXTA-FEIRA"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      content1: "1M",
                      content2: "7:00\n7:50",
                    ),
                    CelulaHorario(
                      content1: "2M",
                      content2: "7:50\n8:40",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "8:40\n8:55",
                    ),
                    CelulaHorario(
                      content1: "3M",
                      content2: "8:55\n9:45",
                    ),
                    CelulaHorario(
                      content1: "4M",
                      content2: "9:45\n10:35",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "10:35\n10:50",
                    ),
                    CelulaHorario(
                      content1: "5M",
                      content2: "10:50\n11:40",
                    ),
                    CelulaHorario(
                      content1: "6M",
                      content2: "11:40\n12:30",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "12:30\n13:50",
                    ),
                    CelulaHorario(
                      content1: "1T",
                      content2: "13:50\n14:40",
                    ),
                    CelulaHorario(
                      content1: "2T",
                      content2: "14:40\n15:30",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "15:30\n15:50",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      width: 60,
                      content1: "CG",
                      content2: "Raulivan",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "IAR",
                      content2: "Adriano / Jean",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "SD",
                      content2: "Daniel",
                    ),
                    CelulaHorario()
                  ],
                ),
                Padding(padding: EdgeInsets.all(2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      content1: "3T",
                      content2: "15:50\n16:40",
                    ),
                    CelulaHorario(
                      content1: "4T",
                      content2: "16:40\n17:30",
                    ),
                    CelulaHorario(
                      content1: "5T",
                      content2: "17:30\n18:20",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "18:20\n19:00",
                    ),
                    CelulaHorario(
                      content1: "1N",
                      content2: "19:00\n19:50",
                    ),
                    CelulaHorario(
                      content1: "2N",
                      content2: "19:50\n20:40",
                    ),
                    CelulaHorario(
                      content1: "--",
                      content2: "20:40\n20:55",
                    ),
                    CelulaHorario(
                      content1: "3N",
                      content2: "20:55\n21:45",
                    ),
                    CelulaHorario(
                      content1: "4N",
                      content2: "21:45\n22:35",
                    ),
                    CelulaHorario(width: 90),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CelulaHorario(
                      width: 90,
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "FUI",
                      content2: "Alberto",
                    ),
                    CelulaHorario(width: 90),
                  ],
                ),
              ],
            ),
          ), */
    /*GridView.count(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      crossAxisCount: 11,
      children: [
        CelulaHorario(content1: "Horário"),
        CelulaHorario(content1: "Seg"),
        CelulaHorario(content1: "Ter"),
        CelulaHorario(content1: "Qua"),
        CelulaHorario(content1: "Qui"),
        CelulaHorario(content1: "Sex"),
        CelulaHorario(content1: "1M", content2: "7:00\n7:50",),
        CelulaHorario(content1: "SO"),
        CelulaHorario(content1: "2M", content2: "7:50\n8:40",),
        CelulaHorario(content1: "Caramuru"),
        CelulaHorario(content1: "--", content2: "8:40\n8:55",),
        CelulaHorario(content1: ""),
        CelulaHorario(content1: "3M", content2: "8:55\n9:45",),
        CelulaHorario(content1: "4M", content2: "9:45\n10:35",),
        CelulaHorario(content1: "--", content2: "10:35\n10:50",),
        CelulaHorario(content1: "5M", content2: "10:50\n11:40",),
        CelulaHorario(content1: "6M", content2: "11:40\n12:30",),
        CelulaHorario(content1: "--", content2: "12:30\n13:50",),
        CelulaHorario(content1: "1T", content2: "13:50\n14:40",),
        CelulaHorario(content1: "2T", content2: "14:40\n15:30",),
        CelulaHorario(content1: "--", content2: "15:30\n15:50",),
        CelulaHorario(content1: "3T", content2: "15:50\n16:40",),
        CelulaHorario(content1: "4T", content2: "16:40\n17:30",),
        CelulaHorario(content1: "5T", content2: "17:30\n18:20",),
        CelulaHorario(content1: "--", content2: "18:20\n19:00",),
        CelulaHorario(content1: "1N", content2: "19:00\n19:50",),
        CelulaHorario(content1: "2N", content2: "19:50\n20:40",),
        CelulaHorario(content1: "--", content2: "20:40\n20:55",),
        CelulaHorario(content1: "3N", content2: "20:55\n21:45",),
        CelulaHorario(content1: "4N", content2: "21:45\n22:35",),
      ],
    );*/

/*child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ListView(children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: [
                BotaoDiaSemana(
                  texto: "Seg",
                ),
                BotaoDiaSemana(texto: "Ter"),
                BotaoDiaSemana(texto: "Qua"),
                BotaoDiaSemana(texto: "Qui"),
                BotaoDiaSemana(texto: "Sex"),
              ],
            ),
          ),
          BotaoHorario(
            horario: "7:00 - 8:40",
            disciplina: "Horário vago",
          ),
          BotaoHorario(
            horario: "8:55 - 10:35",
            disciplina: "RC",
            turma: "3° B - G2",
          ),
          BotaoHorario(
            horario: "10:50 - 12:30",
            disciplina: "SO",
            turma: "3° B - G1",
          ),
          BotaoHorario(
            horario: "13:50 - 15:30",
            disciplina: "PDM",
            turma: "3° B - G1",
          ),
          BotaoHorario(
            horario: "15:50 - 17:30",
            disciplina: "BD",
            turma: "2° B - G1",
          ),
          BotaoHorario(
            horario: "17:30 - 18:20",
            disciplina: "BD",
            turma: "2° B - G1",
          ),
          BotaoHorario(
            horario: "19:00 - 20:40",
            disciplina: "BD",
            turma: "2° B - G1",
          ),
          BotaoHorario(
            horario: "20:55 - 22:35",
            disciplina: "BD",
            turma: "2° B - G1",
          ),
        ]),
      ),*/