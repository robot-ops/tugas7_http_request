import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tugas7_http_request/ui/homepage/homepage.dart';
import 'package:tugas7_http_request/ui/homepage/profile.dart';
import 'package:tugas7_http_request/ui/homepage/search.dart';

class CustomNavigation extends StatelessWidget {
  int selectedNavbar;
  CustomNavigation({Key? key, required this.selectedNavbar}) : super(key: key);

  void _changeSelectedNavbar(int index) {
    setState(() {
      selectedNavbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Colors.indigo.shade900,
      backgroundColor: Colors.white,
      buttonBackgroundColor: Colors.indigo.shade900,
      animationDuration: const Duration(milliseconds: 300),
      animationCurve: Curves.bounceInOut,
      height: 50,
      index: selectedNavbar,
      items: const [
        Icon(Icons.home, size: 30, color: Colors.white),
        Icon(Icons.search, size: 30, color: Colors.white),
        Icon(Icons.person, size: 30, color: Colors.white),
      ],
      onTap: _changeSelectedNavbar,
    );
  }
}

void setState(Null Function() param0) {}
