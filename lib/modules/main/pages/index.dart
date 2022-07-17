import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:walkthrough/modules/loginCoord/pages/index.dart';
import 'package:walkthrough/modules/loginProf/pages/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
          'Início',
        style: TextStyle(fontSize: 20),
      )),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.05),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Walk Through",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 70,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(_createRoute2());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      side: const BorderSide(
                          width: 5, color: Colors.deepPurple),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Coordenador',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(_createRoute1());
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      side: const BorderSide(
                          width: 5, color: Colors.deepPurple),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text('Professor',
                        style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
Route _createRoute1() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => RouteProfessor(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => RouteCoordenador(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}


/*class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Laboratórios',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: btnTurma('608', context),
          ),
          btnTurma('606', context),
          btnTurma('604', context),
          btnTurma('602', context),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             const SizedBox(
              height: 64,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                ),
                child: Text("MENU", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: ListTile(
                onTap: () {},
                title: const Text("Agenda", 
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                  ),
                ),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ), 
    );
  }
}
Widget btnTurma(String texto, BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width*0.55,
        height: 100,
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(_createRoute());
          },
            style: ElevatedButton.styleFrom(
              primary:  const Color.fromRGBO(21, 0, 112, 44),
                side: const BorderSide(
                  width: 5, 
                  color: Color.fromRGBO(21, 0, 112, 44)
                ),
                shape: RoundedRectangleBorder( 
                  borderRadius: BorderRadius.circular(5),
                ),
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(texto)
            ],
          )
        ),
      ),
    ],
  );
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laboratório 602 - Agenda de horários'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime(2022, 06, 26),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 95),
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.5,
              height: 80,
              child: ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                    side: const BorderSide(
                      width: 3.5, 
                      color: Color.fromRGBO(21, 0, 112, 44)
                    ),
                    shape: RoundedRectangleBorder( 
                      borderRadius: BorderRadius.circular(5),
                    ),
                ),
                child: const Text(
                  'Não há horários cadastrados para o laboratório 602 nesse dia',
                  style: TextStyle(
                    color: Color.fromRGBO(21, 0, 112, 44),
                    fontWeight: FontWeight.bold
                  ),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}
*/