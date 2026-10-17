import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:work_log/add_log/add_log.dart';
import 'package:work_log/database/database.dart';
import 'package:work_log/logs/logs.dart';

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
    return const AddLogPage();
  }
}

class const UpdateLogRoute({required final LogTableData $extra})
    extends GoRouteData
    with $UpdateLogRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AddLogPage(log: $extra);
  }
}
