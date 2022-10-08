import 'package:flutter/material.dart';
import 'package:walkthrough/modules/agenda/pages/calendarios.dart';
import 'package:walkthrough/modules/agenda/pages/horarios.dart';
import 'package:walkthrough/modules/home/pages/index.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Agenda dos laboratórios',
            style: TextStyle(fontSize: 18),
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.calendar_month),
              ),
              Tab(
                icon: Icon(Icons.access_time),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            CalendariosPage(),
            HorariosPage()
          ],
        ),
      ),
    );
  }
}

/*Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: 80,
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side: const BorderSide(
                                  width: 3.5,
                                  color: Color.fromARGB(255, 98, 55, 172)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'Não há horários cadastrados para o laboratório nesse dia',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 98, 55, 172),
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),*/
