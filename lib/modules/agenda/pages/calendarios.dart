import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:walkthrough/modules/agenda/controllers/controllerHorarioA.dart';
import 'package:walkthrough/modules/agenda/models/horario_agendado_model.dart';
import 'package:walkthrough/shared/components/campo_form/campo_form.dart';
import 'package:walkthrough/shared/components/campo_form/campo_form_horario.dart';

class CalendariosPage extends StatefulWidget {
  const CalendariosPage({Key? key}) : super(key: key);

  @override
  State<CalendariosPage> createState() => _CalendariosPageState();
}

class _CalendariosPageState extends State<CalendariosPage> {
  DateTime hoje = DateTime.now();
  Map<String, List<HorarioAgendado>>? selectedHorarios = {};

  DateTime _focusedDay = DateTime.now();
  late DateTime diaSelecionado;

  final _horariosAController = HorariosAgendadosController();

  String dropdownValue = '304';

  @override
  void initState() {
    super.initState();
    diaSelecionado = DateTime.now();
    getHorarios();
    _horariosAController.lab.text = dropdownValue;
  }

  getHorarios()async {
    selectedHorarios = await _horariosAController.getHorariosA();
    print('selected: '+ selectedHorarios.toString());
    setState(() {
      selectedHorarios;
    });
  }

  List<HorarioAgendado> _getEventsfromDay(DateTime data) {
    String data2 = data.toString().substring(0, 10);
    return selectedHorarios?[data2] ?? [];
  }

  @override
  void dispose() {
    _horariosAController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _horariosAController.getHorariosA(),
          builder: (context, snapshot) {
            return Center(
              child: ListView(
                children: [
                  TableCalendar(
                    eventLoader: _getEventsfromDay,
                    availableCalendarFormats: const {
                      CalendarFormat.month: 'Mês'
                    },
                    startingDayOfWeek: StartingDayOfWeek.sunday,
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: false,
                      weekendTextStyle:
                          TextStyle(color: Color.fromARGB(255, 211, 97, 89)),
                      selectedDecoration: BoxDecoration(
                          color: Colors.deepPurple, shape: BoxShape.circle),
                      todayDecoration: BoxDecoration(
                          color: Color.fromARGB(255, 190, 172, 221),
                          shape: BoxShape.circle),
                    ),
                    locale: 'pt_BR',
                    firstDay: firstDay(hoje),
                    lastDay: lastDay(hoje),
                    focusedDay: _focusedDay.weekday == 7
                        ? _focusedDay.subtract(const Duration(days: -1))
                        : _focusedDay.weekday == 6
                            ? _focusedDay.subtract(const Duration(days: -2))
                            : _focusedDay,
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (hoje) {
                      if (hoje.weekday != DateTime.sunday &&
                          hoje.weekday != DateTime.saturday) {
                        return isSameDay(diaSelecionado, hoje);
                      } else
                        return false;
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!isSameDay(diaSelecionado, selectedDay)) {
                        setState(() {
                          diaSelecionado = selectedDay;
                          _focusedDay = focusedDay;
                        });
                      }
                    },
                    onPageChanged: (focusedDay) {
                      _focusedDay = focusedDay;
                    },
                    calendarBuilders: CalendarBuilders(
                      disabledBuilder: ((context, day, focusedDay) {
                        String text = day.day.toString();
                        return Center(
                            child: Text(
                          text,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 211, 97, 89)),
                        ));
                      }),
                      dowBuilder: (context, day) {
                        if (day.weekday == DateTime.sunday) {
                          const text = "dom";

                          return const Center(
                            child: Text(
                              text,
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        } else if (day.weekday == DateTime.saturday) {
                          const text = "sáb";
                          return const Center(
                            child: Text(
                              text,
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                    ..._getEventsfromDay(diaSelecionado)
                        .map((HorarioAgendado horarioAgendado) => Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Text(
                                  "Horário: ${horarioAgendado.horarioInicial} às ${horarioAgendado.horarioFinal}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                subtitle: Text(
                                  "Professor: " +
                                      horarioAgendado.nomeProfessor +
                                      "\nLaboratório: " +
                                      horarioAgendado.lab,
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 199, 199, 199)),
                                ),
                                isThreeLine: true,
                                dense: true,
                                visualDensity: VisualDensity.comfortable,
                                tileColor: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            )),
                  const Padding(padding: EdgeInsets.all(50))
                ],
              ),
            );
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: FloatingActionButton.extended(
          onPressed: () => showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(25.0),
              ),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) => Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: CampoForm(
                          label: "Seu nome",
                          controller: _horariosAController.nomeProfessor),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(27, 0, 0, 0),
                              child: Text('Laboratório:',
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: StatefulBuilder(
                                builder: (context, setState) =>
                                    DropdownButton<String>(
                                  value: dropdownValue,
                                  icon: const Icon(
                                    Icons.expand_more_rounded,
                                    color: Colors.deepPurple,
                                  ),
                                  elevation: 10,
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  dropdownColor: Colors.white,
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue = newValue!;
                                      _horariosAController.lab.text =
                                          dropdownValue;
                                    });
                                  },
                                  items: <String>[
                                    '304',
                                    '602',
                                    '604',
                                    '606',
                                    '608',
                                    '609',
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Horário inicial da aula:',
                                style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 20, 0),
                                  child: CampoFormHorario(
                                      label: "07:00",
                                      controller:
                                          _horariosAController.horarioInicial)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Horário final da aula:',
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 0, 0),
                                  child: CampoFormHorario(
                                      label: "07:00",
                                      controller:
                                          _horariosAController.horarioFinal)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_horariosAController
                                      .nomeProfessor.text.isEmpty ||
                                  _horariosAController
                                      .horarioInicial.text.isEmpty ||
                                  _horariosAController
                                      .horarioFinal.text.isEmpty) {
                                MotionToast.error(
                                  title: const Text(
                                    'Erro',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  description:
                                      const Text("Preencha todos os campos!"),
                                  animationType: AnimationType.fromLeft,
                                  position: MotionToastPosition.top,
                                  barrierColor: Colors.black.withOpacity(0.3),
                                  width: 300,
                                  height: 80,
                                  dismissable: true,
                                ).show(context);
                              } else {
                                if (selectedHorarios?[diaSelecionado] != null) {
                                  var horarioC = HorarioAgendado(
                                        nomeProfessor: _horariosAController
                                            .nomeProfessor.text
                                            .trim(),
                                        horarioInicial: _horariosAController
                                            .horarioInicial.text
                                            .trim(),
                                        horarioFinal: _horariosAController
                                            .horarioFinal.text
                                            .trim(),
                                        lab: _horariosAController.lab.text
                                            .trim(),
                                        data: diaSelecionado.toString());
                                  _horariosAController.cadastraHorarios(horarioC);
                                } else {
                                    var horarioC = HorarioAgendado(
                                        nomeProfessor: _horariosAController
                                            .nomeProfessor.text
                                            .trim(),
                                        horarioInicial: _horariosAController
                                            .horarioInicial.text
                                            .trim(),
                                        horarioFinal: _horariosAController
                                            .horarioFinal.text
                                            .trim(),
                                        lab: _horariosAController.lab.text
                                            .trim(),
                                        data: diaSelecionado.toString());
                                  _horariosAController.cadastraHorarios(horarioC);
                                }
                                getHorarios();
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  duration: Duration(milliseconds: 1500),
                                  behavior: SnackBarBehavior.fixed,
                                  backgroundColor: Colors.deepPurple,
                                  content: Text(
                                    'Solicitação realizada com sucesso!',
                                    textAlign: TextAlign.center,
                                  ),
                                ));
                                _horariosAController.nomeProfessor.clear();
                                _horariosAController.horarioInicial.clear();
                                _horariosAController.horarioFinal.clear();
                                setState(() {
                                  dropdownValue = '304';
                                });
                              }
                              
                                
                              // print('LISTAAAA:' + selectedHorarios.toString());
                              // print(formatDate(diaSelecionado, [HH, ':', nn]));
                              // var horarios = _horariosAController
                              //     .getHorariosA()
                              //     .then((values) {
                              //   if (values == null) {
                              //     return;
                              //   }
                              //   for (var horario in values) {
                              //     print(horario.data);
                              //   }
                              // });
                              // print(_horariosAController.getHorariosA());
                              print(diaSelecionado.toString());
                              return;
                            },
                            child: const Text('Confirmar')),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          label: const Text("Solicitar Agendamento de Horário"),
          icon: const Icon(Icons.add),
          extendedIconLabelSpacing: 10,
          backgroundColor: Colors.deepPurple,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  DateTime firstDay(DateTime dateTime) {
    if (dateTime.weekday == 7) {
      return dateTime.subtract(const Duration(days: -1));
    } else if (dateTime.weekday == 6) {
      return dateTime.subtract(const Duration(days: -2));
    } else
      return dateTime;
  }

  DateTime lastDay(DateTime dateTime) {
    return dateTime.subtract(const Duration(days: -30));
  }
}
