import 'package:flutter/material.dart';
import 'package:work_log/app/app.dart';
import 'package:work_log/database/daos/log_dao.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/domain/log_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = Database();
  final logRepository = LogRepository(LogDao(database));

  runApp(App(logRepository: logRepository));
}
