import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:work_log/domain/date_time_extensions.dart';
import 'package:work_log/domain/task_repository.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/task_board/task_board.dart';

import '../helpers/fake_task_repository.dart';

void main() {
  Future<void> pumpBoard(WidgetTester tester, TaskRepository repository) {
    return tester.pumpWidget(
      RepositoryProvider.value(
        value: repository,
        child: const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: TaskBoardPage(),
        ),
      ),
    );
  }

  testWidgets('shows a column for each day with its tasks', (tester) async {
    tester.view.physicalSize = const Size(2400, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final repository = FakeTaskRepository();
    await repository.upsert(
      title: 'Write report',
      description: 'Quarterly numbers',
      date: DateTime.now().startOfWeek.addDays(2),
    );

    await pumpBoard(tester, repository);
    await tester.pump();

    expect(find.byType(TaskBoardColumn), findsNWidgets(7));
    expect(find.text('Monday'), findsOneWidget);
    expect(find.text('Sunday'), findsOneWidget);
    expect(find.text('Write report'), findsOneWidget);
    expect(find.text('Quarterly numbers'), findsOneWidget);
    expect(find.text('No tasks'), findsNWidgets(6));
  });

  testWidgets('navigates between weeks', (tester) async {
    await pumpBoard(tester, FakeTaskRepository());
    await tester.pump();

    final bloc = BlocProvider.of<TaskBoardBloc>(
      tester.element(find.byType(TaskBoardPageView)),
    );
    final currentWeek = DateTime.now().startOfWeek;

    // Switching weeks cancels the previous subscription, which needs real
    // asynchronous gaps instead of the fake async zone of widget tests.
    Future<void> tapAndSettle(Finder finder) async {
      await tester.tap(finder);
      await tester.runAsync(() => Future<void>.delayed(Duration.zero));
      await tester.pump();
    }

    await tapAndSettle(find.byTooltip('Next week'));
    expect(bloc.state.weekStart, currentWeek.addDays(7));
    expect(find.text('No tasks'), findsWidgets);

    await tapAndSettle(find.byTooltip('Previous week'));
    await tapAndSettle(find.byTooltip('Previous week'));
    expect(bloc.state.weekStart, currentWeek.addDays(-7));

    await tapAndSettle(find.text('Today'));
    expect(bloc.state.weekStart, currentWeek);
  });
}
