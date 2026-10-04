// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$logsRoute];

RouteBase get $logsRoute => GoRouteData.$route(
  path: '/logs',
  hasOverriddenOnExit: false,
  factory: $LogsRoute._fromState,
  routes: [
    GoRouteData.$route(
      path: 'new',
      hasOverriddenOnExit: false,
      factory: $NewLogRoute._fromState,
    ),
    GoRouteData.$route(
      path: ':id',
      hasOverriddenOnExit: false,
      factory: $LogDetailsRoute._fromState,
    ),
  ],
);

mixin $LogsRoute on GoRouteData {
  static LogsRoute _fromState(GoRouterState state) => const LogsRoute();

  @override
  String get location => GoRouteData.$location('/logs');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $NewLogRoute on GoRouteData {
  static NewLogRoute _fromState(GoRouterState state) => const NewLogRoute();

  @override
  String get location => GoRouteData.$location('/logs/new');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $LogDetailsRoute on GoRouteData {
  static LogDetailsRoute _fromState(GoRouterState state) =>
      LogDetailsRoute(id: int.parse(state.pathParameters['id']!));

  LogDetailsRoute get _self => this as LogDetailsRoute;

  @override
  String get location => GoRouteData.$location(
    '/logs/${Uri.encodeComponent(_self.id.toString())}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
