// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get addProject => 'Add Project';

  @override
  String get addTask => 'Add Task';

  @override
  String get cancel => 'Cancel';

  @override
  String get add => 'Add';

  @override
  String get update => 'Update';

  @override
  String get title => 'Title';

  @override
  String get tasks => 'Tasks';

  @override
  String get whatDidYouAccomplishToday => 'What did you accomplish today?';

  @override
  String get whatCanYouImproveOptional => 'What can you improve? (optional)';

  @override
  String get anyIdeasOptional => 'Any ideas? (optional)';

  @override
  String get whatsTheNextStep => 'What\'s the next step?';

  @override
  String get addLog => 'Add Log';

  @override
  String get accomplishments => 'Accomplishments';

  @override
  String get nextStep => 'Next step';

  @override
  String get ideas => 'Ideas';

  @override
  String get plannedImprovements => 'Planned improvements';

  @override
  String get logs => 'Logs';

  @override
  String get logsterIntro =>
      'Logster is a journal app that helps you to track your daily accomplishments, your ideas to improve and planning the next big step for your day.';

  @override
  String get intro => 'Intro';

  @override
  String logDateFormat(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.MMMMEEEEd(
      localeName,
    );
    final String dateString = dateDateFormat.format(date);

    return '$dateString';
  }
}
