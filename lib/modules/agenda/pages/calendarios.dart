import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:walkthrough/modules/agenda/controllers/controller.dart';

class CalendariosPage extends StatefulWidget {
  const CalendariosPage({Key? key}) : super(key: key);

  @override
  State<CalendariosPage> createState() => _CalendariosPageState();
}

class _CalendariosPageState extends State<CalendariosPage> {
  DateTime hoje = DateTime.now();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? diaSelecionado;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TableCalendar(
        
        availableCalendarFormats: const {
          CalendarFormat.month: 'Mês'
        },
        startingDayOfWeek: StartingDayOfWeek.sunday,
        calendarStyle: const CalendarStyle(
          outsideDaysVisible: false,
          weekendTextStyle: TextStyle(color: Color.fromARGB(255, 211, 97, 89)),
          selectedDecoration:
              BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
          todayDecoration: BoxDecoration(
              color: Color.fromARGB(255, 190, 172, 221),
              shape: BoxShape.circle),
        ),
        locale: 'pt_BR',
        firstDay: firstDay(hoje),
        lastDay: lastDay(hoje),
        focusedDay: _focusedDay.weekday == 7 ? _focusedDay.subtract(Duration(days: -1)) : _focusedDay.weekday == 6 ? _focusedDay.subtract(Duration(days: -2)) : _focusedDay,
        calendarFormat: CalendarFormat.month,
        selectedDayPredicate: (hoje) {
          if(hoje.weekday != DateTime.sunday && hoje.weekday != DateTime.saturday) {
            return isSameDay(diaSelecionado, hoje);
          } else return false;
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
            return Center(child: Text(text, style: TextStyle(color: Color.fromARGB(255, 211, 97, 89)),));
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
      
    );
  }

  DateTime firstDay(DateTime dateTime) {

      /*if (dateTime.weekday == 1) {
        return dateTime;
      } else if (dateTime.weekday == 2) {
        return dateTime.subtract(const Duration(days: 1));
      } else if (dateTime.weekday == 3) {
        return dateTime.subtract(const Duration(days: 2));
      } else if (dateTime.weekday == 4) {
        return dateTime.subtract(const Duration(days: 3));
      } else if (dateTime.weekday == 5) {
        return dateTime.subtract(const Duration(days: 4));
      } else if (dateTime.weekday == 6) {
        return dateTime.subtract(const Duration(days: 5));
      } else {
        return dateTime.subtract(const Duration(days: 6));
      }*/
      if(dateTime.weekday == 7){
        return dateTime.subtract(Duration(days: -1));
      } else if(dateTime.weekday == 6){
        return dateTime.subtract(Duration(days: -2));
      } else return dateTime; 

    }

    DateTime lastDay(DateTime dateTime) {
      return dateTime.subtract(Duration(days: -30));
    }

}
