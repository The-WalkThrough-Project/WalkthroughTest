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
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      isLoading = false;
    });
  }

  String arrumaStringData(String? data) {
    if(data != null) {
        DateTime testeData = DateTime.now();
        testeData = DateTime.parse(data);
        String testeString = formatDate(testeData, ['dd', '/', 'mm', '/', 'yyyy']);
        return testeString;
    }
    return '';
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
      ),
      body: !isLoading ? FutureBuilder<List?>(
        future: _horariosAController.getHorariosATemp(),
        builder: (context, snapshot) {
          return snapshot.data != null && snapshot.data?.length != 0 ? Center(
              child: ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(19, 11, 19, 0),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Card(
                                      elevation: 15,
                                      color: Colors.deepPurple,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      child: InkWell(
                                        radius: 400,
                                        borderRadius: BorderRadius.circular(20),
                                        highlightColor:
                                            Color.fromARGB(255, 152, 102, 240)
                                                .withAlpha(60),
                                        splashColor:
                                            Color.fromARGB(255, 152, 102, 240)
                                                .withAlpha(60),
                                        onTap: () {},
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        10, 0, 20, 0),
                                                    child: Icon(
                                                        Icons.calendar_month,
                                                        color: Colors.white),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Data: ${arrumaStringData(snapshot.data?.elementAt(index).data)} \nHorário: ${snapshot.data?.elementAt(index).horarioInicial} às ${snapshot.data?.elementAt(index).horarioFinal}',
                                                        style: const TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white),
                                                      ),
                                                      Text(
                                                        'Professor(a): ${snapshot.data?.elementAt(index).nomeProfessor} \nLaboratório: ${snapshot.data?.elementAt(index).lab}',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Color.fromARGB(
                                                              255, 199, 199, 199),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              const Divider(
                                                color: Colors.white,
                                                height: 10,
                                                indent: 2,
                                                endIndent: 2,
                                                thickness: 1.5,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.redAccent),
                                                      onPressed: () async {
                                                        if (await confirm(
                                                          context,
                                                          title: const Text(
                                                            'Confirmação',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepPurple),
                                                          ),
                                                          content: const Text(
                                                            'Você tem certeza de que deseja recusar?',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepPurple),
                                                          ),
                                                          textOK: const Text(
                                                            'Sim',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.green),
                                                          ),
                                                          textCancel: const Text(
                                                            'Não',
                                                            style: TextStyle(
                                                                color: Colors.red),
                                                          ),
                                                        )) {
                                                          HorarioAgendado horarioX = snapshot.data?.elementAt(index);
                                                          _horariosAController
                                                              .excluirHorarioTemp(
                                                                  horarioX);
                                                          getHorariosTemp();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                            duration: Duration(
                                                                milliseconds: 2500),
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            backgroundColor:
                                                                Colors.deepPurple,
                                                            content: Text(
                                                              'Solicitação recusada com sucesso!',
                                                              textAlign:
                                                                  TextAlign.center,
                                                            ),
                                                          ));
                                                        }
                                                      },
                                                      child: const Text(
                                                        "Recusar",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                  const Padding(
                                                      padding: EdgeInsets.all(8)),
                                                  Expanded(
                                                    child: TextButton(
                                                      style: TextButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.lightGreen),
                                                      onPressed: () async {
                                                        if (await confirm(
                                                          context,
                                                          title: const Text(
                                                            'Confirmação',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepPurple),
                                                          ),
                                                          content: const Text(
                                                            'Você tem certeza de que deseja aceitar?',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .deepPurple),
                                                          ),
                                                          textOK: const Text(
                                                            'Sim',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.green),
                                                          ),
                                                          textCancel: const Text(
                                                            'Não',
                                                            style: TextStyle(
                                                                color: Colors.red),
                                                          ),
                                                        )) {
                                                          HorarioAgendado horarioX = snapshot.data?.elementAt(index);
                                                          horarioX.isTemp = 0;
                                                          _horariosAController
                                                              .atualizarHorarioTemp(
                                                                  horarioX);
                                                          getHorariosTemp();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                                  const SnackBar(
                                                            duration: Duration(
                                                                milliseconds: 2500),
                                                            behavior:
                                                                SnackBarBehavior
                                                                    .floating,
                                                            backgroundColor:
                                                                Colors.deepPurple,
                                                            content: Text(
                                                              'Solicitação aceitada com sucesso!',
                                                              textAlign:
                                                                  TextAlign.center,
                                                            ),
                                                          ));
                                                        }
                                                      },
                                                      child: const Text(
                                                        "Aceitar",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      ) : Center(
                        child: Column(
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
                          ),
                      );
        } 
      ) : Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(
                      color: Colors.deepPurple,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        'Carregando...',
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 18),
                      ),
                    )
                  ],
                )), 
                      );
  }
}
