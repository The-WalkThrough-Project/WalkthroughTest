import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:walkthrough/modules/agenda/controllers/controllerHorarioA.dart';
import 'package:walkthrough/modules/agenda/models/horario_agendado_model.dart';
import 'package:walkthrough/modules/home/pages/index.dart';
import 'package:walkthrough/modules/loginProf/controllers/controller.dart';
import 'package:walkthrough/modules/loginProf/models/prof_model.dart';

class NotificacaoPage extends StatefulWidget {
  const NotificacaoPage({Key? key}) : super(key: key);

  @override
  State<NotificacaoPage> createState() => _NotificacaoPageState();
}

class _NotificacaoPageState extends State<NotificacaoPage> {
  List<HorarioAgendado>? horariosTemp = [];
  final _horariosAController = HorariosAgendadosController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getHorariosTemp();
  }

  getHorariosTemp() async {
    setState(() {
      isLoading = true;
    });
    horariosTemp = await _horariosAController.getHorariosATemp();
    horariosTemp = await _horariosAController.getHorariosATemp();
    horariosTemp = await _horariosAController.getHorariosATemp();
    setState(() {
      horariosTemp;
    });

    setState(() {
      isLoading = false;
    });
  }

  String arrumaStringData(String? data) {
    DateTime testeData = DateTime.now();
    testeData = DateTime.parse(data ?? '');
    String testeString = formatDate(testeData, ['dd', '/', 'mm', '/', 'yyyy']);
    return testeString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Solicitações de Agendamento',
          style: TextStyle(fontSize: 16.5),
        ),
        leading: BackButton(onPressed: () => Navigator.pop(context, true)),
        actions: <Widget>[
          TextButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    ((route) => false));
              },
              icon: const Icon(
                Icons.house,
                color: Colors.white,
              ),
              label: const Text(''))
        ],
      ),
      body: Center(
          child: !isLoading
              ? horariosTemp != null && horariosTemp!.isNotEmpty
                  ? ListView.builder(
                      itemCount: horariosTemp?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(19, 11, 19, 0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: ListTile(
                                  title: Text(
                                    'Data: ${arrumaStringData(horariosTemp?.elementAt(index).data)} \n Horário: ${horariosTemp?.elementAt(index).horarioInicial} às ${horariosTemp?.elementAt(index).horarioFinal}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Column(
                                    children: [
                                      Text(
                                        'Professor(a): ${horariosTemp?.elementAt(index).nomeProfessor} \n Laboratório: ${horariosTemp?.elementAt(index).lab}',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 168, 168, 168)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.redAccent),
                                            onPressed: () async {
                                              if (await confirm(
                                                context,
                                                title: const Text(
                                                  'Confirmação',
                                                  style: TextStyle(
                                                      color: Colors.deepPurple),
                                                ),
                                                content: const Text(
                                                  'Você tem certeza de que deseja recusar?',
                                                  style: TextStyle(
                                                      color: Colors.deepPurple),
                                                ),
                                                textOK: const Text(
                                                  'Sim',
                                                  style: TextStyle(
                                                      color: Colors.green),
                                                ),
                                                textCancel: const Text(
                                                  'Não',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              )) {
                                                _horariosAController
                                                    .excluirHorarioTemp(
                                                        horariosTemp
                                                            ?.elementAt(index));
                                                getHorariosTemp();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  duration: Duration(
                                                      milliseconds: 2500),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.deepPurple,
                                                  content: Text(
                                                    'Solicitação recusada com sucesso!',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ));
                                              }
                                            },
                                            child: const Text("Recusar"),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.all(8)),
                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.lightGreen),
                                            onPressed: () async {
                                              if (await confirm(
                                                context,
                                                title: const Text(
                                                  'Confirmação',
                                                  style: TextStyle(
                                                      color: Colors.deepPurple),
                                                ),
                                                content: const Text(
                                                  'Você tem certeza de que deseja aceitar?',
                                                  style: TextStyle(
                                                      color: Colors.deepPurple),
                                                ),
                                                textOK: const Text(
                                                  'Sim',
                                                  style: TextStyle(
                                                      color: Colors.green),
                                                ),
                                                textCancel: const Text(
                                                  'Não',
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                ),
                                              )) {
                                                horariosTemp
                                                    ?.elementAt(index)
                                                    .isTemp = 0;
                                                _horariosAController
                                                    .atualizarHorarioTemp(
                                                        horariosTemp
                                                            ?.elementAt(index));
                                                getHorariosTemp();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  duration: Duration(
                                                      milliseconds: 2500),
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  backgroundColor:
                                                      Colors.deepPurple,
                                                  content: Text(
                                                    'Solicitação aceitada com sucesso!',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ));
                                              }
                                            },
                                            child: const Text("Aceitar"),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  tileColor: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Não há solicitações de agendamento!',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.sentiment_very_satisfied,
                            color: Colors.deepPurple,
                            size: 25,
                          ),
                        )
                      ],
                    )
              : const CircularProgressIndicator(
                  color: Colors.deepPurple,
                )),
    );
  }
}
