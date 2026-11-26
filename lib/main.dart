import 'package:material_ui/material_ui.dart';
import 'package:work_log/app/app.dart';
import 'package:work_log/database/daos/log_dao.dart';
import 'package:work_log/database/daos/task_dao.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/domain/log_repository.dart';
import 'package:work_log/domain/task_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = Database();
  final logRepository = LogRepository(LogDao(database));
  final taskRepository = TaskRepository(TaskDao(database));

  runApp(App(logRepository: logRepository, taskRepository: taskRepository));
}
