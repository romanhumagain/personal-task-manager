import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoList extends StatefulWidget {
  final Size size;
  final bool isCompleted;
  final String todo;
  final Color color;
  final DateTime time;
  final String priority;

  const TodoList(
      {super.key,
      required this.size,
      required this.isCompleted,
      required this.todo,
      required this.color,
      required this.time,
      required this.priority});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  String formatTime(DateTime time) {
    final DateFormat dateFormat = DateFormat("dd MMM hh:mm a"); // AM/PM format
    return dateFormat.format(time);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: Material(
              borderRadius: BorderRadius.circular(12),
              elevation: 2,
              child: Container(
                padding: EdgeInsets.only(right: 12),
                height: 65,
                width: widget.size.height / 2.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.tertiary),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Container(
                        height: 55,
                        width: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: widget.color,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                widget.isCompleted
                                    ? Icons.check_circle
                                    : Icons.circle_outlined,
                                color: Colors.green,
                                size: 24,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                formatTime(widget.time),
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                    fontSize: 13),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                widget.todo,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary
                                        .withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12, left: 5),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(50),
              child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
