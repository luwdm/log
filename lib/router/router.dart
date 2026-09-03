import 'package:go_router/go_router.dart';
import 'package:work_log/log_details/view/log_details_page.dart';
import 'package:work_log/logs/view/logs_page.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LogsPage(),
      routes: [
        GoRoute(
          path: ':id',
          builder: (context, state) => const LogDetailsPage(),
        ),
      ],
    ),
  ],
);
