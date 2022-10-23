import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:walkthrough/modules/agenda/pages/index.dart';
import 'package:walkthrough/modules/home/pages/perfil.dart';
import 'package:walkthrough/modules/home/pages/sobre.dart';
import 'package:walkthrough/modules/loginProf/controllers/controller.dart';
import 'package:walkthrough/modules/loginProf/models/prof_model.dart';
import 'package:walkthrough/shared/providers/firebaseAuth_provider.dart';
import 'package:walkthrough/shared/providers/notifications/notification_service.dart';

import '../../acesso/pages/index.dart';

class HomePage extends StatefulWidget {
  final UserProf usuario;

  const HomePage({Key? key, required this.usuario}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = UserProfController();
  bool valor = false;

  showNotification() {
    setState(() {
      valor = !valor;
      if (valor) {
        Provider.of<NotificationService>(context, listen: false)
            .showNotification(CustomNotification(
                id: 1,
                title: 'Teste',
                body: 'Acesse o app!',
                payload: '/notificacao'));
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget botao(String texto, {void Function()? onPressed}) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              texto,
              style: const TextStyle(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(300, 90),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(color: Colors.deepPurple),
              ),
            ),
          ));
    }

    return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Bem vindo, ${widget.usuario.nome}!',
              ),
              actions: <Widget>[
                TextButton.icon(
                  icon: const Icon(
                    Icons.question_mark,
                    color: Colors.white,
                  ),
                  label: Text(""),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SobrePage(),
                        ));
                  },
                ),
                TextButton.icon(
                  icon: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(""),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PerfilPage(usuario: widget.usuario),
                        ));
                  },
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  botao(
                    "Agenda",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AgendaPage(usuario: widget.usuario)));
                    },
                  ),
                  botao("Acesso", onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BluetoothApp(/*usuario: widget.usuario*/)));
                  }),
                ],
              ),
            ),
          );
  }
}
