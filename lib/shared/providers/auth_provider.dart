import 'package:flutter/material.dart';
import 'package:walkthrough/shared/providers/firebaseAuth_provider.dart';

class Provider extends InheritedWidget {
  final FireBaseAuthProvider? auth;

  const Provider({
    Key? key,
    required Widget child,
    this.auth,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWiddget) {
    return true;
  }

  static Provider? of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>());
}