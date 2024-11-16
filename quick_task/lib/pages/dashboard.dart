import 'package:flutter/material.dart';
import 'package:quick_task/components/dashboard_top_section.dart';
import 'package:quick_task/components/todo_list.dart';
import 'package:quick_task/models/todo_model.dart';
import 'package:quick_task/services/todo_services.dart';
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

  Future<List<TodoModel>?>? _futureTodos;

  @override
  void initState() {
    super.initState();
    _futureTodos = _fetchTodoData();
  }

  Future<List<TodoModel>?> _fetchTodoData() async {
    TodoServices todoServices = TodoServices();
    final response = await todoServices.fetchTodo();
    return response;
  }

  Color getPriorityColor(String priority) {
    switch (priority) {
      case 'Low':
        return Colors.green;
      case 'Medium':
        return Colors.orangeAccent;
      case 'High':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
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
                ),
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
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20),
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
                            ),
                          ),
                        ),
                        FutureBuilder(
                            future: _futureTodos,
                            builder: (context, snapshot) {
                              // Handle different states of the future
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (snapshot.hasData) {
                                final todos = snapshot.data!;

                                return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: todos.length,
                                    itemBuilder: (context, index) {
                                      final todo = todos[index];
                                      return TodoList(
                                          size: size,
                                          isCompleted: todo.is_completed,
                                          todo: todo.title,
                                          color:
                                              getPriorityColor(todo.priority),
                                          time: todo.time,
                                          priority: todo.priority);
                                    });
                              } else {
                                return Center(child: Text('No data available'));
                              }
                            }),
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
