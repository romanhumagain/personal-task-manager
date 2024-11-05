import 'package:flutter/material.dart';
import 'package:quick_task/components/dashboard_top_section.dart';
import 'package:quick_task/components/todo_list.dart';

import '../components/bottom_navigation.dart';
import '../components/todo_category.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List category = ["Flutter", "C#", "Blogify", "MongoDB", "Django"];
  final List<Color> colorList = [
    Colors.blue.shade400,
    Colors.grey.shade300,
    Colors.grey,
    Colors.green,
    Colors.deepOrange
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardTopSection(
              size: size,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Task Category",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
            ),
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  height: 60,
                  width: size.width / 1.15,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        return TodoCategory(
                            color: Color(0xFF3B9DD8),
                            category: category[index]);
                      }),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3), // Adjust the shadow position
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.add_circle_outlined,
                    size: 35,
                    color: Colors.pink,
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.grey.shade400,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Today - A L L ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
                          ),
                        ),
                        TodoList(
                          size: size,
                          isCompleted: true,
                          todo: "Completing Elevator GUI",
                          color: Colors.red,
                        ),
                        TodoList(
                          size: size,
                          isCompleted: false,
                          todo: "Authentication in the QuickTask",
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
