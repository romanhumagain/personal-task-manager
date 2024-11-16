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
    Profile(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
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
    final theme = Theme.of(context);

    // Ensure a non-nullable Color is passed to backgroundColor
    final backgroundColor = theme.brightness == Brightness.dark
        ? Colors.grey[850] ?? Colors.black // Fallback color for dark mode
        : theme.bottomNavigationBarTheme.backgroundColor ??
            Colors.grey.shade200;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      // Ensure scaffold bg is set properly
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: backgroundColor, // Adjust the background color here
        height: 60,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 28,
            color: theme.colorScheme.primary,
          ),
          Icon(
            Icons.add_circle_outlined,
            size: 40,
            color: theme.colorScheme.secondary,
          ),
          Icon(
            Icons.person,
            size: 28,
            color: theme.colorScheme.primary,
          ),
        ],
        onTap: _onTapped,
      ),
    );
  }
}
