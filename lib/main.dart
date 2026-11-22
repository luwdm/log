import 'package:material_ui/material_ui.dart';
import 'package:work_log/app/app.dart';
import 'package:work_log/data/data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = Database();
  final logRepository = LogRepository(LogDao(database));

  runApp(App(logRepository: logRepository));
}
