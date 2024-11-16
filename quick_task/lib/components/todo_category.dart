import 'package:flutter/material.dart';

class TodoCategory extends StatefulWidget {
  final Color color;
  final String category;

  const TodoCategory({super.key, required this.color, required this.category});

  @override
  State<TodoCategory> createState() => _TodoCategoryState();
}

class _TodoCategoryState extends State<TodoCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 4,
        child: Container(
          height: 45,
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(
              widget.category,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
