import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class QuemSomosPage extends StatefulWidget {
  const QuemSomosPage({Key? key}) : super(key: key);

  @override
  State<QuemSomosPage> createState() => _QuemSomosPageState();
}

class _QuemSomosPageState extends State<QuemSomosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quem Somos"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/guilherme.png"),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          const Text("Guilherme Alvarenga de Azevedo", 
            style: TextStyle(
                fontSize: 15,
                color: Colors.deepPurple
              ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/pedro.png"),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          const Text("Pedro Militão Mello Reis", 
            style: TextStyle(
                fontSize: 15,
                color: Colors.deepPurple
              ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/rafael.png"),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          const Text("Rafael Morais de Carvalho", 
            style: TextStyle(
                fontSize: 15,
                color: Colors.deepPurple
              ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("assets/images/thulio.png"),
                    fit: BoxFit.contain),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: const Text("Thúlio Carvalho Dias", 
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurple
                ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
