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
      path: 'add',
      hasOverriddenOnExit: false,
      factory: $AddLogRoute._fromState,
    ),
    GoRouteData.$route(
      path: 'details',
      hasOverriddenOnExit: false,
      factory: $UpdateLogRoute._fromState,
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

mixin $AddLogRoute on GoRouteData {
  static AddLogRoute _fromState(GoRouterState state) => const AddLogRoute();

  @override
  String get location => GoRouteData.$location('/logs/add');

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

mixin $UpdateLogRoute on GoRouteData {
  static UpdateLogRoute _fromState(GoRouterState state) =>
      UpdateLogRoute($extra: state.extra! as LogTableData);

  UpdateLogRoute get _self => this as UpdateLogRoute;

  @override
  String get location => GoRouteData.$location('/logs/details');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}
