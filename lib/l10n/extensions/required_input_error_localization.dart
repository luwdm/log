import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/upsert_log/upsert_log.dart';

extension RequiredInputErrorL10n on RequiredInputError {
  String localized(AppLocalizations l10n) => switch (this) {
    .required => l10n.thisFieldIsRequired,
  };
}
