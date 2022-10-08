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
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = UserProfController();
  final FireBaseAuthProvider auth = FireBaseAuthProvider();
  UserProf user = UserProf();
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
    getDados1();
  }

  getDados1() async {
    final user = await _controller.getDados(context);
    print(user);
    mounted ?
    setState(() {
      user;
    }):
    user.nome != null && user.nome!.isNotEmpty && user.nome != '' && mounted
        ? setState(() {
          WidgetsBinding.instance.addPostFrameCallback((_){
            showsnackbar('Bem vindo ${user.nome}!', context);
          });
          })
        : null;
  }

  showsnackbar(String message, context) {
    final snackbar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.deepPurple,
      duration: const Duration(milliseconds: 2200),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
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

    return StreamBuilder(
        stream: auth.onAuthStatedChanged,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                snapshot.hasData ? 'Bem vindo ' : 'Início',
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
                          builder: (context) => const PerfilPage(),
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
                      showNotification();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AgendaPage()));
                    },
                  ),
                  botao("Acesso", onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BluetoothApp()));
                  }),
                ],
              ),
            ),
          );
        });
  }
}
