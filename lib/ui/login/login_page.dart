import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas7_http_request/constants/const.dart';
import 'package:tugas7_http_request/model/reqres_login.dart';
import 'package:tugas7_http_request/model/route.dart';
import 'package:tugas7_http_request/service/api_manager.dart';
import 'package:tugas7_http_request/ui/homepage/homepage.dart';
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
  bool _onClick = false;

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8.0),
        children: _listTextInput(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(_onClick ? Icons.clear : Icons.login),
        onPressed: _onClick ? null : _login,
        label: Text(_onClick ? 'loading...' : 'Login'),
      ),
    );
  }

  List<Widget> _listTextInput() {
    return <Widget>[
      const Logo(),
      CustomForm(
        controller: _controllerEmail,
        labelText: 'Email',
        keyboardType: TextInputType.emailAddress,
        enable: !_onClick,
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
        enable: !_onClick,
      ),
      const SizedBox(height: 25),
      Divider(),
      const Center(
        child: Text(
          'Or',
          style: TextStyle(fontSize: 15),
        ),
      ),
      Divider(),
      const SizedBox(height: 25),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          ),
          child: const Text('Continue Without Login'),
        ),
      ),
    ];
  }

  Future<void> _login() async {
    setState(() => _onClick = true);
    ReqResLogin _reqResLogin = await LoginApi.getToken(
      email: _controllerEmail.text,
      password: _controllerPassword.text,
    );
    if (_reqResLogin.token?.isNotEmpty ?? false) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      await sharedPreferences.setString(Constant.keyToken, _reqResLogin.token!);
      Navigator.pushReplacementNamed(
        context,
        AppRoute.home,
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
    setState(() => _onClick = false);
  }
}
