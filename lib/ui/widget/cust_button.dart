import 'package:flutter/material.dart';

class CustButton extends StatelessWidget {
  const CustButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: MaterialButton(
        onPressed: () {},
        color: Colors.blueAccent,
        minWidth: 200.0,
        height: 40.0,
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
