import 'package:database/database.dart';
import 'package:flutter/material.dart';
import 'package:task_repository/task_repository.dart';
import 'package:work_log/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = Database();
  final taskRepository = TaskRepository(database: database);

  runApp(App(taskRepository: taskRepository));
}
