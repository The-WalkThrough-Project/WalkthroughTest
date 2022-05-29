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
      appBar: AppBar(title: const Text("WalkThrough")),    
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