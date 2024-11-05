import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quick_task/pages/AddTodo.dart';
import 'package:quick_task/pages/Profile.dart';
import 'package:quick_task/pages/dashboard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [Dashboard(), Addtodo(), Profile()];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey.shade300,
          height: 60,
          items: const <Widget>[
            Icon(
              Icons.home,
              size: 28,
              color: Color(0xFF3B9DD8),
            ),
            Icon(
              Icons.add_circle_outlined,
              size: 40,
              color: Colors.pink,
            ),
            Icon(
              Icons.person,
              size: 28,
              color: Color(0xFF3B9DD8),
            )
          ],
          index: _selectedIndex,
          onTap: _onTapped,
        ));
  }
}
