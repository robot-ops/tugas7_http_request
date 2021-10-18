import 'package:flutter/widgets.dart';
import 'package:tugas7_http_request/ui/homepage/homepage.dart';
import 'package:tugas7_http_request/ui/homepage/search.dart';
import 'package:tugas7_http_request/ui/login/login_page.dart';

class AppRoute {
  static const String login = '/login';
  static const String home = '/homepage';
  static const String search = '/search';
  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    login: (BuildContext context) {
      return const LoginPage();
    },
    home: (BuildContext context) {
      return const HomePage();
    },
    search: (BuildContext context) {
      return const SearchPage();
    },
  };
}
