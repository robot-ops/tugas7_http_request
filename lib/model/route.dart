import 'package:flutter/widgets.dart';
import 'package:tugas7_http_request/ui/homepage/homepage.dart';
import 'package:tugas7_http_request/ui/login/login_page.dart';

class AppRoute {
  static const String loginRoute = '/login';
  static const String homeRoute = '/homepage';
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    loginRoute: (BuildContext context) {
      return const LoginPage();
    },
    homeRoute: (BuildContext context) {
      return const HomePage();
    },
  };
}
