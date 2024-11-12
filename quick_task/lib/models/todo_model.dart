import 'package:quick_task/models/category_model.dart';
import 'package:quick_task/models/user_model.dart';

class TodoModel {
  final String title;
  final String priority;
  final CategoryModel category;
  final DateTime date;
  final DateTime time;

  TodoModel({
    required this.title,
    required this.priority,
    required this.category,
    required this.date,
    required this.time,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'],
      priority: json['priority'],
      category: CategoryModel(category: json['category']),
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
    );
  }
}
