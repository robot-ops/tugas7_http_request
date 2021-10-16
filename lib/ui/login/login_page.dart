import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tugas7_http_request/ui/widget/cust_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustForm(),
    );
  }
}
