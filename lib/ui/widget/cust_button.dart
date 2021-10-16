import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustButton extends StatelessWidget {
  const CustButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
        ),
        onPressed: () {},
        child: const Text(
          'Login',
          style: TextStyle(
            color: Color(0xFF2772CE),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
