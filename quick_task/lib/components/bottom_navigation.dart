import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:quick_task/pages/AddTodo.dart';
import 'package:quick_task/pages/Profile.dart';
import 'package:quick_task/pages/dashboard.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  late PageController _pageController = PageController();

  final List<Widget> _pages = [
    Dashboard(),
    Addtodo(),
    Center(
      child: Text('Profile Page'),
    )
  ];

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [Dashboard(), Addtodo(), Profile()],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.grey.shade300,
        height: 60,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 28,
            color: Colors.blue,
          ),
          Icon(
            Icons.add_circle_outlined,
            size: 40,
            color: Colors.pink,
          ),
          Icon(
            Icons.person,
            size: 28,
            color: Colors.blue,
          )
        ],
        onTap: (index) {},
      ),
    );
  }
}
