import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:walkthrough/shared/components/botao_horario/celula_horario.dart';

class Lab608 extends StatefulWidget {
  const Lab608({Key? key}) : super(key: key);

  @override
  State<Lab608> createState() => _Lab608State();
}

class _Lab608State extends State<Lab608> {
  Widget titulo(String titulo) {
    return Text(
      titulo,
      style: TextStyle(
          color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 20),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: [
          Container(
                padding: EdgeInsets.only(bottom: 2),
                child: titulo("608"),
              ),
          Container(
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
                    content1: "PPM",
                    content2: "Bú",
                  ),
                  CelulaHorario(),
                  CelulaHorario(
                    width: 60,
                    content1: "PPM",
                    content2: "Bú",
                  ),
                  CelulaHorario(),
                  CelulaHorario(
                    width: 60,
                    content1: "PWI",
                    content2: "Thabbatta",
                  ),
                  CelulaHorario(),
                  CelulaHorario(
                    width: 60,
                    content1: "IECCM",
                    content2: "Marcelo",
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
                  CelulaHorario(),
                  CelulaHorario(
                    width: 60,
                    content1: "OPT-DI",
                    content2: "Rodrigo",
                  ),
                  CelulaHorario(),
                  CelulaHorario(
                    width: 60,
                    content1: "TCCII",
                    content2: "Hemilly",
                  ),
                  CelulaHorario(),
                  CelulaHorario(
                    width: 60,
                    content1: "TCCII",
                    content2: "Hemilly",
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
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "PPM",
                      content2: "Bú",
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
                      content1: "PPM",
                      content2: "Bú",
                    ),
                    CelulaHorario(),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "CAD",
                      content2: "Dênis",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "CAD",
                      content2: "Dênis",
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
                      content1: "LSO",
                      content2: "Michel",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "CGM",
                      content2: "Tumati",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "CGM",
                      content2: "Tumati",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "",
                      content2: "",
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
                      content1: "PORT",
                      content2: "Tumati",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "PED",
                      content2: "Tumati",
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
                      content1: "",
                      content2: "",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "LPCII",
                      content2: "Alberto",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "PP",
                      content2: "Thabbatta",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "",
                      content2: "",
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
                      content1: "TEI",
                      content2: "Christian",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "",
                      content2: "",
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
                      content1: "CAD",
                      content2: "Dênis",
                    ),
                    CelulaHorario(),
                    CelulaHorario(
                      width: 60,
                      content1: "CAD",
                      content2: "Dênis",
                    ),
                    CelulaHorario(width: 90),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}