import 'package:flutter/material.dart';

class CustForm extends StatefulWidget {
  const CustForm({Key? key}) : super(key: key);

  @override
  _CustFormState createState() => _CustFormState();
}

class _CustFormState extends State<CustForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        const SizedBox(height: 25.0),
      ],
    );
  }
}
