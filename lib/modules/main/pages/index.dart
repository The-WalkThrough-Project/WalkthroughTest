import 'package:flutter/material.dart';

import 'sobre.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Walkthrough"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Text("Sobre nós", style: TextStyle(fontSize: 18),),
          ),
          onPressed: (){
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const SobrePage())
            );
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            )
          ),
        )
      ),
    );
  }
}