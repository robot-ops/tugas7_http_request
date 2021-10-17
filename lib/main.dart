import 'package:flutter/material.dart';
import 'package:tugas7_http_request/ui/homepage/homepage.dart';
import 'package:tugas7_http_request/ui/login/login_page.dart';
import 'package:tugas7_http_request/ui/widget/custom_navigation.dart';

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
      home: const HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPage = 0;
  final pageOptions = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog App'),
      ),
      backgroundColor: Colors.white,
      body: pageOptions[selectedPage],
      bottomNavigationBar: CustomNavigation(
        selectedNavbar: selectedPage,
      ),
    );
  }
}
