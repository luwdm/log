import 'package:work_log/database/daos/log_dao.dart';
import 'package:work_log/database/database.dart';

class const LogRepository(final LogDao _logDao) {
  Stream<List<LogTableData>> watch() => _logDao.watch();

  Future<void> add({
    required String accomplishments,
    required String improvements,
    required String ideas,
    required String nextThings,
  }) async {
    // TODO: Add create logic here.
  }
}
