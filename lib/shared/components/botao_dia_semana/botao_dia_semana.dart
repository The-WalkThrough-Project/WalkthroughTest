import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BotaoDiaSemana extends StatefulWidget {
  final String texto;
 /* final String lab;*/
  
  BotaoDiaSemana({Key? key, required this.texto, /*required this.lab*/}) : super(key: key);

  @override
  State<BotaoDiaSemana> createState() => _BotaoDiaSemanaState();
}

class _BotaoDiaSemanaState extends State<BotaoDiaSemana> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: TextButton(
        onPressed: () {}, 
        child: Text(widget.texto, style: TextStyle(color: Colors.white, fontSize: 12),)
      ),
    );
  }
}