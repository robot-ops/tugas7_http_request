import 'package:flutter/material.dart';
import 'package:tugas7_http_request/ui/widget/cust_button.dart';
import 'package:tugas7_http_request/ui/widget/cust_form.dart';
import 'package:tugas7_http_request/ui/widget/cust_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: CustForm(),
    );
  }
}
