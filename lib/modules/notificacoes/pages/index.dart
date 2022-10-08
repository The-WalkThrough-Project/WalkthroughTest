import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:walkthrough/modules/home/pages/index.dart';

class NotificacaoPage extends StatefulWidget {
  const NotificacaoPage({Key? key}) : super(key: key);

  @override
  State<NotificacaoPage> createState() => _NotificacaoPageState();
}

class _NotificacaoPageState extends State<NotificacaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificação'),
        actions: <Widget>[
          TextButton.icon(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage()
                    ), ((route) => true));
              },
              icon: const Icon(Icons.house, color: Colors.white,),
              label: const Text(''))
        ],
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          title: const Text(
            'Aqui está sua notificação:',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            'NOTIFICAÇÃO DE TESTE',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color.fromARGB(255, 168, 168, 168)),
          ),
          tileColor: Colors.deepPurple,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      )),
    );
  }
}
