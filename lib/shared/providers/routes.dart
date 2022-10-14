import 'package:flutter/material.dart';
import 'package:walkthrough/modules/checagemLogin/pages/checagem_login.dart';
import 'package:walkthrough/modules/checagemLogin/pages/checagem_novoLogin.dart';
import 'package:walkthrough/modules/notificacoes/pages/index.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list = <String, WidgetBuilder>{
    '/home': (_) => HomeController(),
    '/notificacao': (_) => NotificacaoPage(),
  };

  static String initial = '/home';

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}