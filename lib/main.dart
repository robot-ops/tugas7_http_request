import 'package:flutter/material.dart';
import 'package:tugas7_http_request/ui/homepage/homepage.dart';
import 'package:tugas7_http_request/ui/login/login_page.dart';

import 'ui/homepage/profile.dart';
import 'ui/homepage/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}
