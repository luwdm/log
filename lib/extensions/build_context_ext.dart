import 'package:flutter/widgets.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';

extension BuildContextExt on BuildContext {
  /// Returns the localized messages.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
