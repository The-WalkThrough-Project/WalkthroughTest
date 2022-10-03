import 'package:flutter/material.dart';
import 'package:walkthrough/modules/checagemLogin/checagem_login.dart';
import 'package:walkthrough/modules/loginProf/pages/index.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WalkThrough',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto'
      ),
      home: HomeController(),
    );
  }
}

