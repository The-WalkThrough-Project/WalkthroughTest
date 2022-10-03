import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:walkthrough/modules/home/pages/index.dart';
import 'package:walkthrough/modules/loginProf/pages/index.dart';
import 'package:walkthrough/shared/providers/auth_provider.dart';
import 'package:walkthrough/shared/providers/firebaseAuth_provider.dart';

class HomeController extends StatelessWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FireBaseAuthProvider auth = FireBaseAuthProvider();

    return StreamBuilder(      
      stream: auth.onAuthStatedChanged,
      builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final bool signedIn = snapshot.hasData;
            return signedIn ? const HomePage() : const LoginPage();
          }
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            ),
        );
        }
    );
  }
}