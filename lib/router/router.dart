import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/domain/models/task.dart';
import 'package:work_log/logs/logs.dart';
import 'package:work_log/task_board/task_board.dart';
import 'package:work_log/upsert_log/upsert_log.dart';
import 'package:work_log/upsert_task/upsert_task.dart';

part 'router.g.dart';

final goRouter = GoRouter(initialLocation: '/logs', routes: $appRoutes);

@TypedGoRoute<LogsRoute>(
  path: '/logs',
  routes: [
    TypedGoRoute<AddLogRoute>(path: 'add'),
    TypedGoRoute<UpdateLogRoute>(path: 'details'),
  ],
)
class const LogsRoute() extends GoRouteData with $LogsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LogsPage();
  }
}

class const AddLogRoute() extends GoRouteData with $AddLogRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UpsertLogPage();
  }
}

class const UpdateLogRoute({required final LogTableData $extra})
    extends GoRouteData
    with $UpdateLogRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UpsertLogPage(log: $extra);
  }
}

@TypedGoRoute<TaskBoardRoute>(
  path: '/tasks',
  routes: [
    TypedGoRoute<AddTaskRoute>(path: 'add'),
    TypedGoRoute<UpdateTaskRoute>(path: 'details'),
  ],
)
class const TaskBoardRoute() extends GoRouteData with $TaskBoardRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TaskBoardPage();
  }
}

/// Adds a task to the day [date].
class const AddTaskRoute({required final DateTime date})
    extends GoRouteData
    with $AddTaskRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UpsertTaskPage(date: date);
  }
}

class const UpdateTaskRoute({required final Task $extra})
    extends GoRouteData
    with $UpdateTaskRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UpsertTaskPage(date: $extra.date, task: $extra);
  }
}
