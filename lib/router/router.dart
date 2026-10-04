import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:work_log/add_log/view/add_log_page.dart';
import 'package:work_log/log_details/view/log_details_page.dart';
import 'package:work_log/logs/view/logs_page.dart';

part 'router.g.dart';

final goRouter = GoRouter(initialLocation: '/logs', routes: $appRoutes);

@TypedGoRoute<LogsRoute>(
  path: '/logs',
  routes: [
    TypedGoRoute<NewLogRoute>(path: 'new'),
    TypedGoRoute<LogDetailsRoute>(path: ':id'),
  ],
)
class const LogsRoute() extends GoRouteData with $LogsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LogsPage();
  }
}

class const NewLogRoute() extends GoRouteData with $NewLogRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AddLogPage();
  }
}

class const LogDetailsRoute({required final int id})
    extends GoRouteData
    with $LogDetailsRoute {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LogDetailsPage();
  }
}
