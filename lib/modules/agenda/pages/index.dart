import 'package:flutter/material.dart';
import 'package:walkthrough/modules/agenda/pages/calendarios.dart';
import 'package:walkthrough/modules/agenda/pages/horarios.dart';
import 'package:walkthrough/modules/home/pages/index.dart';
import 'package:walkthrough/modules/loginProf/controllers/controller.dart';
import 'package:walkthrough/modules/loginProf/models/prof_model.dart';
import 'package:walkthrough/modules/notificacoes/pages/index.dart';

class AgendaPage extends StatefulWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  State<AgendaPage> createState() => _AgendaPageState();
}

class _AgendaPageState extends State<AgendaPage> {
  UserProf currentUser = UserProf();
  final _controller = UserProfController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getDadosUser();
  }

  getDadosUser() async{
    setState(() {
      isLoading = true;
    });

    currentUser = await _controller.getDados();
    print('currentUser: '+ currentUser.toString());
    setState(() {
      currentUser;
    });

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _navegaEAtualiza(BuildContext context) async {
  final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificacaoPage()));

  if (!mounted) return;

  if(result != null){
    getDadosUser();
  }
}

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
          actions: 
          !isLoading ? currentUser.tipoUsuario == 'Gerenciador' ? [
            TextButton.icon(
              onPressed: () {
                _navegaEAtualiza(context);
              }, 
              icon: const Icon(Icons.notifications, color: Colors.white,), 
              label: const Text('')
            )
          ] : null : null,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Agendamento',
                height: 62,
                icon: Icon(Icons.calendar_month),
                iconMargin: EdgeInsets.only(bottom: 5),
              ),
              Tab(
                iconMargin: EdgeInsets.only(bottom: 5),
                text: 'Horários',
                height: 62,
                icon: Icon(Icons.access_time),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            !isLoading ? CalendariosPage(user: currentUser) : const Center(child: CircularProgressIndicator(color: Colors.deepPurple,)),
            !isLoading ? HorariosPage(user: currentUser) : const Center(child: CircularProgressIndicator(color: Colors.deepPurple,))
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
