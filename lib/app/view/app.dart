import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_repository/task_repository.dart';
import 'package:work_log/add_task/add_task.dart';
import 'package:work_log/board/board.dart';
import 'package:work_log/l10n/arb/app_localizations.dart';
import 'package:work_log/theme/theme.dart';

class App extends StatelessWidget {
  const App({required this._taskRepository, super.key});

  final TaskRepository _taskRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: _taskRepository)],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: theme,
        home: const _AppBody(),
      ),
    );
  }
}

class _AppBody extends StatefulWidget {
  const _AppBody();

  @override
  State<_AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<_AppBody> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            leading: FloatingActionButton(
              elevation: 0,
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (context) => const AddTaskDialog(),
                );
                // Add your onPressed code here!
              },
              child: const Icon(Icons.add),
            ),
            labelType: NavigationRailLabelType.all,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.calendar_today_outlined),
                selectedIcon: Icon(Icons.calendar_today),
                label: Text('Tasks'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.book_outlined),
                selectedIcon: Icon(Icons.book),
                label: Text('Log'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(child: BoardPage()),
        ],
      ),
    );
  }
}
