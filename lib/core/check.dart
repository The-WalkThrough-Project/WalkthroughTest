import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:walkthrough/core/app.dart';

class FirebaseAppInit extends StatelessWidget {
  FirebaseAppInit({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return const Center(
            child: Text("Ocorreu um erro ao inicializar o Firebase!"),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return Container(
          color: Colors.deepPurple,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    );
  }
}