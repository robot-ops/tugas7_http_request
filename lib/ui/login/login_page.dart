import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas7_http_request/constants/const.dart';
import 'package:tugas7_http_request/model/reqres_login.dart';
import 'package:tugas7_http_request/model/route.dart';
import 'package:tugas7_http_request/service/api_manager.dart';
import 'package:tugas7_http_request/ui/widget/cust_form.dart';
import 'package:tugas7_http_request/ui/widget/cust_logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controllerEmail;
  late TextEditingController _controllerPassword;
  bool _showPassword = true;
  bool _onSend = false;

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          children: _listTextInput(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(_onSend ? Icons.clear : Icons.login),
        onPressed: _onSend ? null : _login,
        label: Text(_onSend ? 'loading...' : 'Login'),
      ),
    );
  }

  List<Widget> _listTextInput() {
    return <Widget>[
      Logo(),
      CustomForm(
        controller: _controllerEmail,
        labelText: 'Email',
        suffixIconData: Icons.info,
        onPressedIcon: () {
          _controllerEmail.text = Constant.trueEmail;
        },
        keyboardType: TextInputType.emailAddress,
        enable: !_onSend,
      ),
      CustomForm(
        controller: _controllerPassword,
        labelText: 'Password',
        suffixIconData: _showPassword ? Icons.visibility_off : Icons.visibility,
        onPressedIcon: () {
          setState(() => _showPassword = !_showPassword);
        },
        keyboardType: TextInputType.visiblePassword,
        obscureText: _showPassword,
        enable: !_onSend,
      ),
    ];
  }

  Future<void> _login() async {
    setState(() => _onSend = true);
    ReqResLogin _reqResLogin = await ApiClients.getToken(
      email: _controllerEmail.text,
      password: _controllerPassword.text,
    );
    if (_reqResLogin.token?.isNotEmpty ?? false) {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      await _preferences.setString(Constant.keyToken, _reqResLogin.token!);
      Navigator.pushReplacementNamed(
        context,
        AppRoute.homeRoute,
        arguments: _reqResLogin.token,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _reqResLogin.error ?? 'Oops! Something went wrong...',
          ),
        ),
      );
    }
    setState(() => _onSend = false);
  }
}
