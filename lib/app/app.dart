import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:work_log/domain/log_repository.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/router/router.dart';
import 'package:work_log/theme/theme.dart';

class const App({required final LogRepository logRepository, super.key})
    extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: logRepository)],
      child: MaterialApp.router(
        theme: theme,
        localizationsDelegates: [
          ...AppLocalizations.localizationsDelegates,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: goRouter,
      ),
    );
  }
}
