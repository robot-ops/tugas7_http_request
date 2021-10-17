import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomNavigation extends StatelessWidget {
  const CustomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.indigo.shade900,
      backgroundColor: Colors.white,
      buttonBackgroundColor: Colors.indigo.shade900,
      animationDuration: Duration(milliseconds: 300),
      animationCurve: Curves.bounceInOut,
      height: 50,
      index: 0,
      items: [
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.search, size: 30, color: Colors.white),
        Icon(Icons.person, size: 30, color: Colors.white),
      ],
      onTap: (index) {
        print('$index');
      },
    );
  }
}
