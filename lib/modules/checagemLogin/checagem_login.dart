import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:walkthrough/modules/home/pages/index.dart';
import 'package:walkthrough/modules/loginProf/pages/index.dart';
import 'package:walkthrough/shared/providers/auth_provider.dart';
import 'package:walkthrough/shared/providers/firebaseAuth_provider.dart';

class HomeController extends StatelessWidget {
  const HomeController({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FireBaseAuthProvider? auth = Provider.of(context)?.auth;

    return StreamBuilder(
      stream: auth?.onAuthStatedChanged,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? HomePage() : LoginPage();
        }
        return Container(
          color: Colors.deepPurple,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}